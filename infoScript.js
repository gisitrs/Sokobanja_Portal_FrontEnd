//#region initialize objects and variables

/* objects for specific classes*/ 

const mapInfoTabsRS = new MapInfoTabsRS();
const mapInfoTabsENG = new MapInfoTabsENG();

const restaurantsRS = new SokobanjaRestaurantsRS();
const restaurantsENG = new SokobanjaRestaurantsENG();

const museumClass = new SokobanjaMuseumsRS();
const museumsENG = new SokobanjaMuseumsENG();

const touristGuideClass = new SokobanjaTouristGuidesRS();
const touristGuidesENG = new SokobanjaTouristGuidesENG();

var layerLabelsRS = new MapLayerLabelsRS();
var layerLabelsENG = new MapLayerLabelsENG();

var currentMapLabels = new MapLabelsRS();

var mapInfoTabValues = mapInfoTabsRS.getMapInfoTabList();
var restaurants = restaurantsRS.getList();
var museums = museumClass.getList();
var touristGuides = touristGuideClass.getList();

var htmlContent = "";
var collapseId = "";
var panelId = "";
var panel1Id = "";
var imageId = "";

var paneltextId = "";
var panel1textId = "";
var webLinkId = "";
var webLink1Id = "";

var facebookLinkId = "";
var facebookLink1Id = "";
var locationLinkId = "";
var locationLink1Id = "";

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
var htmlContentList = [];

var tabHeaderList = [];
var dataParentIdList = [];
var tabHeaderTextIdList = [];

/* enum class for language */
const appLanguages = Object.freeze({
    Serbian: 'Serbian',
    English: 'English'
});

var currentLanguage = appLanguages.Serbian;
var currentLayerlabels = layerLabelsRS;

//#endregion

//#region set text values for languages

(function( $ ){
 $.fn.setTabValuesForLanguage = function() {
   if (currentLanguage == appLanguages.Serbian){
    mapInfoTabValues = mapInfoTabsRS.getMapInfoTabList();
    currentMapLabels = new MapLabelsRS();
    currentLayerlabels = layerLabelsRS;
   }
   else if (currentLanguage == appLanguages.English){
    mapInfoTabValues = mapInfoTabsENG.getMapInfoTabList();
    currentMapLabels = new MapLabelsENG();
    currentLayerlabels = layerLabelsENG;
   }
  }; 
})( jQuery );

(function( $ ){
 $.fn.setTextValuesForLanguage = function() {
   if (currentLanguage == appLanguages.Serbian){
    tabValuesList = [restaurantsRS.getList(), museumClass.getList(), touristGuideClass.getList()];
   }
   else if (currentLanguage == appLanguages.English){
    tabValuesList = [restaurantsENG.getList(), museumsENG.getList(), touristGuidesENG.getList()];
   }
  }; 
})( jQuery );

(function( $ ){
  $.fn.updateLocationTypesText = function() {
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
   }; 
 })( jQuery );

 (function( $ ){
  $.fn.updateButtonTitles = function() {
    $('#serbianLanguageButtonId').prop('title', currentMapLabels.SerbianLanguageButtonTitle);
    $('#englishLanguageButtonId').prop('title', currentMapLabels.EnglishLanguageButtonTitle);
    $('#mapLegendButtonId').prop('title', currentMapLabels.MapPageButtonTitle);
   }; 
 })( jQuery );

function translateOnSerbian(){
  currentLanguage = appLanguages.Serbian;
  $('#main_container').updateTextValuesForSelectedLanguage();
}

function translateOnEnglish(){
  currentLanguage = appLanguages.English;
  $('#main_container').updateTextValuesForSelectedLanguage();
}

function goToMapPage(){
  var url = "Map.html?language=" + currentLanguage;
  window.location.href= url;
}

//#endregion

//#region create toggle and pill menu '<li><a data-toggle="pill" id="touristGuidesLiId" href="#touristGuides">' + textTab3 + '</a></li>' '<li><a data-toggle="pill" id="restaurantsLiId" href="#restaurants">' + textTab1 + '</a></li>'

(function( $ ){
 $.fn.createTabContent = function(textTab1, textTab2, textTab3) {
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
                   '<li><a data-toggle="pill" id="sightsLiId" href="#sights" title="Znamenitosti"><img src="./images/Markers/Sights.png" width="47" /><p id="sightsLbId">Znamenitosti</p></a></li>' +
                   '<li><a data-toggle="pill" id="museumsLiId" href="#museums">' + textTab2 + '</a></li>';
    return divContent;
 };                                                        
})( jQuery ); 

