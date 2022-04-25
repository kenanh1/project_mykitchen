function svgClick(element){

    let svgParentDiv = element.closest(".step1");
    let svgIcon = svgParentDiv.querySelector("svg");

    if (element.checked == true){
        svgIcon.style.backgroundColor = "var(--primary-color)";
        svgIcon.style.fill = "white";
    } else {
        svgIcon.style.backgroundColor = "white";
        svgIcon.style.fill = "var(--primary-color)";
    }
};


function menuClick(){
	document.getElementById("nav-menu").classList.toggle("menu-active");
}