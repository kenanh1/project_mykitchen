// STEPS FOR RECIPE COLOR CHANGE
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


// FIRST TEST FOR FORMS

const addMoreBtn = document.getElementById("add-more")
const totalForms = document.getElementById("id_form-TOTAL_FORMS")
const currentForms = document.getElementsByClassName("ingredient-form")
addMoreBtn.addEventListener("click", add_new_form)

function add_new_form(event){
    if (event) {
        event.preventDefault()
    }

    const currentForms = document.getElementsByClassName("ingredient-form")
    const currentFormsCount = currentForms.length

    const formCopy = document.getElementById("ingredient-form-list")
    const emptyForm = document.getElementById("empty-form").cloneNode(true)
    emptyForm.setAttribute("class", "ingredient-form")
    emptyForm.setAttribute("id", `form-${currentFormsCount}`)
    const regex = new RegExp('__prefix__','g')
    emptyForm.innerHTML = emptyForm.innerHTML.replace(regex, currentFormsCount)
    totalForms.setAttribute("value", currentFormsCount + 1)
    formCopy.append(emptyForm)
}
// END FOR FIRST TEST

function deleteFormField(element){
    let formParentDiv = element.closest(".ingredient-form");
    formParentDiv.parentNode.removeChild(formParentDiv);
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

// $('#sortby').on('change', 'input, select', function(event){
//     // id = this.id; // you can use this.id to get the corresponding id.

//         var word = $("#sortby").val();

//         console.log(word)

//         $.ajax({ 
//             type: 'GET',
//             url: '{% url <home> %}',
//             data: {
//                 word: word,
//             },
//             success: function (response) { 
//                 console.log(response); // print response.content and response.data to see the data in the console. And later you can use those data in template using javascript.
//             },
//             error: function (error_data) {
//                 console.log(error_data)
//             }
//         });

//    });
