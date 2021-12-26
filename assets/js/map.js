if (!window.requestIdleCallback) {
  window.requestIdleCallback = function (x) {
    window.setTimeout(x, 0);
  }
}

const settings = document.getElementById("settings").dataset;
mapboxgl.accessToken = settings.mapboxAccessToken;

const fitBoundsOpt = {
  padding: {
    top: 35,
    bottom: 35,
    left: 35,
    right: 35
  },
  maxZoom: 17
};

const mapElem = document.getElementById('map');
const map = new mapboxgl.Map({
  container: 'map',
  maxBounds: settings.maxBounds.split(","),
  bounds: settings.initial.split(","),
  fitBoundsOptions: fitBoundsOpt,
  minZoom: 9,
  maxZoom: 19,
  style: 'mapbox://styles/breunigs/ckwpepuex51bt14o5oq42ix9m',
  pitchWithRotate: false,
  dragRotate: false,
  touchPitch: false,
});
map.touchZoomRotate.disableRotation();

const routeLayers = ['vr-line-off-none', 'vr-line-off-p1', 'vr-line-off-m1', 'fr-line', 'rsw-line', 'extra-line'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = {
  layers: routeLayers.concat(articleLayers)
};

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
let videoWasPlaying = false;
let indicatorAnimateTimer = null;
let zoomedInOnce = false;

function renderIndicator() {
  if (state.lon == "" || state.lat == "") return;
  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);
  // const mapActive = map.isMoving() || map.isZooming();

  if (!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
    window.indicator = indicator;
  }

  // const videoPlaying = video && !video.paused;
  // const dist = indicator.getLngLat().distanceTo(lngLat);
  // const animate = !mapActive && dist < 50 && ((videoPlaying && videoWasPlaying) || dist < 10)

  // only update animation status as needed to avoid style recalculations
  // if (animate != !!indicatorAnimateTimer) indicator.getElement().classList.toggle("animate", animate);
  // if (indicatorAnimateTimer) {
  //   clearTimeout(indicatorAnimateTimer);
  //   indicatorAnimateTimer = null;
  // }
  // if (animate) indicatorAnimateTimer = setTimeout(disableIndicatorAnimation, 300);

  // videoWasPlaying = videoPlaying;

  const shortest = closestEquivalentAngle(indicator.getRotation(), state.bearing);

  window.requestAnimationFrame(() => {
    const point = map.project(lngLat);
    indicator.setLngLat(lngLat);
    indicator.setRotation(shortest);
    indicator.getElement().style.transform = `translate(-50% , -50%) translate(${point.x}px, ${point.y}px) rotateZ(${shortest}deg)`;
  });

  // if (!mapActive && !zoomedInOnce && videoPlaying && prevBoundsTs === "") {
  //   zoomedInOnce = true;
  //   const zoom = Math.max(map.getZoom(), 14);
  //   map.flyTo({
  //     center: lngLat,
  //     zoom: zoom
  //   });
  // }
}

const closestEquivalentAngle = (from, to) => {
  const delta = ((((to - from) % 360) + 540) % 360) - 180;
  return from + delta;
}

const disableIndicatorAnimation = () => {
  if (!indicator) return;
  indicator.getElement().classList.toggle("animate", false)
  if (!indicatorAnimateTimer) return;
  clearTimeout(indicatorAnimateTimer);
  indicatorAnimateTimer = null;
}

const ensureIndicatorInView = () => {
  if (map.isMoving() || map.isZooming() || !indicator) {
    return;
  }

  if (map.getBounds().contains(indicator.getLngLat())) {
    return;
  }

  const indiRect = indicator.getElement().getBoundingClientRect();
  const indiPos = {
    x: indiRect.left + indiRect.width / 2,
    y: indiRect.top + indiRect.height / 2
  };

  const mapRect = mapElem.getBoundingClientRect();
  const cmp = (padding) => {
    return indiPos.y <= mapRect.top + padding ||
      indiPos.y >= mapRect.bottom - padding ||
      indiPos.x <= mapRect.left + padding ||
      indiPos.x >= mapRect.right - padding;
  }

  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);
  const veryFarOutside = cmp(-200);
  if (veryFarOutside) {
    console.debug("Flying to location", lngLat)
    map.flyTo({
      center: lngLat
    });
  } else {
    console.debug("Panning to location", lngLat)
    map.panTo(lngLat);
  }
}

const isVideoPlaying = () => {
  const vid = document.getElementById("videoInner");
  return vid && !vid.paused;
}

