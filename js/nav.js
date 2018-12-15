const burger = document.querySelector('#burger');
const accordion = document.querySelector('#accordion');

burger.addEventListener('click', function () {

    if (accordion.classList.contains('d-none')) {

        accordion.classList.remove('d-none');
        accordion.classList.add('d-block');

    } else {
        accordion.classList.remove('d-block');
        accordion.classList.add('d-none');
    }

})

const genre = document.querySelector('#genre');
const collapseOneLg = document.querySelector('#collapseOneLg');
const director = document.querySelector('#director');
const collapseTwoLg = document.querySelector('#collapseTwoLg');
const date = document.querySelector('#date');
const collapseThreeLg = document.querySelector('#collapseThreeLg');


genre.addEventListener('click', function () {

    if (collapseOneLg.classList.contains('d-none')) {

        if (collapseTwoLg.classList.contains('d-block')){
            collapseTwoLg.classList.remove('d-block');
            collapseTwoLg.classList.add('d-none');
        }
        if (collapseThreeLg.classList.contains('d-block')){
            collapseThreeLg.classList.remove('d-block');
            collapseThreeLg.classList.add('d-none');
        }
        collapseOneLg.classList.remove('d-none');
        collapseOneLg.classList.add('d-block');

    } else
     if (collapseOneLg.classList.contains('d-block')) {
        collapseOneLg.classList.remove('d-block');
        collapseOneLg.classList.add('d-none');
    }

})

director.addEventListener('click', function () {

    if (collapseTwoLg.classList.contains('d-none')) {

        if (collapseOneLg.classList.contains('d-block')){
            collapseOneLg.classList.remove('d-block');
            collapseOneLg.classList.add('d-none');
        }
        if (collapseThreeLg.classList.contains('d-block')){
            collapseThreeLg.classList.remove('d-block');
            collapseThreeLg.classList.add('d-none');
        }
        collapseTwoLg.classList.remove('d-none');
        collapseTwoLg.classList.add('d-block');

    } else
    if (collapseTwoLg.classList.contains('d-block')) {
        collapseTwoLg.classList.remove('d-block');
        collapseTwoLg.classList.add('d-none');
    }

})


date.addEventListener('click', function () {

    if (collapseThreeLg.classList.contains('d-none')) {

        if (collapseOneLg.classList.contains('d-block')){
            collapseOneLg.classList.remove('d-block');
            collapseOneLg.classList.add('d-none');
        }
        if (collapseTwoLg.classList.contains('d-block')){
            collapseTwoLg.classList.remove('d-block');
            collapseTwoLg.classList.add('d-none');
        }
        collapseThreeLg.classList.remove('d-none');
        collapseThreeLg.classList.add('d-block');

    } else
    if (collapseThreeLg.classList.contains('d-block')) {
        collapseThreeLg.classList.remove('d-block');
        collapseThreeLg.classList.add('d-none');
    }

})