/* create div content for toggle menu */
(function( $ ){
 $.fn.createDivContent = function(dataParentId, collapseId, panelId, panel1Id, 
                                  imageId, panelTextId, panel1TextId, webLinkId, 
                                  webLink1Id, facebookLinkId, facebookLink1Id, contactTextId, 
                                  contactText1Id, locationLinkId, locationLink1Id) {
  var divContent = '<div class="panel panel-default">' +
                      '<div class="panel-heading">' +
                        '<h4 class="header-text">' +
                          '<div id="' + panel1Id + '"></div></a>' + 
                        '</h4>' +
                        '<h4 class="panel-title">'   +
                          '<a data-toggle="collapse" data-parent="#' + dataParentId + '" href="#' + collapseId + '">' + 
                          '<div id="' + panelId + '"></div></a>' + 
                        '</h4>' +
                        '<div class="panel-body">' +
                          '<div class="row">'+
                            '<div class="col-md-3">' + 
                              '<div><img id="' + imageId + '" src="" alt="..."></div>' + 
                            '</div>'+
                            '<div class="col-md-9">'+
                              '<div id="' + panel1TextId + '"></div>'+
                              '</br>' +
                              '<div id="' + contactTextId + '"></div>'+
                              '</br>' +
                              '<div class="row">' +
                                '<div class="col-md-10">' +
                                  '<a id="' + webLink1Id + '" href=""></a>' +
                                '</div>' +
                                '<div class="col-md-1">' +
                                  '<a id="' + locationLink1Id + '" href="" title="" style="visibility: hidden"><img src="./images/MapImage.png" class="img-responsive"></a>' +
                                '</div>' +
                                '<div class="col-md-1">' +
                                  '<a id="' + facebookLinkId + '" href="#" title="" style="visibility: hidden"><img src="./images/facebook-icon.png" class="img-responsive"></a>' +
                                '</div>' +
                              '</div>' +
                            '</div>'+
                          '</div> '+
                        '</div>' + 
                      '</div>'+
                      '<div id="' + collapseId + '" class="panel-collapse collapse">' +
                        '<div class="panel-body">' +
                          '<div id="' + panelTextId + '" class="panel-body-small-size"></div>' +
                          '</br>' +
                          '<div id="' + contactText1Id + '" class="panel-body-small-size"></div>'+
                          '</br>' + 
                          '<div class="row">' +
                            '<div class="col-md-10">' +
                              '<a id="' + webLinkId + '" class="panel-body-small-size" href=""></a>' +
                            '</div>' +
                            '<div class="col-md-1">' +
                                '<a id="' + locationLinkId + '" href="" title="" style="visibility: hidden" class="panel-body-small-size"><img src="./images/MapImage.png" class="img-responsive"></a>' +
                            '</div>' +
                            '<div class="col-md-1">' +
                                '<a id="' + facebookLink1Id + '" href="#" title="" style="visibility: hidden; height: 0%;" class="panel-body-small-size"><img src="./images/facebook-icon.png" class="img-responsive"></a>' +
                            '</div>' +
                           '</div>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>';
    return divContent;
 }; 
})( jQuery );

/* insert text values in page elements */ 
(function( $ ){
 $.fn.insertTextValues = function(listValues, tabHeaderValue) {
  $.each(listValues, function( index, value ) {
      panelId = "#" + tabHeaderValue + "Panel" + index + "Id";
      panel1Id = "#" + tabHeaderValue + "Panel1" + index + "Id";
      imageId = "#" + tabHeaderValue + "Image" + index + "Id";
      panelTextId = "#" + tabHeaderValue + "Panel" + index + "TextId";
      panel1TextId = "#" + tabHeaderValue + "Panel1" + index + "TextId";
      webLinkId = "#" + tabHeaderValue + "WebLink" + index + "Id";
      webLink1Id = "#" + tabHeaderValue + "WebLink1" + index + "Id";
      facebookLinkId = "#" + tabHeaderValue + "FacebookLink" + index + "Id";
      facebookLink1Id = "#" + tabHeaderValue + "FacebookLink1" + index + "Id";
      locationLinkId = "#" + tabHeaderValue + "LocationLink" + index + "Id";
      locationLink1Id = "#" + tabHeaderValue + "LocationLink1" + index + "Id";

      contactTextId = "#" + tabHeaderValue + "ContactText" + index + "Id";
      contactText1Id = "#" + tabHeaderValue + "ContactText1" + index + "Id";

      $(panelId).text(value[0]); 
      $(panel1Id).text(value[0]); 
      $(panelTextId).text(value[1]); 
      $(panel1TextId).text(value[1]); 

      if (value[2] != "" && value[3] != ""){
        $(webLinkId).attr("href", value[2]); 
        $(webLink1Id).attr("href", value[2]); 
        $(webLinkId).text(value[3]);
        $(webLink1Id).text(value[3]);
      }

      $(imageId).attr("src", value[4]);

      if(value[5] != ""){
        $(facebookLinkId).attr("href", value[5]);
        $(facebookLinkId).css("visibility", "visible");
        $(facebookLinkId).css("height", "100%");
        $(facebookLink1Id).attr("href", value[5]);
        $(facebookLink1Id).css("visibility", "visible");
      }

      $(contactTextId).text(value[6]); 
      $(contactText1Id).text(value[6]); 

      if(value[7] != "" && value[8] != ""){
        $(locationLinkId).css("visibility", "visible");
        $(locationLink1Id).css("visibility", "visible");
        $(locationLinkId).attr("href", value[9]);
        $(locationLink1Id).attr("href", value[9]);
      }
    });
 }; 
})( jQuery );

