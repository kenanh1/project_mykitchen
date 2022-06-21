tinymce.init({
    selector: "textarea:not(#id_opis_jela)",      
    // height: "700",
    // width: "1300",
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

