$(document).ready(function(){

    // anchor movement from href="#name" to id="name"
    $(function() {
      $('a[href*=\\#]:not([href=\\#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
          }
        }
      });
    });

    // Banner parallax
    // $(function(){
    //   if ($(window).width() >= 768){
    //     $(function(){
    //       $(window).scroll(function(){
    //         var background = $('.banner');
    //         var yPos = -($(window).scrollTop() / 2);
    //         var coords = 'center '+ yPos + 'px';
    //         background.css('background-position', coords);
    //       });
    //     });
    //   }
    //   else {
    //     null
    //   }
    // });

    // $(document).ready(function(){

    //   var mainMenu = $('.hnav-menu .hs-menu-wrapper');

    //   // Add a Close Icon
    //   mainMenu.prepend('<i class="fa fa-times"></i>');

    //   // Toggle View of Mobile Nav
    //   $('.hnav, .hnav-menu .fa-times').click(function(){
    //      $('body').toggleClass("mobile-nav");
    //   });

    //   // Set Main Menu to Have Full Height
    //   function setHeight(){
    //     var height = $(window).height();
    //     mainMenu.height(height);
    //   }
    //   setHeight();
    //   $(window).resize(setHeight);

    // });

    /***************** Waypoints ******************/

    // $(document).ready(function() {


        $('#work').waypoint(function() {
            $(".nav-link-wrapper a:contains('Work')").addClass('active-branch');
        });
        $('#about').waypoint(function() {
            $(".nav-link-wrapper a:contains('About')").addClass('active-branch');
        });

        $('#people').waypoint(function() {
            $(".nav-link-wrapper a:contains('People')").addClass('active-branch2');
        });

        $('#resources').waypoint(function() {
            $(".nav-link-wrapper a:contains('Resources')").addClass('active-branch');
        });

        $('#contact').waypoint(function() {
            $(".nav-link-wrapper a:contains('Contact')").addClass('active-branch2');
        });

        $('.wp1').waypoint(function() {
            $('.motivate-header').addClass('animated slideInUp');
    	}, {
    		offset: '75%'
    	},{
        context: 'section'
    });
        $('.wpwork').waypoint(function() {
            $('.motivate-header').addClass('animated fadeIn');
        }, {
    		offset: '75%'
    	},{
        context: 'section'
    });
        $('.wplead').waypoint(function() {
            $('.wplead').addClass('animated fadeInUp');
        }, {
        	offset: '75%'
    	},{
        context: 'section'
    });
    	$('.wp2').waypoint(function() {
    		$('.wp2').addClass('animated fadeInLeft');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
    	$('.wp3').waypoint(function() {
    		$('.wp3').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
    	$('.wp4').waypoint(function() {
    		$('.wp4').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
    	$('.wp5').waypoint(function() {
    		$('.wp5').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
    	$('.wp6').waypoint(function() {
    		$('.wp6').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
        $('.wp7').waypoint(function() {
    		$('.wp7').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
        $('.wp8').waypoint(function() {
        	$('.wp8').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
        $('.wp9').waypoint(function() {
        	$('.wp9').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
        $('.wp10').waypoint(function() {
            $('.wp10').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
        $('.wp11').waypoint(function() {
            $('.wp11').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
        $('.wp12').waypoint(function() {
            $('.wp12').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });
        $('.wp13').waypoint(function() {
            $('.wp13').addClass('animated fadeInLeft');
    	}, {
    		offset: '80%'
    	},{
        context: 'section'
    });
        $('.wp14').waypoint(function() {
            $('.wp14').addClass('animated fadeInUp');
    	}, {
    		offset: '70%'
    	},{
        context: 'section'
    });

    // });


    /***************** Nav Transformicon ******************/


    	/* When user clicks the Icon */
    	$('.nav-toggle').click(function() {
    		$(this).toggleClass('active');
    		$('.cake').toggleClass('hideme');
    		$('.navicon').toggleClass('navicon-active');
    		$('.header-nav').toggleClass('open');
    		event.preventDefault();
    	});
    	/* When user clicks a link */
    	$('.header-nav li a').click(function() {
    		$('.nav-toggle').toggleClass('active');
    		$('.header-nav').toggleClass('open');

    	});
        
        

    /***************** flex init ******************/
      
          $('.flexslider').flexslider({
        	animation: "slide",
            prevText: "",          
            nextText: ""
    	});
      


    /***************** svg to png ******************/

      svgeezy.init(false, 'png');

});


