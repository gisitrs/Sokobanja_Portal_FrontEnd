//#region initialize objects and variables

/* objects for specific classes*/ 

var layerLabelsRS = new MapLayerLabelsRS();
var layerLabelsENG = new MapLayerLabelsENG();

var currentMapLabels = new MapLabelsRS();
var serbianMapLabels = new MapLabelsRS();
var englishMapLabels = new MapLabelsENG();

const apiUrladdress = new APIUrls();
var locationsForCityArray = {};
var locationLiId = "cityLocationsLiId";
var locationPanelId = "";

var htmlContent = "";
var collapseId = "";
var panelId = "";
var panel1Id = "";
var imageId = "";

var paneltextId = "";
var panel1TextId = "";
var webLinkId = "";
var webLink1Id = "";

var facebookLinkId = "";
var facebookLink1Id = "";
var instagramLinkId = "";
var instagramLink1Id = "";
var locationLinkId = "";
var locationLink1Id = "";

var facebookLinkValue = "";
var instagramLinkValue = "";

var contactTextId = "";
var contactText1Id = "";
var dataParentId = "";

var tabParentId = "";
var tabHeader = "";
var tabHeaderTextId = "";
var tabHeaderTextValue = "";

var tabname = "";
var tabValues = [];
var tabValuesList = [];

/* enum class for language */
const appLanguages = Object.freeze({
    Serbian: 'Serbian',
    English: 'English'
});

var locationTypesArray = [];
var dictLocationTypes = new Object();

// or the shorthand way
var dictLocationTypes = {
  1: "cityLocations",
  2: "picnicAreas",
  3: "waterSprings",
  4: "culturalContent",
  5: "baths",
  6: "parks",
  7: "naturalAttractions",
  8: "childrenFacilities",
  9: "sportsFacilities",
  10: "thermalSprings",
  11: "touristBenefits",
  12: "lookouts",
  13: "sights"
};

// or the shorthand way
var dictLocationLiIds = {
  "cityLocationsLiId": 0,
  "picnicAreasLiId": 0,
  "waterSpringsLiId": 0,
  "culturalContentLiId": 0,
  "bathsLiId": 340,
  "parksLiId": 340,
  "naturalAttractionsLiId": 340,
  "childrenFacilitiesLiId": 340,
  "sportsFacilitiesLiId": 680,
  "thermalSpringsLiId": 680,
  "touristBenefitsLiId": 680,
  "lookoutsLiId": 680,
  "sightsLiId": 740
};

var currentLanguage = appLanguages.Serbian;
var currentLayerlabels = layerLabelsRS;

//#endregion

//#region set text values for languages

function updateLocationTypesText() {
  $('#cityLocationsLiId').prop('title', currentLayerlabels.CityLocations);
  $('#picnicAreasLiId').prop('title', currentLayerlabels.PicnicAreas);
  $('#waterSpringsLiId').prop('title', currentLayerlabels.WaterSprings);
  $('#culturalContentLiId').prop('title', currentLayerlabels.CulturalContent);
  $('#bathsLiId').prop('title', currentLayerlabels.Baths);
  $('#parksLiId').prop('title', currentLayerlabels.Parks);
  $('#naturalAttractionsLiId').prop('title', currentLayerlabels.NaturalAttractions);
  $('#childrenFacilitiesLiId').prop('title', currentLayerlabels.ChildrenFacilities);
  $('#sportsFacilitiesLiId').prop('title', currentLayerlabels.SportsFacilities);
  $('#thermalSpringsLiId').prop('title', currentLayerlabels.ThermalSprings);
  $('#lookoutsLiId').prop('title', currentLayerlabels.Lookouts);
  $('#sightsLiId').prop('title', currentLayerlabels.Sights);

  $('#cityLocationsLbId').text(currentLayerlabels.CityLocationsShort);
  $('#picnicAreasLbId').text(currentLayerlabels.PicnicAreasShort);
  $('#waterSpringsLbId').text(currentLayerlabels.WaterSpringsShort);
  $('#culturalContentLbId').text(currentLayerlabels.CulturalContentShort);
  $('#bathsLbId').text(currentLayerlabels.Baths);
  $('#parksLbId').text(currentLayerlabels.Parks);
  $('#naturalAttractionsLbId').text(currentLayerlabels.NaturalAttractionsShort);
  $('#childrenFacilitiesLbId').text(currentLayerlabels.ChildrenFacilitiesShort);
  $('#sportsFacilitiesLbId').text(currentLayerlabels.SportsFacilitiesShort);
  $('#thermalSpringsLbId').text(currentLayerlabels.ThermalSpringsShort);
  $('#lookoutsLbId').text(currentLayerlabels.Lookouts);
  $('#sightsLbId').text(currentLayerlabels.Sights);
}

 function updateButtonTitles(){
    $('#serbianLanguageButtonId').prop('title', currentMapLabels.SerbianLanguageButtonTitle);
    $('#englishLanguageButtonId').prop('title', currentMapLabels.EnglishLanguageButtonTitle);
    $('#mapLegendButtonId').prop('title', currentMapLabels.MapPageButtonTitle);
   }

