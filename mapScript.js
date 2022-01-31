
const locations = new Locations();
const mapLabelsRS = new MapLabelsRS();
const mapLabelsENG = new MapLabelsENG();

/* variables for toggle menu visibility */

var layersMenuVisibility = false;
var mapLegendMenuVisibility = false;
var mapDivPercentageHeight = '70%';
	var locationsPanelPercentageHeight = '30%';
var isHiddenLocationPanel = false;

// initialize map
var map = L.map('map', { zoomControl:false }).setView(locations.SokoBanjaPrimeLocation, 15);

// initialize base layers
var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 30,
      attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
});

osm.addTo(map);

// add geocoder search
//L.Control.geocoder().addTo(map);

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
                                        <button id="serbianLanguageButtonId" title="Prevedi na srpski jezik!" class="buttonClass" onclick="translateOnSerbian()">
                                            <img src="./images/Serbia-Flag-icon.png" alt="" class="image-flag"></img> 
                                        </button>
                                    </li>
                                    <li>
                                        <button id="englishLanguageButtonId" title="Prevedi na engleski jezik!" class="buttonClass" onclick="translateOnEnglish()">
                                            <img src="./images/GBR-flag-icon.png" alt="" class="image-flag"></img>
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

function translateOnSerbian(){
    translateOnLanguage(mapLabelsRS);
}

function translateOnEnglish(){
    translateOnLanguage(mapLabelsENG);
}

function translateOnLanguage(labels){
    document.getElementById("restaurantsLabel").innerHTML = labels.RestaurantsLabel;
    document.getElementById("museumsLabel").innerHTML = labels.MuseumsLabel;

    document.getElementById("layerGroupButton").title = labels.LayerGroupButtonTitle;
    document.getElementById("legendMapButton").title = labels.LegendMapButtonTitle;
    document.getElementById("infoPageButtonId").title = labels.InfoPageButtonTitle;
    document.getElementById("primeLocationButtonId").title = labels.PrimeLocationButtonTitle;
    document.getElementById("serbianLanguageButtonId").title = labels.SerbianLanguageButtonTitle;
    document.getElementById("englishLanguageButtonId").title = labels.EnglishLanguageButtonTitle;

    document.getElementById("locationsButtonId").title = labels.FullScreenPreview;
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

/* Button for show-hide panel with locations */
// showing button for show/hide panel 
const Coordinates = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
      /*map.addEventListener("mousemove", e => {
          container.innerHTML = `<h2>Latitude is ${e.latlng.lat.toFixed(4)} <br> and Longitude is  ${e.latlng.lng.toFixed(4)} </h2>`;
         });*/
      container.innerHTML = `<div>
                                <button id="locationsButtonId" 
                                        type="button"
                                        title="Prikaži pun ekran!" 
                                        class="showHideLocations" 
                                        onclick="showHideLocations()" 
                                        style="background: url('./images/fullscreen.png') no-repeat;">
                                </button>`;
    return container;
    }
});

map.addControl(new Coordinates({ position: "bottomright" }));

/* Page layout functions */

// set even listener for resizing page elements and map legend image
window.addEventListener('resize', changePageLayout);

function changePageLayout(){
    changeMapLegendImage();
    changePageLayout();
}

function changeMapLegendImage(){
    if ($(document).height() <= 600 || $(document).width() <= 500){
        document.getElementById("mapLegendId").src = "./images/SmallLegend.jpg";
    }
    else if ($(document).height() > 600 || $(document).width() > 500){
        document.getElementById("mapLegendId").src = "./images/LegendaSlika.jpg";
    }
}

function changePageLayout(){
    if (($(document).height() <= 600 || $(document).width() <= 500) && isHiddenLocationPanel == false){
        resizeDivElements(mapDivPercentageHeight, '100%', locationsPanelPercentageHeight, '100%', 'top', mapDivPercentageHeight);
        layout = 'vertical';
    } 
    else if (($(document).height() <= 600 || $(document).width() <= 500) && isHiddenLocationPanel == true){
        resizeDivElements('100%', '100%', '0%', '0%', 'none', '0%');
        layout = 'vertical';
    }
    else if (($(document).height() > 600 || $(document).width() > 500) && isHiddenLocationPanel == false){
        resizeDivElements('100%', mapDivPercentageHeight, '100%', locationsPanelPercentageHeight, 'right', mapDivPercentageHeight);
        layout = 'horizontal';
    }
    else if (($(document).height() > 600 || $(document).width() > 500) && isHiddenLocationPanel == true){
        resizeDivElements('100%', '100%', '0%', '0%', 'none', '0%');
        layout = 'horizontal';
    }

    map._onResize(); 
}
// hide or show location panel 
function showHideLocations(){
    if (isHiddenLocationPanel == false){
        resizeDivElements('100%', '100%', '0%', '0%', 'none', '0%');
        document.getElementById("locationsButtonId").style.backgroundImage = "url('./images/Exit-full-screen.png')";
        isHiddenLocationPanel = true;
    }
    else {
        isHiddenLocationPanel = false;
        document.getElementById("locationsButtonId").style.backgroundImage = "url('./images/fullscreen.png')";
        changePageLayout();
    }

    map._onResize(); 
}

function resizeDivElements(mapHeight, mapWidth, panelHeight, panelWidth, marginType, marginValue){
    var mapDiv = document.getElementById('map');
    //var locationPanel = document.getElementById('locationPanel');

    mapDiv.style.height = mapHeight;
    mapDiv.style.width = mapWidth;
    //locationPanel.style.height = panelHeight;
    //locationPanel.style.width = panelWidth;

    /*var infoPageButtonMarginLeftValue = $("#map").width() - 125;
    var mapLegendButtonLeftMargin = infoPageButtonMarginLeftValue - 58;

    $("#infoPageButtonId").css("margin-left", infoPageButtonMarginLeftValue + "px");
    $("#mapLegendButtonId").css("margin-left", mapLegendButtonLeftMargin + "px");

    if(marginType == 'top'){
        locationPanel.style.right = '0%';
        locationPanel.style.top= marginValue;
    }
    else if (marginType == 'right'){
        locationPanel.style.right = '0%';
        locationPanel.style.top= '0%';
    }*/
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