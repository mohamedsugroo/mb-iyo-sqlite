document.addEventListener("turbolinks:load", function() {

  let img = document.querySelectorAll('img');
  let imageLength = img.length;


  for (let i = 0; i < imageLength; i++) {
    let image = img[i]
    image.removeAttribute("height")
    image.removeAttribute("width")
    // console.log(image);
  }

  let fig = document.querySelectorAll('figure');
  let figureLength = fig.length;

  for (let i = 0; i < figureLength; i++) {
    let figure = fig[i]
    figure.removeAttribute("style")
    // console.log(image);
  }
    
	// console.log(img)

});



function wrappImages() {

}

