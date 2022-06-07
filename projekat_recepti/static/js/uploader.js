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


// tinymce.init({
//     selector: "textarea:not(#id_opis_jela)",  // change this value according to your HTML
//     plugins: "insertdatetime media image preview",
//     file_picker_callback: function(callback, value, meta) {
//       // Provide file and text for the link dialog
//       if (meta.filetype == 'file') {
//         callback('add_recipe.html', {text: 'My text'});
//       }
  
//       // Provide image and alt text for the image dialog
//       if (meta.filetype == 'image') {
//         callback('myimage.jpg', {alt: 'My alt text'});
//       }
  
//       // Provide alternative source and posted for the media dialog
//       if (meta.filetype == 'media') {
//         callback('movie.mp4', {source2: 'alt.ogg', poster: 'image.jpg'});
//       }
//     }
//   });