function translateOnSerbian(){
  currentLanguage = appLanguages.Serbian;
  currentLayerlabels = layerLabelsRS;
  currentMapLabels = serbianMapLabels;
  updateTextValuesForSelectedLanguage();
}

function translateOnEnglish(){
  currentLanguage = appLanguages.English;
  currentLayerlabels = layerLabelsENG;
  currentMapLabels = englishMapLabels;
  updateTextValuesForSelectedLanguage();
}

function updateTextValues(){
  locationTypesArray.forEach((locationType) => {
    tabHeader = dictLocationTypes[locationType.id];
    var lttabHeader = tabHeader + "Header";
    var headerText = "";

    if (currentLanguage == appLanguages.English){
      headerText = locationType.description;
    }
    else if (currentLanguage == appLanguages.Serbian){
      headerText = locationType.name;
    }

    document.getElementById(lttabHeader).innerHTML = headerText;

    tabValues = locationsForCityArray.getLocationsByTypeId(locationType.id);

    tabValues.forEach((location) => {
      panelTextId = tabHeader + "Panel" + location.location_id + "TextId";
      panel1TextId = tabHeader + "Panel1" + location.location_id + "TextId";
      var descriptionValue = "";

      if (currentLanguage == appLanguages.English){
        descriptionValue = location.description_eng;
      }
      else if (currentLanguage == appLanguages.Serbian){
        descriptionValue = location.description;
      }

      /* update text value */
      document.getElementById(panelTextId).textContent = descriptionValue;
      document.getElementById(panel1TextId).textContent = descriptionValue;
    })
  })
}

function setLocationTypeHeaders(){
  locationTypesArray.forEach((locationType) => {
    tabHeader = dictLocationTypes[locationType.id];
    var lttabHeader = tabHeader + "Header";
    var headerText = "";

    if (currentLanguage == appLanguages.English){
      headerText = locationType.description;
    }
    else if (currentLanguage == appLanguages.Serbian){
      headerText = locationType.name;
    }

    document.getElementById(lttabHeader).innerHTML = locationType.name;
  })
}

/* translate text values and set page layout */
function updateTextValuesForSelectedLanguage() {
  updateTextValues();
  updateLocationTypesText();
  updateButtonTitles();
}

function goToMapPage(locationLinkId){
  var locationLink = '';
  var locationId = '';
  var locationIdValue = '';

  var url = "Map.html?language=" + currentLanguage;

  if (locationLinkId != 'pL'){
    //let linkContents = locationLinkId;

    if(locationLinkId.id.includes("LocationLinkA")){
      locationLink = locationLinkId.id.split("LocationLinkA")[0];
      locationId = locationLinkId.id.split("LocationLinkA")[1];
    }
    else{
      locationLink = locationLinkId.id.split("LocationLink")[0];
      locationId = locationLinkId.id.split("LocationLink")[1];
    }
    
    locationIdValue = locationId.split("Id")[0];

    url = url + "&locationLink=" + locationLink + "&locationId=" + locationIdValue;
  }

  window.location.href= url;
}

//#endregion

//#region get data from api

// Defining async function

