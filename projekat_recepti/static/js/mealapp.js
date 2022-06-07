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

// BURGER MENI ON CLICK
function menuClick(){
	document.getElementById("nav-menu").classList.toggle("menu-active");
}

// HEART ICON COLOR CHANGE ON CLICK WITH TOGGLE 
let heartIcons = document.querySelectorAll('.media__heart .fa')

heartIcons.forEach(function (btn){
    btn.addEventListener("click", function(event){
        // console.log(event.target)
        btn.classList.toggle("heart-active")
        btnCheckColor = btn.classList.contains("heart-active")
        if (btn.classList.contains("heart-active")){
            btn.style.color = "#eb4a36"
        } else{
            btn.style.color = "white"
        }
        
    })
})
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
