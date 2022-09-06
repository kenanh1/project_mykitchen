const secondFormset = document.getElementsByClassName("sr-form-directions")
const stepBtn = document.getElementById("add-new-step")
const totalSteps = document.querySelectorAll("#id_form-TOTAL_FORMS")[0]

const currentSteps = document.getElementsByClassName("step-form")
stepBtn.addEventListener("click", add_new_step)

function add_new_step(event){
    if (event) {
        event.preventDefault()
    }
    const currentSteps = document.getElementsByClassName("step-form")
    const currentStepsCount = currentSteps.length


    const stepCopy = document.getElementById("steps-form-list")
    const emptyStep = document.getElementById("empty-step").cloneNode(true)
    emptyStep.setAttribute("class", "step-form")
    emptyStep.setAttribute("id", `form-editor-${currentStepsCount}`)
    const regex = new RegExp('__prefix__','g')
    emptyStep.innerHTML = emptyStep.innerHTML.replace(regex, currentStepsCount)
    totalSteps.setAttribute("value", currentStepsCount + 1)
    stepCopy.append(emptyStep)

    tinymce.init({
        selector: `#id_form-${currentStepsCount}-body`,
        // content_css:"{% static 'css/meal_no1_container.css' %}",
        plugins: "insertdatetime media image preview",
        toolbar: "bold italic | alignleft alignright aligncenter alignjustify | image media | preview",
        image_title: true,
        image_caption: true,
        automatic_uploads: true,
        image_advtab: true,
        file_picker_types: "image media",
        extended_valid_elements : "span[!class]",
        paste_remove_spans: true,

        file_picker_callback: function (cb, value, meta) {
        var input = document.createElement("input");
        input.setAttribute("type", "file");
        if (meta.filetype == "image") {
            input.setAttribute("accept", "image/*");}
        if (meta.filetype == "media") {
        input.setAttribute("accept", "video/*");}

        input.onchange = function () {     
            var file = this.files[0];
            var reader = new FileReader();
            reader.onload = function () {
                var id = "blobid" + (new Date()).getTime();
                var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
                var base64 = reader.result.split(",")[1];
                var blobInfo = blobCache.create(id, file, base64);
                blobCache.add(blobInfo);
                cb(blobInfo.blobUri(), { title: file.name });
            };
            reader.readAsDataURL(file);
        };
        input.click();
        },
    });
    
    console.log(totalSteps.value)
    if (totalSteps.value >= 6){
        stepBtn.disabled = true;
    }
}
