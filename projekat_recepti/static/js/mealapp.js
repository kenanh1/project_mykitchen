// STEPS FOR RECIPE COLOR CHANGE
// function svgClick(element){
//     let svgParentDiv = element.closest(".step1");
//     let svgIcon = svgParentDiv.querySelector("svg");

//     if (element.checked == true){
//         svgIcon.style.backgroundColor = "var(--primary-color)";
//         svgIcon.style.fill = "white";
//     } else {
//         svgIcon.style.backgroundColor = "white";
//         svgIcon.style.fill = "var(--primary-color)";
//     }
// };

function searchChange(item){
    let searchBtn = document.getElementById("search_click")
    let searchOpen = document.getElementById("searchOpen")
    let searchClose = document.getElementById("searchClose")
    let searchFormBtn = document.getElementById("searchFormBtn")
    console.log(item)
    
    if (searchBtn.checked == true){
        searchClose.style.display = "none";
        searchOpen.style.display = "block"
        searchFormBtn.style.opacity = "0"
    } else {
        searchOpen.style.display = "none";
        searchClose.style.display = "block"
        searchFormBtn.style.opacity = "1"
    }

}

function navbarArrow(item){
    let arrow = item.querySelector(".navbar__pointer")
    let labelID = item.getAttribute('for')
    let inputID = document.getElementById(labelID)

    if (inputID.checked == true){
        arrow.style.transform = 'rotate(0.turn)';
        arrow.style.transition = '0.5s ease-in';
    }
    else{
        arrow.style.transform = 'rotate(-0.25turn)';
        arrow.style.transition = '0.5s ease-in';
    }
    // element.style.transform = 'rotate(90deg)';
}
// console.log(document.getElementById("search_click"))
// let searchBtn = document.getElementById("search_click")
// let searchParentDiv = element.closest(".header-search");
// let searchOpen = searchParentDiv.querySelectorAll("svg")
// // let searchClose = document.getElementById("searchClose");
console.log(searchBtn)
if (searchBtn.checked == true){
    console.log("ovo radi")
} else{
    // searchOpen.style.display = "block";
    // searchClose.style.display = "none";
    console.log("ne radi")
}

// BURGER MENI ON CLICK
function menuClick(){
	document.getElementById("nav-menu").classList.toggle("menu-active");
}


function commentReplyToggle(parent_id){
    const row = document.getElementById(parent_id);
    console.log(row)
    
    if (row.classList.contains('hidden')){
        row.classList.remove('hidden');
    } else{
        row.classList.add('hidden')
    }
}




