<?php
$nearbydetail = $nearbydetail_modals = $imageList = $nearbybred = $nearbymain = '';
$nearbymainfinal = '';


if (defined('HOME_PAGE')) {
    $recRows = Nearby::find_all_active();

   if (!empty($recRows)) {
    // Build modals and map iframe
    foreach ($recRows as $k => $recRow) {
        if ($k == 0) {
            $nearbydetail .= '<iframe src="'.$recRow->google_embeded.'" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" id="map-frame" referrerpolicy="no-referrer-when-downgrade"></iframe>';
        }

        $nearbydetail_modals .= '
            <div class="col-lg-12 col-md-12">
                <div class="nearby1">
                    <div class="">
                        <a href="#" aria-label="Sign Up Button" data-map="' . $recRow->google_embeded . '" class="change-map">
                            <h6 class="card-title ">' . $recRow->title . '</h6>
                        </a>
                        <p class="card-text">Distance:  ' . $recRow->distance . ' <a href="#" aria-label="Sign Up Button" data-map="' . $recRow->google_embeded . '" class="change-map"><i class="fa fa-long-arrow-right"></i></a>, </p>
                    </div>
                </div>
            </div>
        ';
    }

    // Combine everything
    $nearbymain = '
    <div class="nearby section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12 text-center mb-20">
                    <div class="section-subtitle">Attractions</div>
                    <div class="section-title">Nearby Landmarks</div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="facility__content">
                        <div class="row wow fadeInUp" data-wow-delay=".5s">
                           '.$nearbydetail_modals.'
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="facility__image">
                      '.$nearbydetail.'
                    </div>
                </div>
            </div>
        </div>
    </div>';
}
}

// Assign the correct variable
$jVars['module:inner-nearby-detail'] = $nearbymain;
?>