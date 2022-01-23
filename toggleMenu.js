const tabcontents = document.querySelectorAll(".tabcontent");
const tabLinks = document.querySelectorAll(".tabs a");

function openTab(event, tabName){
    /* REMOVE ALL TABCONTENTS */
    tabcontents.forEach((tabcontent) => (tabcontent.style.display = "none"));
    
    /* REMOVE TABLINKS ACTIVE CLASSES */
    tabLinks.forEach((tabLink) => tabLink.classList.remove("active"));

    /* ADD ACTIVE CLASS ON TABLINK AND OPEN IT */
    event.currentTarget.classList.add("active");
    document.getElementById(tabName).style.display = "block";
}