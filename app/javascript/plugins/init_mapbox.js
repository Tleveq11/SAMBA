import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
//import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, duration: 500 });
};
const accessToken = 'pk.eyJ1IjoidGxldmVxMTEiLCJhIjoiY2tsa3Exb2M5MHBuaTJwb2JodmFtczBteSJ9.bH8CBRoMSoXeonilEJm5qg'

const displayJourney = (map, coords) => {
  //on transforme nos coordonées en string pour l'appel de l'API
  const coordsString = coords.join(';');
  //choix du type d'itinéraire que l'on souhaite calculer (par exemple avec "walking" on ne fera pas le tour d'un rond point, avec "driving" si.
  const typeRoute = 'driving'; //cycling, walking, driving-traffic
  const directionsRequest = 'https://api.mapbox.com/directions/v5/mapbox/'+typeRoute+'/' + coordsString + '?geometries=geojson&access_token=' + accessToken;
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
          geometry: route //utilisation de l'itinéraire
        }
      },
      paint: {
        'line-color': "#3399ff", //couleur de la ligne
        'line-width': 4, //epaisseur de la ligne
        'line-opacity': 0.7 //opacité de la ligne
      }
    })
  })
  .catch((error) => {
    console.log('Request failed. error:', error);
  });
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



      new mapboxgl.Marker({
      //color: #EAC100,
      //draggable: true
    })
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

      new mapboxgl.Marker({
       color: "green",
       draggable: true
      })


      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    fitMapToMarkers(map,markers)
    let coords = [[5.400000,43.300000]]

    JSON.parse(mapElement2.dataset.markers).forEach((marker) => {
      coords.push([marker.lng, marker.lat])
    })
    coords.push([5.400000,43.300000])
console.log(coords)
    displayJourney(map, coords)
  }
}



export { initMapbox };




