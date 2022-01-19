
jQuery(document).ready(main)

function main() {
  var map = L.map('map', {}).setView([43.6433, 5432421.8714], 14);

  L.tileLayer('http://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 16,
    atribution: 'Map data &copy; OSM.org'
  }).addTo(map);
}
