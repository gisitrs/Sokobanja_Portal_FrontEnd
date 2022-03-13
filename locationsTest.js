class LocationsTest {
    constructor(locationsArray) {
        this.locationsArray = locationsArray;
    }

    getLocationsByTypeId(location_type_id){
        var result = this.locationsArray.filter(obj => {
            return obj.location_type_id === location_type_id;
          })

        return result;
    }

    getLocationsByPriority(priority){
      var result = this.locationsArray.filter(obj => {
          return obj.priority === priority;
        })

      return result;
    }
}