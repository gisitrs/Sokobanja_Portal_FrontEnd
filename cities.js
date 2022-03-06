class Cities {
    constructor(cityArray) {
        this.CityArray = cityArray;
    }

    getCityById(id){
        var result = this.CityArray.filter(obj => {
            return obj.id === id;
          })
        
        var newResult = [result[0].name, result[0].description, result[0].id];

        return newResult;
    }
}