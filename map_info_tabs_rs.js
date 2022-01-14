class MapInfoTabsRS{ 
    constructor() {
        this.InfoTab1 = "Restorani";
        
        this.InfoTab2 = "Muzeji";

        this.InfoTab3 = "Turistički vodiči";
    }

    getMapInfoTabList(){
        return [this.InfoTab1, this.InfoTab2, this.InfoTab3];
    }
  }