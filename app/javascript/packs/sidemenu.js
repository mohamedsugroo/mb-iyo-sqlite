let aside, btnShow, btnHide;

aside = document.querySelector(".sidemenu");
btnShow = document.querySelector("#btnShow");
btnHide = document.querySelector("#btnHide");

function showSide() {
	aside.style.left = "0px";
}


function hideSide() {
	aside.style.left = "-400px";
}


btnShow.addEventListener("click", showSide,false);
btnHide.addEventListener("click", hideSide,false);