// tinymce.init({
//     selector: "textarea:not(#id_opis_jela)",      
//     // height: "700",
//     // width: "1300",
//     plugins: "insertdatetime media image preview",
//     toolbar: "undo redo |  bold italic | alignleft alignright aligncenter alignjustify | image media | preview",
//     image_title: true,
//     image_caption: true,
//     automatic_uploads: true,
//     image_advtab: true,
//     file_picker_types: "image media",

//     file_picker_callback: function (cb, value, meta) {
//       var input = document.createElement("input");
//       input.setAttribute("type", "file");
//       if (meta.filetype == "image") {
//           input.setAttribute("accept", "image/*");}
//       if (meta.filetype == "media") {
//       input.setAttribute("accept", "video/*");}

//       input.onchange = function () {     
//           var file = this.files[0];
//           var reader = new FileReader();
//           reader.onload = function () {
//               var id = "blobid" + (new Date()).getTime();
//               var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
//               var base64 = reader.result.split(",")[1];
//               var blobInfo = blobCache.create(id, file, base64);
//               blobCache.add(blobInfo);
//              cb(blobInfo.blobUri(), { title: file.name });
//            };
//            reader.readAsDataURL(file);
//        };
//        input.click();
//     },
//     content_style: "body { font-family:Helvetica,Arial,sans-serif; font-size:14px }"
// });
$(document).ready(function(){
    tinymce.init({
        selector: "textarea.step-form-editor",      
        plugins: "insertdatetime media image preview",
        toolbar: "undo redo |  bold italic | alignleft alignright aligncenter alignjustify | image media | preview",
        image_title: true,
        image_caption: true,
        automatic_uploads: true,
        image_advtab: true,
        file_picker_types: "image media",

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
        content_style: "body { font-family:Helvetica,Arial,sans-serif; font-size:14px }"
    });
    tinymce.remove("#id_opis_jela")

});

$('#add-new-step').click(function(){
    let n = $('.step-form-editor').length;
    console.log(`form-editor-${n}`)
    $( '.step-form' ).append('<textarea class="step-form-editor" id="form-editor-'+n+' name="step-form-editor"></textarea>');
    tinymce.init({
        selector: "textarea.step-form-editor",      
        plugins: "insertdatetime media image preview",
        toolbar: "undo redo |  bold italic | alignleft alignright aligncenter alignjustify | image media | preview",
        image_title: true,
        image_caption: true,
        automatic_uploads: true,
        image_advtab: true,
        file_picker_types: "image media",

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
        content_style: "body { font-family:Helvetica,Arial,sans-serif; font-size:14px }"
    });
    
    tinymce.remove("#id_opis_jela")
    
    var temp = window.parent.tinymce.get(`form-editor-${n}`).getContent();
    console.log(temp)
    
})

// var myContent = tinymce.get(".step-form-editor").getContent();
// console.log(myContent)


// const addStepsBtn = document.getElementById("add-new-step")
// const currenSteps = document.getElementsByClassName("step-form-editor")
// addStepsBtn.addEventListener("click", add_new_step)

// function add_new_step(event){
//     if (event) {
//         event.preventDefault()
//     }
//     console.log("radi")

//     const currentSteps = document.getElementsByClassName("step-form-editor")
//     const currentStepsCount = currentSteps.length
//     console.log(currentStepsCount)

//     const newStep = document.getElementsByClassName("step-form")
//     const stepText = document.createElement("textarea");
//     newStep.appendChild(stepText);

//     // var div = document.getElementById("yourDivElement");
//     // var input = document.createElement("textarea");
//     // var button = document.createElement("button");

//     // const formCopy = document.getElementById("ingredient-form-list")
//     // const emptyForm = document.getElementById("empty-form").cloneNode(true)
//     // emptyForm.setAttribute("class", "ingredient-form")
//     // emptyForm.setAttribute("id", `form-${currentFormsCount}`)
//     // const regex = new RegExp('__prefix__','g')
//     // emptyForm.innerHTML = emptyForm.innerHTML.replace(regex, currentFormsCount)
//     // totalForms.setAttribute("value", currentFormsCount + 1)
//     // formCopy.append(emptyForm)
// }