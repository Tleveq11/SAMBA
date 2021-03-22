import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
//import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, duration: 500 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const mapElement2 = document.getElementById('map2');


  if (mapElement) { // only build a map if there's a div#map to inject into
    const centerLat = parseFloat(mapElement.dataset.lat);
    const centerLong = parseFloat(mapElement.dataset.long);

   // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
    // center: [centerLong, centerLat],
    // zoom: 9
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '20px';
    element.style.height = '20px';

      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    fitMapToMarkers(map,markers)

  }


  if (mapElement2) { // only build a map if there's a div#map to inject into
    const centerLat2 = parseFloat(mapElement2.dataset.lat);
    const centerLong2 = parseFloat(mapElement2.dataset.long);

   // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }));

// new map

    mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map2',
      style: 'mapbox://styles/mapbox/streets-v10',
    // center: [centerLong, centerLat],
    // zoom: 9
    });
    const markers = JSON.parse(mapElement2.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '20px';
    element.style.height = '20px';

      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    const activities = JSON.parse(mapElement2.dataset.activities);
    activities.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '40px';
    element.style.height = '40px';

      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    fitMapToMarkers(map,markers)

  }


};






export { initMapbox };


//recupere les coodonnées via les markers
//on f un array
//def une methode


