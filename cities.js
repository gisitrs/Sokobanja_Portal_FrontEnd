class Cities {
    constructor(cityArray) {
        this.CityArray = cityArray;
    }

    getCityById(id){
        var result = this.CityArray.find(obj => {
            return obj.id === id;
          })

        return result;
    }
}