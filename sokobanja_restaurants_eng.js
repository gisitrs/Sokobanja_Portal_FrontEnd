class SokobanjaRestaurantsENG{ 
    constructor() {
        this.Restaurant1 = ["Stara Vodenica", 
                            "Ethno restaurant Stara Vodenica is located in Sokobanja on the famous mill river Gradašnica, and the restaurant itself is an ideal place to enjoy the tastes of traditional food and beautiful natural surroundings. The menu of the restaurant includes, homemade buns with cheese and cream, homemade pies and gibanice, porridge and proja, sour milk, homemade cooked dishes, fish specialties, barbecue, lamb and pork roast ... national dishes, and cold refreshments. If you are an avid fisherman and a fan of fish specialties, you can try your luck on the pond and catch trout that will be prepared just for you. Near the restaurant there is a mini zoo with domestic animals, and you can make your little ones happy by riding a pony horse.",
                            "https://www.staravodenica.com/",
                            "www.staravodenica.com",
                            "./images/StaraVodenica.png",
                            "https://www.facebook.com/bg.grf/",
                            "Address: Druge proleterske brigade 79.  Contact: 036 383 347 Mobile: 064 42 40 151",
                            "43.6421",
                            "5432421.8815",
                            "SokoBanja_Portal.html?xCoord=43.6421&yCoord=5432421.8815&locationText=Restaurant Stara Vodenica"];
        
        this.Restaurant2 = ["Župan 1234", 
                            "Župan is a private restaurant with the longest tradition in Sokobanja. It was founded back in 1968 and since then it has hosted thousands of spa guests; actors, politicians, musicians, athletes and other celebrities. In the menu you will find top specialties from barbecue to charcoal, a large selection of dishes to order, fresh trout, and during the summer season for lunch you have a daily selection of over 15 of the highest quality, home-cooked food.",
                            "https://sokobanja.rs/gastronomija/restoran-zupan/",
                            "www.zupan.com",
                            "./images/Zupan.jpg",
                            "",
                            "Address: Druge proleterske brigade 79.  Contact: 036 383 347 Mobile: 064 42 40 151",
                            "43.6405",
                            "5432421.8731",
                            "SokoBanja_Portal.html?xCoord=43.6405&yCoord=5432421.8731&locationText=Restaurant Župan"];
    }

    getList(){
        return [this.Restaurant1, this.Restaurant2];
    }
  }