let advert =  document.querySelector("#advertisment_box").offsetTop;

function advertisment() {
	let scroll = document.addEventListener("scroll", Log);
	console.log(advert)
}


function Log() {
	let bottom =  document.querySelector("#advertisment_box").offsetBottom;
	let scroll = window.scrollY;
	let box = document.querySelector("#advertisment_box");
	let stopper = document.querySelector(".blackedout");
	let stopAd = stopper.offsetTop
	let nomore = stopAd - 90

	fix()

	if(scroll >= (nomore - 190)) {
		console.log("Bottom reached", stopAd)
		box.style.position = "relative";
		let newTop = (stopAd - 600) - 96
		box.style.marginTop = "90px"
	} else {
		fix()
	}


	function fix() {
		if (scroll > 90) {
			// console.log("Log is active", window.scrollY)
			let newM = scroll - 90
			box.classList.add('fixedadvert')
		}
	}

}	


advertisment()

