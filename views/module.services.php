<?php
/*
 * Service home list
 */
$rescont = $ressercont = '';
$i = 0;
$j = 0;
$subpkgRec = Services::getservice_list(4);
// var_dump($subpkgRec); die();
if (!empty($subpkgRec)) {

    foreach ($subpkgRec as $k => $v) {
        $imglink = '';
        if ($v->image != "a:0:{}") {
            $imageList = unserialize($v->image);
            $file_path = SITE_ROOT . 'images/services/' . $imageList[0];
            if (file_exists($file_path)) {
                $imglink = IMAGE_PATH . 'services/' . $imageList[0];
            }
        }
        $actv = ($i == 0) ? 'active' : '';
        $rescont .= '<li class="' . $actv . '">
                                            <a href="#coffe-shop' . $v->id . '" data-toggle="tab">
                                                <img src="' . $imglink . '">
                                                <h4>' . $v->title . '</h4>
                                            </a>
                                        </li>';
        $i++;
    }

    foreach ($subpkgRec as $k => $v) {
        $content = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($v->content));
        $actv1 = ($j == 0) ? 'active' : '';
        $ressercont .= '<div role="tabpanel" class="tab-pane fade in ' . $actv1 . '" id="coffe-shop' . $v->id . '">

                                <p>' . substr(strip_tags($content[0]), 0, 300) . '
                                <br><a href="' . BASE_URL . 'service/' . $v->slug . '" title="">Read More</a></p>
                            </div>';
        $j++;
    }
}

$jVars['module:home-service-list'] = $rescont;
$jVars['module:home-service-content-list'] = $ressercont;


$restscont = '';

$servpkgRec = Services::find_all();
// var_dump($subpkgRec); die();
if (isset($_REQUEST['slug']) and !empty($_REQUEST['slug'])) {
    $slug = $_REQUEST['slug'];
} else {
    $slug = 'health-club';
}
if (!empty($subpkgRec)) {
    $i = 0;
    $j = 0;
    $restscont .= '<div class="tab-section bg-gray body-room-5">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center">
                            <h2 class="mb-0">Services</h2>
                            <ul class="pages-link">
                                <li><a href="' . BASE_URL . 'home">Home</a></li>
                                <li>/</li>
                                <li>Services</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="dining-tabs">
                        <ul class="nav nav-tabs">';
    foreach ($servpkgRec as $key => $serRec) {
        if ($slug == $serRec->slug) {
            $class = "active";
        } else {
            $class = "";
        }
        $actv = ($i == 0) ? 'active' : '';
        $restscont .= '<li class="' . $class . '">
                                <a href="#Sauna' . $serRec->id . '" id="' . $serRec->slug . '" role="tab" data-toggle="tab">' . $serRec->title . '<small class="d-block">' . $serRec->sub_title . '</small></a>
                            </li>';
        $i++;
    }
    $restscont .= '  </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="block small-padding both-padding page">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="tab-content">';
    foreach ($servpkgRec as $key => $serRec) {
        $imageList = '';
        if ($serRec->image != "a:0:{}") {
            $imageList = unserialize($serRec->image);
        }
        if ($slug == $serRec->slug) {
            $class1 = "active";
        } else {
            $class1 = "";
        }
        $actv = ($j == 0) ? 'active' : '';
        $restscont .= '<div role="tabpanel" class="tab-pane fade in ' . $class1 . '" id="Sauna' . $serRec->id . '">
                                <div class="dining-detail">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="dining-detail-carousel">';
        // var_dump($imageList); die();
        if ($serRec->image != "a:0:{}") {
            foreach ($imageList as $key => $imgServ) {
                $restscont .= ' <div class="item">
											<img src="' . IMAGE_PATH . 'services/' . $imgServ . '" alt="' . $serRec->title . '" />
										</div>';
            }
        }
        $restscont .= ' </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="service-content">
                                               ' . substr(strip_tags($serRec->content), 0, 30000) . '
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>';
        $j++;
    }
    $restscont .= '</div>
                    </div>
                </div>
            </div><!-- container -->
        </div><!-- block -->';


}

$jVars['module:service-detail-list'] = $restscont;

$facility_bread = '';

if (defined('FACILITY_PAGE')) {
    $siteRegulars = Config::find_by_id(1);

    // Default static fallback image
    $img = BASE_URL . 'template/web/img/banner/18.jpg';

    // Check if facility banner exists
    if (!empty($siteRegulars->facility_upload)) {
        $file_path = SITE_ROOT . 'images/preference/facility/' . $siteRegulars->facility_upload;
        if (file_exists($file_path)) {
            $img = IMAGE_PATH . 'preference/facility/' . $siteRegulars->facility_upload;
        }
    }
    // If no banner, check for "other" upload
    elseif (!empty($siteRegulars->other_upload)) {
        $file_path = SITE_ROOT . 'images/preference/other/' . $siteRegulars->other_upload;
        if (file_exists($file_path)) {
            $img = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
        }
    }

    $facility_bread = '
    <section class="banner-header bg-img bg-fixed" data-overlay-dark="5" data-background="' . $img . '" style="background-image: url(&quot;img/banner/18.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="title">Facilities</div>
                    <!--<div class="subtitle"></div>-->
                </div>
            </div>
        </div>
    </section>
   ';
}

