/* objects for specific classes*/ 

const locations = new Locations();
const mapLabelsRS = new MapLabelsRS();
const mapLabelsENG = new MapLabelsENG();

const mapLayerLabelsRS = new MapLayerLabelsRS();
const mapLayerLabelsENG = new MapLayerLabelsENG();

/* enum class for language */
const appLanguages = Object.freeze({
    Serbian: 'Serbian',
    English: 'English'
  });

/* variables for toggle menu visibility */

var layersMenuVisibility = false;
var mapLegendMenuVisibility = false;
var languagesVisibility = false;

/* current language variable */
var currentLanguage = appLanguages.Serbian;

/* variables for map and location div */

var mapDivPercentageHeight = '70%';
var locationsPanelPercentageHeight = '30%';
var isHiddenLocationPanel = false;

/* location images */
var slideIndex = 0;
var imageURLsList = ['./images/img_nature_wide.jpg', './images/img_mountains_wide.jpg', './images/img_snow_wide.jpg'];
var imageHeaderTextRS = ['Lokacija 1', 'Lokacija 2', 'Lokacija 3'];
var imageHeaderTextENG = ['Location 1', 'Location 2', 'Location 3'];

var imageLocationTextRS = ['Opis lokacije 1', 'Opis lokacije 2', 'Opis lokacije 3'];
var imageLocationTextENG = ['Location 1 description', 'Location 2 description', 'Location 3 description'];
var locationCoords = [locations.SokoBanjaPrimeLocation, locations.SokoBanjaFirstLocation, locations.SokoBanjaSecondLocation];
var locationZoomLevels = [15, 16, 16];

var cityLocations = [[43.6262, 5432421.8537], [43.6349, 5432421.8931]];
var picnicAreasCoords = [[43.6429, 5432421.8638], [43.6448, 5432421.8710]];
var waterSpringsCoords = [[43.6428, 5432421.8763], [43.6454, 5432421.8717]];
var culturalContentCoords = [[43.6460, 5432421.8639], [43.6483, 5432421.8814]];
var bathsCoords = [[43.6414, 5432421.8593], [43.6454, 5432421.8617]];
var parksCoords = [[43.6485, 5432421.8597], [43.6418, 5432421.8723]];
var naturalAtractionsCoords = [[43.6499, 5432421.8753], [43.6433, 5432421.8498]];
var childrenFacilitiesCoords = [[43.6462, 5432421.8895], [43.6353, 5432421.8600]];
var sportsFacilitiesCoords = [[43.6383, 5432421.8743], [43.6428, 5432421.8520]];
var thermalSpringsCoords = [[43.6445, 5432421.8857], [43.6486, 5432421.8696]];
var lookoutsCoords = [[43.6439, 5432421.8719], [43.6449, 5432421.8648]];
var sightsCoords = [[43.6068, 5432421.8123], [43.6434, 5432421.8777]];

var cityLocationsText = ['Test', 'Test1'];

// initialize map
var map = L.map('map', { attributionControl: false, zoomControl:false }).setView(locations.SokoBanjaPrimeLocation, 15);

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
                                        <button id="languagesButtonId" title="Izaberi jezik!" class="buttonClass" onclick="showLanguagesPanel()">
                                            <i class="fas fa-language"></i> 
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
    showHidePanels('mapLegendContainer', 'languagesContainer', 'layersContainer', layersMenuVisibility);
}

function showMapLegendPanel() {
    showHidePanels('layersContainer', 'languagesContainer', 'mapLegendContainer', mapLegendMenuVisibility);
}

function showLanguagesPanel() {
    showHidePanels('layersContainer', 'mapLegendContainer', 'languagesContainer', languagesVisibility);
}