async function getLocationsAPI(url) {
    
  // Storing response
  const response = await fetch(url);
  
  // Storing data in form of JSON
  if (response){
      var data = await response.json();
      locationsForCityArray = new LocationsTest(data);

      createHtmlElements();
      changePageLayout();
      setLocationTypeHeaders();

      document.getElementById(locationLiId).click(); 

      if (locationPanelId != ""){
        if ($(document).width() <= 1000){
          document.getElementById(locationPanelId).click();
        }

        //var locationTopOffset = document.getElementById(locationPanelId).offsetTop; "sightsPanel173IdsightsPanel173Id" 
        var divLocationId = "test" + locationPanelId;
        //alert(locationPanelId); 
        
        var locationTopOffset = document.getElementById(divLocationId).offsetTop - 50;
        var divHeight = document.getElementById(divLocationId).offsetHeight;
        var newLocationOffset = locationTopOffset; 

        if ($(document).width() > 1000){
          newLocationOffset = newLocationOffset - 130;
        }

        var documentHeight = $(document).height();
        var bodyOffset = 0;

        if ((locationTopOffset + divHeight) > documentHeight){
          bodyOffset = documentHeight;
        }

        alert("Original Div offset = " + locationTopOffset + " New Div offset = " + newLocationOffset + " Div height " + divHeight  + "  Page height =  " + $(document).height());

        if (locationTopOffset < 300){
          locationTopOffset = 70;
        }

        //locationTopOffset = $(document).height() - locationTopOffset;
        
        var locationLeftOffset = dictLocationLiIds[locationLiId];

        $('#tabContentId').animate({
          scrollTop: locationTopOffset
        }, 1000);

        $('html,body').animate({
          scrollTop: bodyOffset
        }, 1000);

        $('#tabPanelId').animate({
          scrollLeft: locationLeftOffset
        }, 1000);
      }

      updateTextValuesForSelectedLanguage();
  }
}

async function getLocationTypesAPI(url) {
  
  // Storing response
  const response = await fetch(url);
  
  // Storing data in form of JSON
  if (response){
      var data = await response.json();
      locationTypesArray = data;
  }
}

//#endregion

//#region initialize map and wms layers

//#region create toggle and pill menu '<li><a data-toggle="pill" id="touristGuidesLiId" href="#touristGuides">' + textTab3 + '</a></li>' '<li><a data-toggle="pill" id="restaurantsLiId" href="#restaurants">' + textTab1 + '</a></li>'
function createTabContent(){
  var divContent = '<li><a data-toggle="pill" id="cityLocationsLiId" href="#cityLocations" title="Gradske lokacije"><img src="./images/Markers/CityLocations.png" width="47" /><p id="cityLocationsLbId">Lokacije</p></a></li>' +
                   '<li><a data-toggle="pill" id="picnicAreasLiId" href="#picnicAreas" title="Izletišta"><img src="./images/Markers/PicnicAreas.png" width="47" /><p id="picnicAreasLbId">Izletišta</p></a></li>' + 
                   '<li><a data-toggle="pill" id="waterSpringsLiId" href="#waterSprings" title="Izvorišta"><img src="./images/Markers/WaterSprings.png" width="47" /><p id="waterSpringsLbId">Izvorišta</p></a></li>' +
                   '<li><a data-toggle="pill" id="culturalContentLiId" href="#culturalContent" title="Kulturni sadržaj"><img src="./images/Markers/CulturalContent.png" width="47"/><p id="culturalContentLbId">Kultura</p></a></li>' +
                   '<li><a data-toggle="pill" id="bathsLiId" href="#baths" title="Kupališta"><img src="./images/Markers/Baths.png" width="47" /><p id="bathsLbId">Kupališta</p></a></li>' +
                   '<li><a data-toggle="pill" id="parksLiId" href="#parks" title="Parkovi"><img src="./images/Markers/Parks.png" width="47" /><p id="parksLbId">Parkovi</p></a></li>' +
                   '<li><a data-toggle="pill" id="naturalAttractionsLiId" href="#naturalAttractions" title="Prirodne atrakcije"><img src="./images/Markers/NaturalAttractions.png" width="47"/><p id="naturalAttractionsLbId">Atrakcije</p></a></li>' +
                   '<li><a data-toggle="pill" id="childrenFacilitiesLiId" href="#childrenFacilities" title="Dečiji sadržaji"><img src="./images/Markers/ChildrenFacilities.png" width="47" /><p id="childrenFacilitiesLbId">Igrališta</p></a></li>' +
                   '<li><a data-toggle="pill" id="sportsFacilitiesLiId" href="#sportsFacilities" title="Sportski sadržaji"><img src="./images/Markers/SportsFacilities.png" width="47" /><p id="sportsFacilitiesLbId">Sport</p></a></li>' + 
                   '<li><a data-toggle="pill" id="thermalSpringsLiId" href="#thermalSprings" title="Termalna izvorišta"><img src="./images/Markers/ThermalSprings.png" width="47" /><p id="thermalSpringsLbId">Spa</p></a></li>' +
                   '<li><a data-toggle="pill" id="lookoutsLiId" href="#lookouts" title="Vidikovci"><img src="./images/Markers/Lookouts.png" width="47"/><p id="lookoutsLbId">Vidikovci</p></a></li>' +
                   '<li><a data-toggle="pill" id="sightsLiId" href="#sights" title="Znamenitosti"><img src="./images/Markers/Sights.png" width="47" /><p id="sightsLbId">Znamenitosti</p></a></li>';
    return divContent;
}

