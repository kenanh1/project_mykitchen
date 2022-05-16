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
        console.log(event.target)
        btn.classList.toggle("heart-active")
        btnCheckColor = btn.classList.contains("heart-active")
        if (btn.classList.contains("heart-active")){
            btn.style.color = "#eb4a36"
        } else{
            btn.style.color = "white"
        }
        
    })
})

//TEST FOR FORMS
document.addEventListener('click', (event)=>{
    if (event.target.id == 'add-more') {
        add_new_form(event)
    }
})
function add_new_form(event) {
    // if (event) {
    //     event.preventDefault()
    // }
    console.log(event)
    // const totalNewForms = document.getElementById('id_form-TOTAL_FORMS')
    // const currentIngredientForms = document.getElementsByClassName('ingredient-form')
    // const currentFormCount = currentIngredientForms.length // + 1
    // const formCopyTarget = document.getElementById('ingredient-form-list')
    // const copyEmptyFormEl = document.getElementById('empty-form').cloneNode(true)
    // copyEmptyFormEl.setAttribute('class', 'ingredient-form')
    // copyEmptyFormEl.setAttribute('id', `form-${currentFormCount}`)
    // const regex = new RegExp('__prefix__', 'g')
    // copyEmptyFormEl.innerHTML = copyEmptyFormEl.innerHTML.replace(regex, currentFormCount)
    // totalNewForms.setAttribute('value', currentFormCount + 1)
    // now add new empty form element to our html form
    // formCopyTarget.append(copyEmptyFormEl)
}