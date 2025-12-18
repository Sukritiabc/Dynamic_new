<?php
$siteRegulars = Config::find_by_id(1);
$booking_code = Config::getField('hotel_code', true);

// Start Header Output
$header = '
<nav class="navbar navbar-expand-lg">
        <div class="container-fluid px-5">
              <!-- Logo -->
            <div class="logo-wrapper">
                <a class="logo" href="'.BASE_URL.'"> 
                    <img src="'. IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload .'" data-logo="'. IMAGE_PATH . 'preference/' . $siteRegulars->logo_upload .'" class="logo-img" alt="logo_image"> 
                </a>
            </div>
            <!-- Button-->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"><i class="fa-light fa-bars"></i></span> </button>
            '.$jVars['module:res-menu'].'
                <div class="navbar-right">
                    <div class="phonex"><a><i class="fa-solid fa-phone"></i>'.$tellinked.'</a></div>
                </div>
            </div>
        </div>
    </nav>
';

// Sticky Header Script
$headerscript ='
<script>
var wind = $(window);
wind.on("scroll", function () {
    var bodyScroll = wind.scrollTop(),
        navbar = $(".navbar"),
        logo = $(".navbar .logo-img");

    if (bodyScroll > 100) {
        navbar.addClass("nav-scroll");
    } else {
        navbar.removeClass("nav-scroll");
    }
});
</script>
';

$jVars["module:header"] = $header;
$jVars["module:header-script"] = $headerscript;
?>
