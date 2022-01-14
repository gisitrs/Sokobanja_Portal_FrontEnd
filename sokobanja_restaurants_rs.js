class SokobanjaRestaurantsRS{ 
    constructor() {
        this.Restaurant1 = ["Stara Vodenica", 
                            "Etno restoran Stara Vodenica se nalazi u Sokobanji na čuvenoj mlinarskoj reci Gradašnici, a sam restoran je idealan kutak da uživate u ukusima tradicionalne hrane i u prelepom prirodnom ambijentu. MENI restorana obuhvata, domaće lepinje sa sirom i kajmakom, domaće pite i gibanice, kačamak i proja, kiselo mleko, domaća kuvana jela, riblji specijaliteti, roštilj, jagnjeće i praseće pečenje... nacionalna jela, i hladna osveženja. Ako ste strastveni ribolovac i ljubitelj ribljih specijaliteta možete da oprobate sreću na jezercetu i upecate pastrmku koja će biti spremljena samo za Vas. U blizini restorana nalazi se mini zoovrt sa domaćim životinjama, a svoje mališane možete obradovati i jahanjem konja Ponija.",
                            "https://www.staravodenica.com/",
                            "www.staravodenica.com",
                            "./images/StaraVodenica.png",
                            "https://www.facebook.com/bg.grf/",
                            "Adresa: Druge proleterske brigade 79.  Kontakt: 036 383 347 Mob: 064 42 40 151",
                            "43.6421",
                            "5432421.8815",
                            "SokoBanja_Portal.html?xCoord=43.6421&yCoord=5432421.8815&locationText=Restoran Stara Vodenica"];
        
        this.Restaurant2 = ["Župan", 
                            "„Župan“ je privatni restoran sa najdužom tradicijom u Sokobanji. Osnovan je daleke 1968. i od tada je ugostio hiljade banjskih gostiju; glumce, političare, muzičare, sportiste i druge poznate ličnosti. U jelovniku će te naći vrhunske specijalitete sa roštilja na ćumur, veliki izbor jela po narudžbini, svežu pastrmku, a u toku letnje sezone za ručak imate svakodnevni izbor od preko 15 najkvalitetnijih, domaćih kuvanih jela.",
                            "https://sokobanja.rs/gastronomija/restoran-zupan/",
                            "www.zupan.com",
                            "./images/Zupan.jpg",
                            "",
                            "Adresa: Druge proleterske brigade 79.  Kontakt: 036 383 347 Mob: 064 42 40 151",
                            "43.6405",
                            "5432421.8731",
                            "SokoBanja_Portal.html?xCoord=43.6405&yCoord=5432421.8731&locationText=Restoran Župan"];
    }

    getList(){
        return [this.Restaurant1, this.Restaurant2];
    }
  }