/* update tab and text values */
(function( $ ){
 $.fn.updateTabTextValues = function() {
    //$('#restaurantsLiId').text(mapInfoTabValues[0]);
    //$('#museumsLiId').text(mapInfoTabValues[1]);
    $('#touristGuidesLiId').text(mapInfoTabValues[2]);
  }
})( jQuery );

(function( $ ){
 $.fn.updateTextValues = function(tabValuesList, isInitial) {
  $.each(tabValuesList, function(index, tabValues){
      if (isInitial == true){
        $("#" + dataParentIdList[index]).html(htmlContentList[index]);
      }

      $('#main_container').insertTextValues(tabValues, tabHeaderList[index]);

      $(tabHeaderTextIdList[index]).text(mapInfoTabValues[index]);
    }); 
  }
})( jQuery );

/* create tabs */
$.each(mapInfoTabValues, function( indexTab, valueTab ) {
    if (indexTab == 0){
      tabHeader = "restaurants";
      dataParentId = "restaurantsPanel";
      tabHeaderTextId = "#restaurantsHeader";
      tabHeaderTextValue = mapInfoTabValues[0];
      tabValues = restaurants;
    }
    else if (indexTab == 1){
      tabHeader = "museums";
      dataParentId = "museumsPanel";
      tabHeaderTextId = "#museumsHeader";
      tabHeaderTextValue = mapInfoTabValues[1];
      tabValues = museums;
    }
    else if (indexTab == 2){
      tabHeader = "touristGuides";
      dataParentId = "touristGuidesPanel";
      tabHeaderTextId = "#touristGuidesHeader";
      tabHeaderTextValue = mapInfoTabValues[2];
      tabValues = touristGuides;
    }

    tabHeaderList.push(tabHeader);
    dataParentIdList.push(dataParentId);
    tabHeaderTextIdList.push(tabHeaderTextId);
    tabValuesList.push(tabValues);

    $.each(tabValues, function( index, value ) {
      collapseId = tabHeader + "Collapse" + index;
      panelId = tabHeader + "Panel" + index + "Id";
      panel1Id = tabHeader + "Panel1" + index + "Id";
      imageId = tabHeader + "Image" + index + "Id";
      panelTextId = tabHeader + "Panel" + index + "TextId";
      panel1textId = tabHeader + "Panel1" + index + "TextId";
      webLinkId = tabHeader + "WebLink" + index + "Id";
      webLink1Id = tabHeader + "WebLink1" + index + "Id";
      facebookLinkId = tabHeader + "FacebookLink" + index + "Id";
      facebookLink1Id = tabHeader + "FacebookLink1" + index + "Id";
      locationLinkId = tabHeader + "LocationLink" + index + "Id";
      locationLink1Id = tabHeader + "LocationLink1" + index + "Id";

      contactTextId = tabHeader + "ContactText" + index + "Id";
      contactText1Id = tabHeader + "ContactText1" + index + "Id";

      var divContent = $('#main_container').createDivContent(dataParentId, collapseId, panelId, panel1Id, 
                                                             imageId, panelTextId, panel1textId, webLinkId, 
                                                             webLink1Id, facebookLinkId, facebookLink1Id, contactTextId, 
                                                             contactText1Id, locationLinkId, locationLink1Id);
    
      htmlContent = htmlContent + divContent;
    });

    htmlContentList.push(htmlContent);
    htmlContent = "";
});

/* translate text values and set page layout */
(function( $ ){
 $.fn.updateTextValuesForSelectedLanguage = function() {
  $('#main_container').setTabValuesForLanguage();
  $('#main_container').updateTabTextValues();

  $('#main_container').setTextValuesForLanguage();
  $('#main_container').updateTextValues(tabValuesList, false);
  $('#main_container').updateLocationTypesText();
  $('#main_container').updateButtonTitles();
  }; 
})( jQuery );

function changePageLayout(){
      if ($(document).width() <= 1000){
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
  }
}

//#endregion

// end of file