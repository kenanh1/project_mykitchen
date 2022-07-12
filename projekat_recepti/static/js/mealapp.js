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


function commentReplyToggle(parent_id){
    const row = document.getElementById(parent_id);
    console.log(row)
    
    if (row.classList.contains('hidden')){
        row.classList.remove('hidden');
    } else{
        row.classList.add('hidden')
    }
}

// $('#sortby').on('change', 'select', function(event){
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

// $(document).ready (function () {  
//     // $("#sortby").change (function () {  
//     //     var selectedCountry = $(this).children("option:selected").val();  
//     //     alert ("You have selected the country - " + selectedCountry);  
//     // });

//     $('#sortby').on('change', 'select', function(event){
//         // id = this.id; // you can use this.id to get the corresponding id.

//             var word = $("#sortby").val();

//             console.log(word)

//     //         $.ajax({ 
//     //             type: 'GET',
//     //             url: '{% url <home> %}',
//     //             data: {
//     //                 word: word,
//     //             },
//     //             success: function (response) { 
//     //                 console.log(response); // print response.content and response.data to see the data in the console. And later you can use those data in template using javascript.
//     //             },
//     //             error: function (error_data) {
//     //                 console.log(error_data)
//     //             }
//     //         });

//        });
// });  


// function getval(sel)
// {
//     alert(sel.value);
// }

$(document).ready(function(){
    $('#sortby').on('change', function(){
        var data = $(this).val();
        console.log(data)
    })
})

// $(function(){
//     $("#sortby").change(function(){
//         var displayResult =$("#sortby option:selected").val();
//         console.log(displayResult)
//     })
// })
