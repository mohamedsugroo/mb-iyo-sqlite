// document.addEventListener("turbolinks:load", function() {
  
  let img = document.querySelectorAll('img');
  let imageLength = img.length;

  for (let i = 0; i < imageLength; i++) {
    let image = img[i]
    image.removeAttribute("height")
    image.removeAttribute("width")
  }

  let fig = document.querySelectorAll('figure');
  let figureLength = fig.length;

  for (let i = 0; i < figureLength; i++) {
    let figure = fig[i]
    figure.removeAttribute("style")
  }

  let divs = document.querySelectorAll('div');
  let divLength = divs.length;

  for (let i = 0; i < divLength; i++) {
    let div = divs[i]
    div.removeAttribute("style")
    div.removeAttribute("height")
    div.removeAttribute("width")
  }

    

// });



function wrappImages() {

}