/* create div content for toggle menu href="javascript:goToMapPage(' + xCoord + "," + yCoord + ",'" + headerText + "'" + ')" */
function createDivContent(dataParentId, collapseId, panelId, panel1Id, 
  imageId, panelTextId, panel1TextId, webLinkId, 
  webLink1Id, facebookLinkId, facebookLink1Id, contactTextId, 
  contactText1Id, locationLinkId, locationLink1Id, imageSource,
  headerText, descriptionText, xCoord, yCoord, facebookLinkValue, facebookVisibility,
  instagramLinkId, instagramLink1Id, instagramVisibility)
  {
  var divContent = '<div id="test' + panelId + '" class="panel panel-default">' +
                      '<div class="panel-heading">' +
                        '<h4 class="header-text">' +
                          '<div id="' + panel1Id + '">' + headerText + '</div></a>' + 
                        '</h4>' +
                        '<h4 class="panel-title">'   +
                          '<a data-toggle="collapse" data-parent="#' + dataParentId + '" href="#' + collapseId + '">' + 
                          '<div id="' + panelId + '">' + headerText + '</div></a>' + 
                        '</h4>' +
                        '<div class="panel-body">' +
                          '<div class="row">'+
                            '<div class="col-md-3">' + 
                              '<div><img id="' + imageId + '" src="' + imageSource + '" alt="..."></div>' + 
                            '</div>'+
                            '<div class="col-md-9">'+
                              '<div id="' + panel1TextId + '">' + descriptionText + '</div>'+
                              '</br>' +
                              '<div id="' + contactTextId + '"></div>'+
                              '</br>' +
                              '<div class="row">' +
                                '<div class="col-md-9">' +
                                  '<a id="' + webLink1Id + '" href=""></a>' +
                                '</div>' +
                                '<div class="col-md-1">' +
                                  '<a id="' + locationLink1Id + '" href="javascript:goToMapPage(' + locationLink1Id + ')" title="" style="visibility: visible"><img src="./images/MapImage.png" class="img-responsive"></a>' +
                                '</div>' +
                                '<div class="col-md-1">' +
                                  '<a id="' + facebookLinkId + '" href="' + facebookLinkValue + '" title="" style="visibility:' + facebookVisibility + '"><img src="./images/facebook-icon.png" class="img-responsive"></a>' +
                                '</div>' +
                                '<div class="col-md-1">' +
                                  '<a id="' + instagramLinkId + '" href="' + instagramLinkValue + '" title="" style="visibility:' + instagramVisibility + '"><img src="./images/instagram-icon.jfif" class="img-responsive"></a>' +
                                '</div>' +
                              '</div>' +
                            '</div>'+
                          '</div> '+
                        '</div>' + 
                      '</div>'+
                      '<div id="' + collapseId + '" class="panel-collapse collapse">' +
                        '<div class="panel-body">' +
                          '<div id="' + panelTextId + '" class="panel-body-small-size">' + descriptionText + '</div>' +
                          '</br>' +
                          '<div id="' + contactText1Id + '" class="panel-body-small-size"></div>'+
                          '</br>' + 
                          '<div class="row">' +
                            '<div class="col-xs-3">' +
                              '<a id="' + webLinkId + '" class="panel-body-small-size" href="" style="visibility: hidden"></a>' +
                            '</div>' +
                           '</div>' +
                           '<div class="row">' +
                            '<div class="col-xs-4">' +
                                '<a id="' + locationLinkId + '" href="javascript:goToMapPage(' + locationLinkId + ')" title="" style="visibility: visible" class="panel-body-small-size"><img src="./images/MapImage.png" class="img-responsive"></a>' +
                            '</div>' +
                            '<div class="col-xs-4">' +
                                '<a id="' + facebookLink1Id + '" href="' + facebookLinkValue + '" title="" style="visibility:' + facebookVisibility + '; height: 0%;" class="panel-body-small-size"><img src="./images/facebook-icon.png" class="img-responsive"></a>' +
                            '</div>' +
                            '<div class="col-xs-4">' +
                                '<a id="' + instagramLink1Id + '" href="' + instagramLinkValue + '" title="" style="visibility:' + instagramVisibility + '; height: 0%;" class="panel-body-small-size"><img src="./images/instagram-icon.jfif" class="img-responsive"></a>' +
                            '</div>' +
                           '</div>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>';
    return divContent;
}

