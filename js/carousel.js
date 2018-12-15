$(document).ready(function(){

    $('.owl-one').owlCarousel({
        navigation : false, 
        loop:true,
        margin:0,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                nav:true
            },
            760:{
                items:2,
                nav:true,
                margin : 20
            },
            1200:{
                items:4,
                nav:true,
                loop:true,
                margin: 20
            }

        },
        autoplay:true,
        autoplayTimeout:3000,
        autoplayHoverPause:true
    })

    $('.owl-one').on('mousewheel', '.item-carousel-one', function (e) {
        /*console.log(e.deltaY);*/
        if (e.deltaY>0) {
            $('.owl-one').trigger('next.owl');
        } else {
            $('.owl-one').trigger('prev.owl');
        }
        e.preventDefault();
    });


    $('.owl-two').owlCarousel({
        navigation : true, 
        loop:true,
        margin:0,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                nav:false,
                loop:true,
                dots: false
            },
            600:{
                items:1,
                nav:false,
                loop:true,
                dots: false


            },
            1000:{
                items:1,
                nav:false,
                loop:true,
                dots: false
            }
        },
        autoplay:true,
        autoplayTimeout:4500,
        autoplayHoverPause:true,
        navText : ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>']
    })




});