const tabcontents = document.querySelectorAll(".tabcontent");
const tabLinks = document.querySelectorAll(".tabs a");

function openTab(event, tabName){
    /* REMOVE ALL TABCONTENTS */
    tabcontents.forEach((tabcontent) => (tabcontent.style.display = "none"));
    
    /* REMOVE TABLINKS ACTIVE CLASSES */
    tabLinks.forEach((tabLink) => tabLink.classList.remove("active"));

    /* ADD ACTIVE CLASS ON TABLINK AND OPEN IT */
    event.currentTarget.classList.add("active");
    document.getElementById(tabName).style.display = "block";
}

const locations = new Locations();

// initialize map
var map = L.map('map', { zoomControl:false }).setView(locations.SokoBanjaPrimeLocation, 15);

// initialize base layers
var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 30,
      attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
});

osm.addTo(map);