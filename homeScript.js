//#region slideshow functions

var slideIndex = 1;
var isClicked = false;
showSlides(slideIndex);

function plusSlides(n) {
    isClicked = true;
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    //var dots = document.getElementsByClassName("dot");
    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++){
        slides[i].style.display = "none";
    }

    /*for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }*/

    slides[slideIndex - 1].style.display = "block";
    //dots[slideIndex - 1].className += "active";
}

// Auto slides

var slideIndex = 0;
var timeoutValue = 8000;
showSlidesAutomatic();

function showSlidesAutomatic() {
    var i;
    if (isClicked == false ) {
        var slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++){
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
            slideIndex = 1;
        }
        slides[slideIndex - 1].style.display = "block";
        setTimeout(showSlidesAutomatic, timeoutValue);
    }
    else {
        isClicked = false;
        setTimeout(showSlidesAutomatic, timeoutValue);
    }
}

function goToMapPage(){
    window.location.href= "Map.html";
}

function alertMessage(){
    alert('Grad nije trenutno dostupan / The city is not available now');
}

//#endregion