$jVars['module:facilitybread'] = $facility_bread;
$facility = "";
if (defined('FACILITY_PAGE')) {

    $record = Services::getservice_list();
    if (!empty($record)) {

        // Start the section wrapper
        $facility .= '
        <section class="amenities section-padding" style="padding-top:70px;">
          <div class="container-fluid">

                <h6 class="w-75 mb-60 text-center" style="margin:auto;letter-spacing: 0px;">
                    Our beautifully designed space, adorned with natural elements like wood, greenery, <br/>
                    and soft lighting, creates a warm and inviting atmosphere.
                </h6>
                <div class="row">
        ';

        // Loop through all records
        foreach ($record as $recRow) {

            // Prepare icon or image
            if (!empty($recRow->icon)) {
             $iconHtml = '<div class="icon"><i class="' . $recRow->icon . '"></i></div>';
            } else {
                $imglink = '';
                $img = !empty($recRow->image) ? @unserialize($recRow->image) : [];
                
                if (is_array($img) && !empty($img[0])) {
                    $file_path = SITE_ROOT . 'images/services/' . $img[0];
                    if (file_exists($file_path)) {
                        $imglink = IMAGE_PATH . 'services/' . $img[0];
                        $iconHtml = '<div class="icon"><img src="' . $imglink . '" alt="' . $recRow->title . '"></div>';
                    } else {
                        $iconHtml = '';
                    }
                } else {
                    $iconHtml = '';
                }
            }


            if (!empty($iconHtml)) {
                $facility .= '
                <div class="col-lg-3 col-md-4">
                    <div class="item hover-box mb-25">
                        <div class="cont up">
                            ' . $iconHtml . '
                            <div class="text">
                                <h5>' . $recRow->title . '</h5>
                                <p>' . $recRow->content . '</p>
                            </div>
                        </div>
                    </div>
                </div>';
            }
        }

        // Close the row and section
        $facility .= '
                </div>
            </div>
        </section>';
    }
}



$jVars['module:facility-list'] = $facility;


/*
 * Service Page
 */
$rescont = '';
$imglink = '';
$rescont_final = '';

if (defined('SERVICES_PAGE') and isset($_REQUEST['slug'])) {
    $slug = addslashes($_REQUEST['slug']);
    $subpkgRec = services::find_by_slug($slug);
    if (!empty($subpkgRec)) {
        $rescont .= '';
        $imgs = unserialize($subpkgRec->image);
        foreach ($imgs as $img) {
            $file_path = SITE_ROOT . 'images/services/' . $img;
            if (file_exists($file_path) && $img != NULL) {
                $imglink .= '<div class="text-center item bg-img" data-overlay-dark="3" data-background="' . IMAGE_PATH . 'services/' . $img . '"></div> ';
            }
        }
        $res_content = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($subpkgRec->content));
        $tru_content = (!empty($res_content[1])) ? $res_content[1] : $res_content[0];
        $rescont .= '
            <header class="header slider">
                <div class="owl-carousel owl-theme">
                    ' . $imglink . '
                </div>
                <!-- arrow down -->
                <div class="arrow bounce text-center">
                    <a href="#" data-scroll-nav="1" class=""> <i class="ti-arrow-down"></i> </a>
                </div>
            </header>
            <section class="rooms-page section-padding" data-scroll-index="1">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="section-subtitle">' . $subpkgRec->sub_title . '</div>
                            <div class="section-title mb-30">' . $subpkgRec->title . '</div>
                            ' . $tru_content . '
                        </div>
                    </div>
                </div>
            </section>
        ';
    }
}

$jVars['module:service-main'] = $rescont;