let indicatorFocus = null;
let prevIndicatorPos = '';
const maybeEnsureIndicatorInView = () => {
  const playing = isVideoPlaying();
  if (playing && indicatorFocus === null) {
    indicatorFocus = setInterval(ensureIndicatorInView, 2000);
  } else if (!playing && indicatorFocus !== null) {
    clearInterval(indicatorFocus);
    indicatorFocus = null;
  } else if (indicator && prevIndicatorPos !== `${state.lon},${state.lat}`) {
    // console.debug("indicator present, and changed, ensuring it's in view", indicator)
    if (prevIndicatorPos !== '') {
      window.requestAnimationFrame(ensureIndicatorInView);
    }
    prevIndicatorPos = `${state.lon},${state.lat}`;
  }
}


let prevBoundsTs = "";
const maybeFitBounds = () => {
  if (prevBoundsTs == state.boundsTs || state.bounds == "") {
    return;
  }
  console.debug("Bounds have changed to", state.bounds)
  prevBoundsTs = state.boundsTs;
  map.fitBounds(state.bounds.split(","), fitBoundsOpt);
}

const clickLeniency = 'ontouchstart' in window ? 10 : 3;
const itemsUnderCursor = (evt) => {
  let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
  // be more lenient with click targets
  if (!routes.length) {
    const sw = [evt.point.x - clickLeniency, evt.point.y + clickLeniency];
    const ne = [evt.point.x + clickLeniency, evt.point.y - clickLeniency];
    routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
  }
  return routes;
}


let pingIndicator = null;
const maybePing = () => {
  if (!state.ping) {
    if (pingIndicator) pingIndicator.getElement().style.opacity = '0';
    return;
  }

  const split = state.ping.split(",");
  const lngLat = new mapboxgl.LngLat(split[0], split[1]);

  if (!pingIndicator) {
    const el = genDiv('ping-indicator');
    pingIndicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
  } else {
    pingIndicator.getElement().style.opacity = '1';
    pingIndicator.setLngLat(lngLat)
  }
}

const titleForItem = (item) => {
  const props = item.properties;
  if (props.title) return props.title
  if (props.route_group) return `${props.route_group} ${props.route_id}`
  return null
}

const handleMapHover = (evt) => {
  const items = itemsUnderCursor(evt);
  const canvas = map.getCanvas()

  const titles = items.map(item => titleForItem(item)).filter(item => item)
  if (titles.length === 0) {
    canvas.style.cursor = '';
    canvas.title = '';
    return;
  }

  canvas.style.cursor = 'pointer';
  canvas.title = [...new Set(titles)].join("\n")
}

const handleMapClick = (evt) => {
  const items = itemsUnderCursor(evt);

  let route = null;
  let article = null;
  items.forEach(r => {
    if (r.properties.route_id && routeLayers.includes(r.layer.id)) {
      route = route || r.properties.route_id;
    } else if (r.properties.name && (routeLayers + articleLayers).includes(r.layer.id)) {
      article = article || r.properties.name;
    }
  });

  if (route === null && article === null) return;

  window.pushEvent("map-click", {
    route: route,
    article: article,
    lon: evt.lngLat.lng,
    lat: evt.lngLat.lat,
    zoom: map.getZoom()
  })
}

let boundsTimeout = null;
const sendBounds = () => {
  if (boundsTimeout) clearTimeout(boundsTimeout);
  boundsTimeout = setTimeout(() => {
    window.pushEvent("map-bounds", {
      bounds: map.getBounds().toArray()
    });
  }, 200);
}

const layerConfig = {
  alltag: {
    line: ['vr-line-off-p1', 'vr-line-off-m1', 'vr-line-off-none'],
    icon: ['vr-oneway', 'vr-sign']
  },

  freizeit: {
    line: ['fr-line'],
    icon: ['fr-oneway', 'fr-sign', 'fr-warning-icons']
  },

  rsw: {
    line: ['rsw-line']
  }
}

// hard codes only, everything else will be optimized for nice display
// depending on opacity status
const layerLineCaps = {
  'vr-line-off-p1': 'butt',
  'vr-line-off-m1': 'butt'
}

const layerAbove = {
  line: "detour-line",
  icon: "article-areas title"
}

const hiddenOpacityRule = ["interpolate", ["linear"],
  ["zoom"], 11, 0, 20, 1
];

