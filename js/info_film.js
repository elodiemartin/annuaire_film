const button = document.querySelector("#btn-info");
const fontInButton = document.querySelector("#btn-info-logo");
const divInfo = document.querySelector(".moovie-wrapper-info");
const description = document.querySelector(".moovie-description");
console.log(description);
console.log("coucou");
let toggle = false;

if (button && divInfo) {
    button.addEventListener("click", (event) => {
        if (toggle == false) {
            toggle = true;
            divInfo.style.opacity = 1.0;
            fontInButton.style.color = "rgba(0,0,0,0.5)";
        } else {
            toggle = false;
            divInfo.style.opacity = 0.0;
            fontInButton.style.color = "rgba(255,255,255,0.5)";

        }

    })
    description.addEventListener("click", (event) => {
        if (toggle == false) {
            toggle = true;
            divInfo.style.opacity = 1.0;
            fontInButton.style.color = "rgba(0,0,0,0.5)";
        } else {
            toggle = false;
            divInfo.style.opacity = 0.0;
            fontInButton.style.color = "rgba(255,255,255,0.5)";

        }
    })
}