$facilityhome = '';
$facilityhomeservice = '';
$facilityhomefinal='';
if (defined('HOME_PAGE')) {
    $record = Services::getservice_list(8, 1);
    if (!empty($record)) {
        foreach ($record as $i => $recRow) {
            $img = unserialize($recRow->image);
            if (!empty($img)) {
                $file_path = SITE_ROOT . 'images/services/' . $img[0];
                if (file_exists($file_path) && $img[0] != NULL) {
                    $imglink = IMAGE_PATH . 'services/' . $img[0];
                    $facilityhome .= '
                    
                <div class="col-lg-3 col-md-6">
                    <div class="item hover-box mb-25">
                        <div class="cont up">
                            <div class=""><img src="' . $imglink . '" alt="Service Image"></div>
                            <div class="text">
                                <h5>' . $recRow->title . '</h5>
                                <p>' . strip_tags($recRow->content) . '</p>
                            </div>
                        </div>
                    </div>
                </div>

    ';
                }
            }
        }
        $facilityhomefinal .= '<section class="amenities section-padding">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-5 col-md-12 mb-30">
                    <div class="section-subtitle">Hotel Services</div>
                    <div class="section-title">Facilities</div>
                </div>
                <div class="col-md-7">
                    <p class="mb-25">Take advantage of our exceptional facilities. from relaxation to recreation, we have everything you need for an unforgettable stay.</p>
                     
                </div>
                <div class="row">
                '.$facilityhome.'
                         </div>
                </div>
               
            </div>
        </div>
    </section>';
    }

   $recordservice = Services::getservice_list('', 2);

$tabButtons = '';
$tabContents = '';

if (!empty($recordservice)) {

    foreach ($recordservice as $i => $recservice) {

        // create tab ID
        $tabId = strtolower(preg_replace('/[^a-z0-9]+/i', '-', $recservice->title));

        // active class only for the first item
        $active = ($i == 0) ? 'active-btn' : '';
        $activeTab = ($i == 0) ? 'active-tab' : '';

        // image logic
        $img = unserialize($recservice->image);

        $imglink = '';
        if (!empty($img)) {
            $file_path = SITE_ROOT . 'images/services/' . $img[0];
            if (file_exists($file_path) && $img[0] != NULL) {
                $imglink = IMAGE_PATH . 'services/' . $img[0];
            }
        }

        // Create tab button
        $tabButtons .= '
            <li data-tab="#'.$tabId.'" class="tab-btn '.$active.' me-3">
                <span>'.$recservice->title.'</span>
            </li>
        ';

        // Create tab content
        $tabContents .= '
            <div class="tab '.$activeTab.'" id="'.$tabId.'">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-6 col-md-12">
                        <img src="'.$imglink.'" class="img-fluid" alt="">
                    </div>
                    <div class="col-lg-5 offset-lg-1 col-md-12">
                        <div class="section-subtitle">'.$recservice->sub_title.'</div>
                        <div class="section-title">'.$recservice->title.'</div>
                        <p>'.strip_tags(substr($recservice->content, 0, 300)).'...</p>
                        <a type="button" class="button-3 w-35" href="' . $recservice->linksrc. '">
                            <i class="fa-solid fa-user-chef"></i> View more
                        </a>
                    </div>
                </div>
            </div>
        ';
    }

    // Wrap everything into ONE SECTION
    $facilityhomeservice = '
<section class="facilities2 bg-lightbrown2" >
    <div class="border-bottom">
        <div class="container">
            <ul class="tab-buttons" style="display:flex; flex-wrap:nowrap; overflow-x:auto; white-space:nowrap;">
                '.$tabButtons.'
            </ul>
        </div>
    </div>
    <div class="container">
        <div class="tabs-content">
            '.$tabContents.'
        </div>
    </div>
</section>';
}

 }//ya saamma
         
if (defined('FACILITY_PAGE')) {


    $record = Services::getservice_list(30, 1);
    if (!empty($record)) {
        foreach ($record as $recRow) {
            if (!empty($recRow->icon)) {
                $facilityhome .= '
                 <div class="col">
                            <div class="ul-service">
                                <div class="ul-service-icon"><i class="fa-light ' . $recRow->icon . '"></i></div>
                                <span class="ul-service-title">' . $recRow->title . '</span>
                                <p class="ul-service-descr">' . $recRow->content . '</p>
                            </div>
                        </div>

                ';
            } else {

                 if (!empty($recRow->icon)) {
             $iconHtml = '<div class="icon"><i class="' . $recRow->icon . '"></i></div>';
            } else {
                $imglink = '';
                $img = !empty($recRow->image) ? @unserialize($recRow->image) : [];
                
                if (is_array($img) && !empty($img[0])) {
                    $file_path = SITE_ROOT . 'images/services/' . $img[0];
                    if (file_exists($file_path)) {
                        $imglink = IMAGE_PATH . 'services/' . $img[0];
                        $iconHtml = '<div class="icon"><img src="' . $imglink . '" alt="' . $recRow->title . '"></div>';
                    } else {
                        $iconHtml = '';
                    }
                } else {
                    $iconHtml = '';
                }
            }
            }
        }
    }


}

$jVars['module:facility-list-home'] = $facilityhomefinal;
$jVars['module:facility-service-home'] = $facilityhomeservice;


?>