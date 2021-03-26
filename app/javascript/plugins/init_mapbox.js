import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
//import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 100, duration: 500 });
};
const accessToken =
  'pk.eyJ1IjoidGxldmVxMTEiLCJhIjoiY2tsa3Exb2M5MHBuaTJwb2JodmFtczBteSJ9.bH8CBRoMSoXeonilEJm5qg';

const displayJourney = (map, coords) => {
  //on transforme nos coordonées en string pour l'appel de l'API
  const coordsString = coords.join(';');
  //choix du type d'itinéraire que l'on souhaite calculer (par exemple avec "walking" on ne fera pas le tour d'un rond point, avec "driving" si.
  const typeRoute = 'driving'; //cycling, walking, driving-traffic
  const directionsRequest =
    'https://api.mapbox.com/directions/v5/mapbox/' +
    typeRoute +
    '/' +
    coordsString +
    '?geometries=geojson&access_token=' +
    accessToken;
  fetch(directionsRequest)
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      console.log(data);
      //on récupère la données calculé qui nous permettra d'afficher l'itinéraire
      const route = data.routes[0].geometry;
      //add layer
      map.addLayer({
        id: 'journeyReshaped', //identifiant unique de l'objet
        type: 'line',
        source: {
          type: 'geojson',
          data: {
            type: 'Feature',
            geometry: route, //utilisation de l'itinéraire
          },
        },
        paint: {
          'line-color': '#3399ff', //couleur de la ligne
          'line-width': 4, //epaisseur de la ligne
          'line-opacity': 0.7, //opacité de la ligne
        },
      });
    })
    .catch((error) => {
      console.log('Request failed. error:', error);
    });
};

const addCustomMarkersToMap = (markers, map, color) => {
  JSON.parse(markers).forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '20px';
    element.style.height = '20px';
    const markerStyle = {};
    if (color) {
      markerStyle.color = color;
    }
    new mapboxgl.Marker(markerStyle)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    // CREATE MAP
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
    });
    // IF START ADD START
    if (JSON.parse(mapElement.dataset.start).length >= 0) {
      addCustomMarkersToMap(mapElement.dataset.start, map, 'red');
    }
    // IF PLACES ADD PLACES
    if (JSON.parse(mapElement.dataset.places).length >= 0) {
      addCustomMarkersToMap(mapElement.dataset.places, map);
    }
    // IF ACTIVITIES ADD ACTIVITIES
    if (JSON.parse(mapElement.dataset.activities).length >= 0) {
      addCustomMarkersToMap(mapElement.dataset.activities, map, 'green');
    }
    // FIT TO ALL MARKERS
    const allMarkers = [
      ...JSON.parse(mapElement.dataset.places),
      ...JSON.parse(mapElement.dataset.activities),
      ...JSON.parse(mapElement.dataset.start),
    ];
    fitMapToMarkers(map, allMarkers);

    // TRACING
    if (mapElement.dataset.trace === 'true') {
      let coords = [];
      if (mapElement.dataset.start) {
        const point = JSON.parse(mapElement.dataset.start)[0];
        coords.push([point.lng, point.lat]);
      }
      JSON.parse(mapElement.dataset.places).forEach((marker) => {
        coords.push([marker.lng, marker.lat]);
      });
      if (mapElement.dataset.start) {
        coords.push([5.4, 43.3]);
      }
      console.log(coords);
      map.on('load', () => {
        displayJourney(map, coords);
      });
    }
  }
};

export { initMapbox };
