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
    // console.log(currentFormsCount)

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


const addMoreSteps = document.getElementById("add-more-steps")
// const totalStepForms = document.getElementById("id_form-TOTAL_FORMS")
const currentStepForms = document.getElementsByClassName("steps-form")
addMoreSteps.addEventListener("click", add_new_step)

// console.log(currentStepForms)
function add_new_step(event){
    // console.log(addMoreSteps, "BROJ STEPOVA")
    if (event) {
        event.preventDefault()
    }
    

    const currentStepForms = document.getElementsByClassName("steps-form")
    const stepFormsCount = currentStepForms.length
    // console.log(stepFormsCount)

    const stepCopy = document.getElementById("steps-form-list")

    const emptyStep = document.getElementById("empty-step-form").cloneNode(true)
    emptyStep.setAttribute("class", "steps-form")
    emptyStep.setAttribute("id", `form_step-${stepFormsCount}`)


    var elementDiv = document.getElementById(`form_step-${stepFormsCount}`);
    console.log(elementDiv)
    // const textAreaQS = document.querySelector()
    



    // const textAreaBodyId = document.getElementById("id-form-0-body").length
    // console.log(textAreaBodyId)
    
    // emptyStep.setAttribute("textarea id", `body-form-id${stepFormsCount}` )
    // const regexStep = new RegExp('__prefix__','g')
    // emptyStep.innerHTML = emptyStep.innerHTML.replace(regexStep, stepFormsCount)
    // totalStepForms.setAttribute("value", stepFormsCount + 1)
    stepCopy.append(emptyStep)
    
}