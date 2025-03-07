import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const firstMarker = this.markersValue[0]
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11', // style URL
      center: [firstMarker.lng, firstMarker.lat], // Center the map on the first marker
      zoom: 14 // starting zoom
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.#drawLineBetweenMarkers()
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat])
    })
    this.map.fitBounds(bounds, { padding: 50, maxZoom: 15, duration: 10 })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    })
  }

  // #drawLineBetweenMarkers() {
  //   const coordinates = this.markersValue.map(marker => [marker.lng, marker.lat])
  //   this.map.on('load', () => {
  //     this.map.addSource('route', {
  //       'type': 'geojson',
  //       'data': {
  //         'type': 'Feature',
  //         'properties': {},
  //         'geometry': {
  //           'type': 'LineString',
  //           'coordinates': coordinates
  //         }
  //       }
  //     })
  //     this.map.addLayer({
  //       'id': 'route',
  //       'type': 'line',
  //       'source': 'route',
  //       'layout': {
  //         'line-join': 'round',
  //         'line-cap': 'round'
  //       },
  //       'paint': {
  //         'line-color': '#888',
  //         'line-width': 6
  //       }
  //     })
  //   })
}
