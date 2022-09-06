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