/* create html elements on the Info page */ 
function createHtmlElements(){
  locationTypesArray.forEach((locationType) => {
    tabHeader = dictLocationTypes[locationType.id];
    dataParentId = tabHeader + "Panel";
    tabHeaderTextId = tabHeader + "Header";
    tabHeaderTextValue = tabHeader;
    tabValues = locationsForCityArray.getLocationsByTypeId(locationType.id);

    tabValues.forEach((location) => {
      collapseId = tabHeader + "Collapse" + location.location_id;
      panelId = tabHeader + "Panel" + location.location_id + "Id";
      panel1Id = tabHeader + "Panel1" + location.location_id + "Id";
      imageId = tabHeader + "Image" + location.location_id + "Id";
      panelTextId = tabHeader + "Panel" + location.location_id + "TextId";
      panel1TextId = tabHeader + "Panel1" + location.location_id + "TextId";
      webLinkId = tabHeader + "WebLink" + location.location_id + "Id";
      webLink1Id = tabHeader + "WebLink1" + location.location_id + "Id";
      facebookLinkId = tabHeader + "FacebookLink" + location.location_id + "Id";
      facebookLink1Id = tabHeader + "FacebookLink1" + location.location_id + "Id";
      instagramLinkId = tabHeader + "InstagramLink" + location.location_id + "Id";
      instagramLink1Id = tabHeader + "InstagramLink1" + location.location_id + "Id";
      locationLinkId = tabHeader + "LocationLink" + location.location_id + "Id";
      locationLink1Id = tabHeader + "LocationLinkA" + location.location_id + "Id";

      contactTextId = tabHeader + "ContactText" + location.location_id + "Id";
      contactText1Id = tabHeader + "ContactText1" + location.location_id + "Id";

      var smallImageURL = location.image_url_location.split('.jpg')[0] + '_small.jpg';

      var locationFacebookLink = location.facebook_link;
      var facebookVisibility = 'hidden';

      if (locationFacebookLink != null){
        facebookLinkValue = locationFacebookLink;
        facebookVisibility = 'visible';
      }
      else{
        facebookLinkValue = '#';
      }

      var locationInstagramLink = location.instagram_link;
      var instagramVisibility = 'hidden';

      if (locationInstagramLink != null){
        instagramLinkValue = locationInstagramLink;
        instagramVisibility = 'visible';
      }
      else{
        instagramLinkValue = '#';
      }

      var divContent = createDivContent(dataParentId, collapseId, panelId, panel1Id, 
                                        imageId, panelTextId, panel1TextId, webLinkId, 
                                        webLink1Id, facebookLinkId, facebookLink1Id, contactTextId, 
                                        contactText1Id, locationLinkId, locationLink1Id, smallImageURL,
                                        location.name, location.description, location.x_coord, location.y_coord,
                                        facebookLinkValue, facebookVisibility, instagramLinkId, instagramLink1Id, instagramVisibility);

      htmlContent = htmlContent + divContent;

      $("#" + dataParentId).html(htmlContent);
    })

    htmlContent = "";
  })
}

/* set page layout */
function changePageLayout(){
    /*if ($(document).width() <= 1000){
      $('.panel-body-small-size').show(); 
      $('.panel-title').show();

      $('.header-text').hide();
      $('.col-md-9').hide();
    } 
    else if($(document).width() > 1000){
      $('.panel-body-small-size').hide();
      $('.panel-title').hide();

      $('.header-text').show();
      $('.col-md-9').show();
    }*/

    if ($(document).width() <= $(document).height()){
      $('.panel-body-small-size').show(); 
      $('.panel-title').show();

      $('.header-text').hide();
      $('.col-md-9').hide();
    } 
    else if($(document).width() >= $(document).height()){
      $('.panel-body-small-size').hide();
      $('.panel-title').hide();

      $('.header-text').show();
      $('.col-md-9').show();
    }
}

//#endregion

// end of file