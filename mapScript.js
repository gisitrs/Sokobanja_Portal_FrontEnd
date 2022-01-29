
const locations = new Locations();

/* variables for toggle menu visibility */

var layersMenuVisibility = false;
var mapLegendMenuVisibility = false;

// initialize map
var map = L.map('map', { zoomControl:false }).setView(locations.SokoBanjaPrimeLocation, 15);

// initialize base layers
var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 30,
      attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
});

osm.addTo(map);

// toggle menu 

const ToggleMenu = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
      container.innerHTML = `<input type="checkbox" name="" id="check">
                             <div class="container">
                                <label for="check">
                                    <span class="fas fa-times" id="times" onclick="hidePanels()"></span>
                                    <span class="fas fa-bars" id="bars"></span>
                                </label>
                                <div class="head"><i class="fas fa-bars" style="padding-left:8px;"></i></div>
                                <div class="toggleMenu">
                                    <li>
                                       <button id="layerGroupButton" class="buttonClass" title="Prikaži slojeve!" onclick="showLayersPanel()">
                                          <i class="fas fa-layer-group"></i>
                                        </button>
                                    </li>
                                    <li>
                                        <button id="legendMapButton" title="Prikaži legendu!" class="buttonClass" onclick="showMapLegendPanel()">
                                            <i class="fas fa-map"></i>
                                        </button>
                                    </li>
                                    <li>
                                        <button id="infoPageButtonId" title="Idi na Info stranu!" class="buttonClass" onclick="window.location.href='SokoBanja_Info.html'">
                                            <i class="fas fa-info-circle"></i>
                                        </button>
                                    </li>
                                    <li>
                                        <button id="primeLocationButtonId" title="Vrati na početnu lokaciju!" class="buttonClass" onclick="goToPrimaryLocation()">
                                            <i class="fas fa-map-marked-alt"></i>
                                        </button>
                                    </li>
                                    <li>
                                        <button id="serbianLanguageButtonId" title="Prevedi na srpski jezik!" class="buttonClass">
                                            <img src="./images/Serbia-Flag-icon.png" alt="" class="image-flag"></img>
                                        </button>
                                    </li>
                                    <li>
                                        <button id="primeLocationButtonId" title="Vrati na početnu lokaciju!" class="buttonClass" onclick="goToPrimaryLocation()">
                                            <i class="fas fa-map-marked-alt"></i>
                                        </button>
                                    </li>
                                </div>
                            </div>`; 
  return container;
    }
});

map.addControl(new ToggleMenu({ position: "topleft" }));

/* Toggle menu functions */

function showLayersPanel() {
    showHidePanels('mapLegendContainer', 'layersContainer', layersMenuVisibility);
}

function showMapLegendPanel() {
    showHidePanels('layersContainer', 'mapLegendContainer', mapLegendMenuVisibility);
}

function showHidePanels(containerToHide, containerToShow, visibleVariableValue){
    document.getElementsByClassName(containerToHide)[0].style.visibility = 'hidden';
    setVisibilityVariable(containerToHide, false);

    if (visibleVariableValue == false){
        showHidePanel(containerToShow, 'visible');
        setVisibilityVariable(containerToShow, true);
    }
    else if (visibleVariableValue == true){
        showHidePanel(containerToShow, 'hidden');
        setVisibilityVariable(containerToShow, false);
    }
}

function setVisibilityVariable(containerType, visibility){
    if (containerType == "mapLegendContainer"){
        mapLegendMenuVisibility = visibility;
    }
    else if (containerType == "layersContainer"){
        layersMenuVisibility = visibility;
    }
}

function hidePanels(){
    if (layersMenuVisibility == true){
        showHidePanel('layersContainer', 'hidden');
        layersMenuVisibility = false;
    }
    else if (mapLegendMenuVisibility == true){
        showHidePanel('mapLegendContainer', 'hidden');
        mapLegendMenuVisibility = false;
    }
}

function showHidePanel(className, visibility){
    document.getElementsByClassName(className)[0].style.visibility = visibility;
}

// zoom to location
function goToPrimaryLocation(){
	zoomToLocation(locations.SokoBanjaPrimeLocation, 15);
}

function zoomToLocation(coords, zoomValue){
	map.setView(coords, zoomValue);
  }

/* Layers panel */

const LayersPanel = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
      container.innerHTML = `<div class="layersContainer">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="restaurantsCB">
                                    <label class="form-check-label" for="restaurantsCB" id="restaurantsLabel">
                                        Restorani
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="museumsCB">
                                    <label class="form-check-label" for="museumsCB" id="museumsLabel">
                                        Muzeji
                                    </label>
                                </div>
                            </div>`; 
  return container;
    }
});

map.addControl(new LayersPanel({ position: "topleft" }));

const MapLegendPanel = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
      container.innerHTML = `<div class="mapLegendContainer" style="margin-top:45px;">
                                <img id="mapLegendId" src="./images/SmallLegend.jpg" alt="Map legend"></img>
                            </div>`; 
  return container;
    }
});

map.addControl(new MapLegendPanel({ position: "topleft" }));

// set even listener for resizing page elements and map legend image
window.addEventListener('resize', changeMapLegendImage);

function changeMapLegendImage(){
    if ($(document).height() <= 600 || $(document).width() <= 500){
        document.getElementById("mapLegendId").src = "./images/SmallLegend.jpg";
    }
    else if ($(document).height() > 600 || $(document).width() > 500){
        document.getElementById("mapLegendId").src = "./images/LegendaSlika.jpg";
    }
}


/** GET CURRENT LOCATION **/

/*var map = L.map('map').fitWorld();

var tiles = L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1
}).addTo(map);

function onLocationFound(e) {
    var radius = e.accuracy / 2;

    var locationMarker = L.marker(e.latlng).addTo(map)
        .bindPopup('You are within ' + radius + ' meters from this point').openPopup();

    var locationCircle = L.circle(e.latlng, radius).addTo(map);
}

function onLocationError(e) {
    alert(e.message);
}

map.on('locationfound', onLocationFound);
map.on('locationerror', onLocationError);

map.locate({setView: true, maxZoom: 16});*/

/* TABS MENU JS CODE */

/*const tabcontents = document.querySelectorAll(".tabcontent");
const tabLinks = document.querySelectorAll(".tabs a");

function openTab(event, tabName){*/
    /* REMOVE ALL TABCONTENTS */
    //tabcontents.forEach((tabcontent) => (tabcontent.style.display = "none"));
    
    /* REMOVE TABLINKS ACTIVE CLASSES */
    //tabLinks.forEach((tabLink) => tabLink.classList.remove("active"));

    /* ADD ACTIVE CLASS ON TABLINK AND OPEN IT */
    //event.currentTarget.classList.add("active");
    //document.getElementById(tabName).style.display = "block";
//}