const mobileNavbar = document.querySelector(".mobile_navbar_menu")

function menuClick(){
	document.getElementById("nav-menu").classList.toggle("menu-active");
	mobileNavbar.classList.toggle("fade");

}
