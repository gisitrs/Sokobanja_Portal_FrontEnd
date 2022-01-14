class MapInfoTabsENG{ 
    constructor() {
        this.InfoTab1 = "Restaurants";
        
        this.InfoTab2 = "Museums";

        this.InfoTab3 = "Tourist guides";
    }

    getMapInfoTabList(){
        return [this.InfoTab1, this.InfoTab2, this.InfoTab3];
    }
  }