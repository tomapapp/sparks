import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { duration: 0, padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(mapElement.dataset)
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    const togglebtn = document.getElementById("map-icon-container");
    togglebtn.addEventListener("click", (event) => {
      map.resize()
    })
  }
};

export { initMapbox };
