
$( document ).ready(function() {
    tinymce.init({
        selector: "textarea.tinymce:not(#id_form-__prefix__-body)",
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
});