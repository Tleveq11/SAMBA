import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const centerLat = parseFloat(mapElement.dataset.lat);
  const centerLong = parseFloat(mapElement.dataset.long);
  console.log(centerLong)

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [centerLong, centerLat],
      zoom: 7.5
    });
  }
};

export { initMapbox };
