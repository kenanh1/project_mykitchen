const addMoreBtn = document.getElementById("add-more")
const totalForms = document.querySelectorAll("#id_sastojak-TOTAL_FORMS")[0]
const currentForms = document.getElementsByClassName("ingredient-form")
addMoreBtn.addEventListener("click", add_new_form)
const deleteCheckbox = document.getElementById("id_sastojak-__prefix__-DELETE")
deleteCheckbox.remove();

function add_new_form(event){
    if (event) {
        event.preventDefault()
    }

    const currentForms = document.getElementsByClassName("ingredient-form")
    const currentFormsCount = currentForms.length

    const formCopy = document.getElementById("ingredient-form-list")
    const emptyForm = document.getElementById("empty-form").cloneNode(true)
    emptyForm.setAttribute("class", "ingredient-form")
    emptyForm.setAttribute("id", `sastojak-${currentFormsCount}`)
    const regex = new RegExp('__prefix__','g')
    emptyForm.innerHTML = emptyForm.innerHTML.replace(regex, currentFormsCount)
    totalForms.setAttribute("value", currentFormsCount + 1)
    formCopy.append(emptyForm)
}
// END FOR FIRST TEST

function deleteFormField(element){
    let formParentDiv = element.closest(".ingredient-form");
    formParentDiv.parentNode.removeChild(formParentDiv);
    const currentFormsCount = currentForms.length
    totalForms.setAttribute("value", currentFormsCount)
}
