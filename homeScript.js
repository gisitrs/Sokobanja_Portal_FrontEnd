//#region initialize objects

/* objects for specific classes*/ 
const cityCoords = [43.7243, 20.6893];

/* second commit */

/* variables for toggle menu visibility */

var mapLegendMenuVisibility = false;

var mapDivPercentageHeight = '100%';
var locationsPanelPercentageHeight = '0%';
var isHiddenLocationPanel = false;
var locationsForCityArray = {};
var citiesArray = [];
var selectedCity = {};

//#endregion

//#region initialize map and wms layers

// initialize map
var map = L.map('map', { attributionControl: false, zoomControl:false }).setView(cityCoords, 7);

// initialize base layers

var osm = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 30,
      attribution:
    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
});

osm.addTo(map);

// add geocoder search
//L.Control.geocoder().addTo(map);

//#endregion

//#region create toggle menu

// toggle menu 

/* Toggle menu functions */

/*function showHidePanels(containerToHide, containerToHide1, containerToShow, visibleVariableValue){
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
}*/

/*function setVisibilityVariable(containerType, visibility){
    if (containerType == "mapLegendContainer"){
        mapLegendMenuVisibility = visibility;
    }
    else if (containerType == "layersContainer"){
        layersMenuVisibility = visibility;
    }
    else if (containerType == "languagesContainer"){
        languagesVisibility = visibility;
    }
}*/

/*function hidePanels(){
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
}*/

/*function showHidePanel(className, visibility){
    document.getElementsByClassName(className)[0].style.visibility = visibility;
}*/

//#endregion


//#region layers panel and zoom to location functions

// zoom to location

function goToPrimaryLocation(){
	// zoomToLocation(cityCoords, 15);
    map.setView(cityCoords, 15);
}

/*function zoomToLocation(zoomValue, locationId){
    var locationName = locationsForCityArray.getLocationNameByLocationId(locationId);
    var locationImageURL = locationsForCityArray.getLocationImageURLByLocationId(locationId);
    var locationXCoord = locationsForCityArray.getLocationXCoordByLocationId(locationId);
    var locationYCoord = locationsForCityArray.getLocationYCoordByLocationId(locationId);
    var locationTypeId = locationsForCityArray.getLocationTypeIdByLocationId(locationId);

    CreateMarker([locationXCoord, locationYCoord], locationName, priorityOneLocationsLayerGroup, 
        markerIconsArray[locationTypeId - 1], locationImageURL, locationTypeId, locationId);

	map.setView([locationXCoord + 0.0012, locationYCoord], zoomValue);
}*/


//#endregion

//#region page layout functions and button for show-hide locations

/* button for show-hide panel with locations */

// showing button for show/hide panel 
const Coordinates = L.Control.extend({
    onAdd: map => {
      const container = L.DomUtil.create("div");
    map.addEventListener("mousemove", e => {
          container.innerHTML = `<h2>Latitude is ${e.latlng.lat.toFixed(4)} <br> and Longitude is  ${e.latlng.lng.toFixed(4)} </h2>`;
         });
      /*container.innerHTML = `<div>
                                <button id="locationsButtonId" 
                                        type="button"
                                        title="Prikaži pun ekran!" 
                                        class="showHideLocations" 
                                        onclick="showHideLocations()" 
                                        style="background: url('./images/fullscreen.png') no-repeat;">
                                </button>`;*/
    return container;
    }
});

map.addControl(new Coordinates({ position: "bottomright" }));

/* page layout functions */

// set even listener for resizing page elements and map legend image
//window.addEventListener('resize', changePageLayout);

/*function changePageLayout(){
    changeMapLegendImage();
    changePageLayout();
}*/

/* change page layout for the map and locations */

/*function changePageLayout(){
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
}*/

/* hide or show location panel */

/*function showHideLocations(){
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
}*/

/* function for resize map and location div */ 

/*function resizeDivElements(mapHeight, mapWidth, panelHeight, panelWidth, marginType, marginValue){
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
}*/

/* panel with locations - slide show -*/
//#endregion

//#region functions for show-hide layers

/* create layer groups for or layers */ 

/*var cityLocationsGroup = L.layerGroup().addTo(map);
var picnicAreasGroup = L.layerGroup().addTo(map);
var waterSpringsGroup = L.layerGroup().addTo(map);
var culturalContentsGroup = L.layerGroup().addTo(map);
var bathsGroup = L.layerGroup().addTo(map);
var parksGroup = L.layerGroup().addTo(map);
var naturalAttractionsGroup = L.layerGroup().addTo(map);
var childrenFacilitiesGroup = L.layerGroup().addTo(map);
var sportsFacilitiesGroup = L.layerGroup().addTo(map);
var thermalSpringsGroup = L.layerGroup().addTo(map);
var touristSitesGroup = L.layerGroup().addTo(map);
var lookoutsGroup = L.layerGroup().addTo(map);
var sightsGroup = L.layerGroup().addTo(map);
var priorityOneLocationsLayerGroup = L.layerGroup().addTo(map);

var locationTypesLayerGroupsArray = [cityLocationsGroup, picnicAreasGroup, waterSpringsGroup,
                                     culturalContentsGroup, bathsGroup, parksGroup,
                                     naturalAttractionsGroup, childrenFacilitiesGroup, sportsFacilitiesGroup,
                                     touristSitesGroup, thermalSpringsGroup, lookoutsGroup, 
                                     sightsGroup]

var zonesGroup = L.layerGroup().addTo(map);
var roadsGroup = L.layerGroup().addTo(map);*/

/*function CreateMarker(coords, markerName, locationsGroup, markerIcon, imageUrlLocation, locationTypeId, locationId){
    tabHeader = dictLocationTypes[locationTypeId];
    var locationLiId = tabHeader + "LiId";
    var locationPanelId = tabHeader + "Panel" + locationId + "Id";

    var aHref = "Info.html?language=" + currentLanguage + "&cityId=" + cityId + "&locationLiId=" + 
                locationLiId + "&locationPanelId=" + locationPanelId;

    marker = L.marker(coords, {
      title: markerName,
      icon: markerIcon
    }).addTo(map);

    marker.bindPopup('<b style="font-size:20px">' + markerName +'</b>' + 
                     '</br>' +
                     '</br>' +
                     '<div>' + 
                        '<img style="width:100%" src="' + imageUrlLocation + '" alt="images"></img>' + 
                        '<a href="' + aHref + '">info</a>' +
                    '</div>',
    {minWidth:250});

    locationsGroup.addLayer(marker);

    if (locationsGroup == priorityOneLocationsLayerGroup){
        marker.openPopup();
    }
}*/

/*function createSimpleMarket(xCoord, yCoord, locationName){
    var markerName = locationName.replace("%20", " ");
    var marker = L.marker([xCoord, yCoord]).addTo(map);

    marker.bindPopup('<b style="font-size:20px">' + markerName +'</b>',
    {minWidth:80});

    marker.openPopup();
}*/

//#endregion