function showHidePanels(containerToHide, containerToHide1, containerToShow, visibleVariableValue){
    document.getElementsByClassName(containerToHide)[0].style.visibility = 'hidden';
    setVisibilityVariable(containerToHide, false);

    document.getElementsByClassName(containerToHide1)[0].style.visibility = 'hidden';
    setVisibilityVariable(containerToHide1, false);

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
    else if (containerType == "languagesContainer"){
        languagesVisibility = visibility;
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
    else if (languagesVisibility == true){
        showHidePanel('languagesContainer', 'hidden');
        languagesVisibility = false;
    }
}

function showHidePanel(className, visibility){
    document.getElementsByClassName(className)[0].style.visibility = visibility;
}

function translateOnSerbian(){
    currentLanguage = appLanguages.Serbian;
    translateOnLanguage(mapLabelsRS, mapLayerLabelsRS);
}

function translateOnEnglish(){
    currentLanguage = appLanguages.English;
    translateOnLanguage(mapLabelsENG, mapLayerLabelsENG);
}

function translateOnLanguage(labels, mapLayerLabels){
    translateMapLayerLabels(mapLayerLabels);
    translateMapButtonLabels(labels);
    
    translateLocationsPanelButton();
    translateLocationHeaders();
}

function translateMapLayerLabels(mapLayerLabels){
    document.getElementById("cityLocationsLB").innerHTML = mapLayerLabels.CityLocations;
    document.getElementById("picnicAreasLB").innerHTML = mapLayerLabels.PicnicAreas;
    document.getElementById("waterSpringsLB").innerHTML = mapLayerLabels.WaterSprings;
    document.getElementById("culturalContentLB").innerHTML = mapLayerLabels.CulturalContent;
    document.getElementById("bathsLB").innerHTML = mapLayerLabels.Baths;
    document.getElementById("parksLB").innerHTML = mapLayerLabels.Parks;
    document.getElementById("naturalAttractionsLB").innerHTML = mapLayerLabels.NaturalAttractions;
    document.getElementById("childrenFacilitiesLB").innerHTML = mapLayerLabels.ChildrenFacilities;
    document.getElementById("sportsFacilitiesLB").innerHTML = mapLayerLabels.SportsFacilities;
    document.getElementById("thermalSpringsLB").innerHTML = mapLayerLabels.ThermalSprings;
    document.getElementById("lookoutsLB").innerHTML = mapLayerLabels.Lookouts;
    document.getElementById("sightsLB").innerHTML = mapLayerLabels.Sights;
}

function translateMapButtonLabels(labels){
    document.getElementById("layerGroupButton").title = labels.LayerGroupButtonTitle;
    document.getElementById("legendMapButton").title = labels.LegendMapButtonTitle;
    document.getElementById("infoPageButtonId").title = labels.InfoPageButtonTitle;
    document.getElementById("primeLocationButtonId").title = labels.PrimeLocationButtonTitle;
    document.getElementById("serbianLanguageButtonId").title = labels.SerbianLanguageButtonTitle;
    document.getElementById("englishLanguageButtonId").title = labels.EnglishLanguageButtonTitle;
    document.getElementById("languagesButtonId").title = labels.LanguagesButtonTitle;
}

function translateLocationsPanelButton(){
    if (currentLanguage == appLanguages.Serbian){
        var currentMapLabels = mapLabelsRS;
    }
    else if (currentLanguage == appLanguages.English){
        var currentMapLabels = mapLabelsENG;
    }

    var imageUrl = document.getElementById("locationsButtonId").style.backgroundImage;

    if (imageUrl == 'url("./images/fullscreen.png")'){
        document.getElementById("locationsButtonId").title = currentMapLabels.FullScreenPreview;
    }
    else {
        document.getElementById("locationsButtonId").title = currentMapLabels.ExitFullScreenPreview;
    }
}

function translateLocationHeaders(){
    if (currentLanguage == appLanguages.Serbian){
        var currentImageHeaders = imageHeaderTextRS;
        var currentImageDescriptionText = imageLocationTextRS;
    }
    else if (currentLanguage == appLanguages.English){
        var currentImageHeaders = imageHeaderTextENG;
        var currentImageDescriptionText = imageLocationTextENG;
    }

    document.getElementById('locationImageHeader').innerHTML = currentImageHeaders[slideIndex];
    document.getElementById('locationImageText').innerHTML = currentImageDescriptionText[slideIndex];
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
      container.innerHTML = `<div class="layersContainer" style="OVERFLOW-Y:scroll;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="cityLocationsCB" onclick="showHideCityLayerLocations()">
                                    <label class="form-check-label" for="cityLocationsCB" id="cityLocationsLB">
                                        Gradske lokacije
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="picnicAreasCB" onclick="showHidePicnicAreasLocations()">
                                    <label class="form-check-label" for="picnicAreasCB" id="picnicAreasLB">
                                        Izletišta
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="waterSpringsCB">
                                    <label class="form-check-label" for="waterSpringsCB" id="waterSpringsLB">
                                        Izvorišta
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="culturalContentCB">
                                    <label class="form-check-label" for="culturalContentCB" id="culturalContentLB">
                                        Kulturni sadržaji
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="bathsCB">
                                    <label class="form-check-label" for="bathsCB" id="bathsLB">
                                        Kupališta
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="parksCB">
                                    <label class="form-check-label" for="parksCB" id="parksLB">
                                        Parkovi
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="naturalAttractionsCB">
                                    <label class="form-check-label" for="naturalAttractionsCB" id="naturalAttractionsLB">
                                        Prirodne atrakcije
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="childrenFacilitiesCB">
                                    <label class="form-check-label" for="childrenFacilitiesCB" id="childrenFacilitiesLB">
                                        Sadržaji za decu
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="sportsFacilitiesCB">
                                    <label class="form-check-label" for="sportsFacilitiesCB" id="sportsFacilitiesLB">
                                        Sportski sadržaji
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="thermalSpringsCB">
                                    <label class="form-check-label" for="thermalSpringsCB" id="thermalSpringsLB">
                                        Termalna izvorišta
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="lookoutsCB">
                                    <label class="form-check-label" for="lookoutsCB" id="lookoutsLB">
                                        Vidikovci
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="sightsCB">
                                    <label class="form-check-label" for="sightsCB" id="sightsLB">
                                        Znamenitosti
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

const LanguagesPanel = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
      container.innerHTML = `<div class="languagesContainer">
                                <button id="serbianLanguageButtonId" title="Prevedi na srpski jezik!" class="buttonClass" style="border: none;" onclick="translateOnSerbian()">
                                    <img src="./images/Serbia-Flag-icon.png" alt="" class="image-flag" style="margin-top: 9px;"></img> 
                                </button>
                                <button id="englishLanguageButtonId" title="Prevedi na engleski jezik!" class="buttonClass" style="border: none;" onclick="translateOnEnglish()">
                                    <img src="./images/GBR-flag-icon.png" alt="" class="image-flag" style="margin-top: 9px;"></img>
                                </button>
                            </div>`; 
  return container;
    }
});

map.addControl(new LanguagesPanel({ position: "topleft" }));

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
        document.getElementById("locationPanel").style.visibility='hidden';
        translateLocationsPanelButton();
        isHiddenLocationPanel = true;
    }
    else {
        isHiddenLocationPanel = false;
        document.getElementById("locationsButtonId").style.backgroundImage = "url('./images/fullscreen.png')";
        document.getElementById("locationPanel").style.visibility='visible';
        translateLocationsPanelButton();
        changePageLayout();
    }

    map._onResize(); 
}

function resizeDivElements(mapHeight, mapWidth, panelHeight, panelWidth, marginType, marginValue){
    var mapDiv = document.getElementById('map');
    var locationPanel = document.getElementById('locationPanel');

    mapDiv.style.height = mapHeight;
    mapDiv.style.width = mapWidth;
    locationPanel.style.height = panelHeight;
    locationPanel.style.width = panelWidth;

    if(marginType == 'top'){
        locationPanel.style.right = '0%';
        locationPanel.style.top= marginValue;
    }
    else if (marginType == 'right'){
        locationPanel.style.right = '0%';
        locationPanel.style.top= '0%';
    }
}

// panel with locations
startSlideShow();

function startSlideShow(){
    setTimeout(automaticPlusSlide, 7000);
}

function plusSlides() {
    slideIndex = slideIndex + 1;
    showSlides(false);
}

function minusSlides() {
    slideIndex = slideIndex - 1;
    showSlides(false);
  }

function automaticPlusSlide(){
    slideIndex = slideIndex + 1;
    showSlides(true);
}

function showSlides(isAutomatic) {
    var imageListCount = imageURLsList.length;
    var b = slideIndex;

    if (slideIndex == -1){
        slideIndex = imageListCount - 1;
    }
    else if (slideIndex == imageListCount){
        slideIndex = 0;
    } 

    $("#locationImage").attr("src",imageURLsList[slideIndex]);
    translateLocationHeaders();
    //document.getElementById('locationImageHeader').innerHTML = imageHeaderText[slideIndex];

    if (isAutomatic == true){
        startSlideShow();
    }
}

/* functions for layer locations */

var cityLocationsGroup = L.layerGroup().addTo(map);
var picnicAreasGroup = L.layerGroup().addTo(map);

function showHideCityLayerLocations(){
    if (document.getElementById("cityLocationsCB").checked == true){
        createMarkerGroup(cityLocations, cityLocationsText, cityLocationsGroup);
    }
    else { cityLocationsGroup.clearLayers(); }
}

function showHidePicnicAreasLocations(){
    if (document.getElementById("picnicAreasCB").checked == true){
        createMarkerGroup(picnicAreasCoords, cityLocationsText, picnicAreasGroup);
    }
    else { picnicAreasGroup.clearLayers(); }
}

function createMarkerGroup(listOfCoords, listOfTexts, locationGroup){
    var i = 0;
    for (const element of listOfCoords) {
        CreateMarker(element, listOfTexts[i], locationGroup);
        i++;
    }
}

var greenIcon = L.icon({
    iconUrl: './images/icons8-marker-a-48.png',

    iconSize:     [38, 95], // size of the icon
    iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
    popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});

// create marker
function CreateMarker(coords, markerName, locationsGroup){
    marker = L.marker(coords, {
      title: markerName
    }).addTo(map);

    marker.bindPopup(markerName);

    locationsGroup.addLayer(marker);
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