function setLayerVisibility() {
  const visibleTypes = state.visibleTypes.split(",");
  Object.keys(layerConfig).forEach(type => {
    const visibleType = visibleTypes.indexOf(type) >= 0;
    const opacity = visibleType ? 1 : hiddenOpacityRule;

    const layers = layerConfig[type];
    Object.keys(layers).forEach(drawPrimitive => {
      layers[drawPrimitive].forEach(layerName => {
        const visible = visibleType || drawPrimitive == 'line' ? 'visible' : 'none';
        map.setLayoutProperty(layerName, "visibility", visible, {
          validate: false
        });

        map.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
          validate: false
        });

        if (drawPrimitive == 'line') {
          const lineCap = layerLineCaps[layerName] || (visibleType ? "round" : "butt");
          map.setLayoutProperty(layerName, "line-cap", lineCap, {
            validate: false
          })
        }

        if (visibleType && drawPrimitive == 'line' && layerName.indexOf('line') >= 0) {
          // console.log("moving", layerName, "above", layerAbove[drawPrimitive])
          map.moveLayer(layerName, layerAbove[drawPrimitive]);
        }

      }); // layers
    }); // drawPrimitives
  }); // layerConfig
}

let mapLoaded = false;
map.on('style.load', () => {
  mapLoaded = true;
  runQueuedUpdate();

  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);

  map.on('movestart', disableIndicatorAnimation);
  map.on('zoomstart', disableIndicatorAnimation);
});

let video = null;
let videoCoords = null;
window.mapUpdateIndicatorFromVideo = (vid, coords) => {
  video = vid;
  videoCoords = coords;
  updateVideoIndicator();
}

window.updateIndicatorPos = (lat, lon, bear) => {
  state.lon = lon
  state.lat = lat;

  state.bearing = bear
  renderIndicator();
  ensureIndicatorInView();
}

function toRad(degrees) {
  return degrees * Math.PI / 180;
};

function ToDeg(radians) {
  return radians * 180 / Math.PI;
}

function calcBearing(fromLon, fromLat, toLon, toLat) {
  fromLon = toRad(fromLon);
  fromLat = toRad(fromLat);
  toLon = toRad(toLon);
  toLat = toRad(toLat);

  const y = Math.sin(toLon - fromLon) * Math.cos(toLat);
  const x = Math.cos(fromLat) * Math.sin(toLat) -
    Math.sin(fromLat) * Math.cos(toLat) * Math.cos(toLon - fromLon);
  const bearing = Math.atan2(y, x);
  return ToDeg(bearing);
}

let prevCoordVideoIndex = 0;

function maybeHackStateFromVideo() {
  if (!video || !videoCoords || !state.videoHash || Number.isNaN(video.duration)) return;

  const curr = video.currentTime + 0.250;
  let nextIdx = videoCoords[prevCoordVideoIndex] <= curr ? prevCoordVideoIndex : 0;
  for (; nextIdx < videoCoords.length - 3; nextIdx += 3) {
    if (videoCoords[nextIdx] >= curr) break;
  }
  prevCoordVideoIndex = nextIdx;

  if (nextIdx == 0) {
    state.lon = videoCoords[1]
    state.lat = videoCoords[2];

    state.bearing = calcBearing(videoCoords[1], videoCoords[2], videoCoords[4], videoCoords[5])

  } else {
    const [nextT, nextLon, nextLat] = [videoCoords[nextIdx], videoCoords[nextIdx + 1], videoCoords[nextIdx + 2]];
    const [prevT, prevLon, prevLat] = [videoCoords[nextIdx - 3], videoCoords[nextIdx - 2], videoCoords[nextIdx - 1]];

    // interpolate
    const t = Math.min(1, (curr - prevT) / (nextT - prevT));
    state.lat = prevLat + t * (nextLat - prevLat)
    state.lon = prevLon + t * (nextLon - prevLon)

    state.bearing = calcBearing(prevLon, prevLat, nextLon, nextLat)
  }
}

window.map = map;

function updateVideoIndicator() {
  maybeHackStateFromVideo();
  renderIndicator();
  maybeEnsureIndicatorInView();
}

function runQueuedUpdate() {
  queued = false;
  maybeFitBounds();
  updateVideoIndicator();
  setLayerVisibility();
  maybePing();
}

let queued = false;
window.mapStateChanged = () => {
  if (queued) return;
  queued = true;
  // it will automatically be run once the map loads
  if (!mapLoaded) return;
  window.requestIdleCallback(runQueuedUpdate, {
    timeout: 100
  })
}
