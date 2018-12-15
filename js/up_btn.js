const up_btn = document.querySelector('#up_btn');

up_btn.addEventListener('click', function (e) {
    let y = e.view.scrollY;
    let upAnim = setInterval(() => {
            if (y > 0) {
                y-= 30;
                window.scrollTo(0, y);
            } else {
                clearInterval(upAnim);
            }
        }, 20)
});