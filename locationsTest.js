class LocationsTest {
    constructor(locationsArray) {
        this.locationsArray = locationsArray;
    }

    getLocationCoordsByTypeId(location_type_id){
        var result = this.locationsArray.filter(obj => {
            return obj.location_type_id === location_type_id;
          })
        
        var coordsArray = [];
        
        result.forEach(async (location) => {
            coordsArray.push(location.geom);
          });

        return result;
    }
}