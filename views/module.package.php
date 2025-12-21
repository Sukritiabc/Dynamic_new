<?php
$booking_code = Config::getField('hotel_code', true);

$roomlist = $roombread = '';
$modalpopup = '';
$room_package = '';

/*
 * package listing page
 */
if (defined('PACKAGE_PAGE') and isset($_REQUEST['slug'])) {

    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';

    $pkgRow = Package::find_by_slug($slug);
    if ($pkgRow->type == 1) {

        $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
        $pkgRowImg = $pkgRow->banner_image;
        $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;

        if ($pkgRowImg != "a:0:{}") {
            $pkgRowList = unserialize($pkgRowImg);
            $file_path = SITE_ROOT . 'images/package/banner/' . $pkgRowList[0];

            if (!empty($pkgRowList[0]) && file_exists($file_path)) {
                $imglink = IMAGE_PATH . 'package/banner/' . $pkgRowList[0];
            } else {
                // static fallback image
                $imglink = BASE_URL . 'template/web/img/default-package.jpg';
            }
        } else {
            // static image when no banner image exists at all
            $imglink = BASE_URL . 'template/web/img/rooms/02.jpg';
        }


        $roombread .= '
        <section class="banner-header bg-img bg-fixed" data-overlay-dark="5" data-background="' . $imglink . '">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1>' . $pkgRow->title . '</h1>
                </div>
            </div>
        </div>
    </section>
        
';

        $sql = "SELECT *  FROM tbl_package_sub WHERE status='1' AND type = '{$pkgRow->id}' ORDER BY sortorder DESC ";

        $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
        $limit = 200;
        $total = $db->num_rows($db->query($sql));
        $startpoint = ($page * $limit) - $limit;
        $sql .= " LIMIT " . $startpoint . "," . $limit;
        $query = $db->query($sql);
        $pkgRec = Subpackage::find_by_sql($sql);
        // pr($pkgRec);
        $image = '';

        if (!empty($pkgRec)) {



            $roomlist = '<div class="row">'; // OPEN ROW

            foreach ($pkgRec as $subpkgRow) {

                // Image
                $image = '';
                if ($subpkgRow->image != "a:0:{}") {
                    $list = unserialize($subpkgRow->image);
                    if (!empty($list)) {
                        $image = '<img src="' . IMAGE_PATH . 'subpackage/' . $list[0] . '" alt="package_image">';
                    }
                }

                // Column start
                $roomlist .= '
    <div class="col-lg-6 col-md-12 mb-30">
        <div class="item">
            <div class="img">' . $image . '</div>

            <div class="wrap mt-n4">
                <div class="cont">
                   '.(!empty($subpkgRow->onep_price) ? '
                    <div class="price">' . $subpkgRow->currency . $subpkgRow->onep_price . '
                        <span>/ night</span>
                    </div>
                    ' : '').'


                    <h3>
                        <a href="' . BASE_URL . $subpkgRow->slug . '">' . $subpkgRow->title . '</a>
                    </h3>

                    <div class="details">

                       '.(!empty($subpkgRow->occupancy) ? '
                        <span><i class="fa-thin fa-user"></i> ' . $subpkgRow->occupancy . '</span>
                        ' : '').'
                        
                       '.(!empty($subpkgRow->room_size) ? '
                        <span><i class="fa-thin fa-expand"></i> ' . $subpkgRow->room_size . '</span>
                        ' : '').'
                    </div>
                </div>

                 <div class="arrow ms-auto align-self-start">
    <a href="' . BASE_URL . $subpkgRow->slug . '">
        <span class="fa-regular fa-arrow-right"></span>
    </a>
</div>';

                // FEATURES (up to 3 icons)
                if (!empty($subpkgRow->feature)) {
                    $ftRec = unserialize($subpkgRow->feature);

                    $roomlist .= '<ul class="mt-2">';

                    $shown = 0;
                    foreach ($ftRec as $f) {
                        if ($shown >= 3)
                            break;

                        if (!empty($f[1])) {
                            foreach ($f[1] as $fid) {
                                if ($shown >= 3)
                                    break;

                                $icon = Features::find_by_id($fid);

                                $roomlist .= '
                        <li style="display:inline-block; margin-right:8px;">
                            <i class="' . $icon->icon . '" title="' . $icon->title . '" style="font-size:28px;"></i>
                        </li>';

                                $shown++;
                            }
                        }
                    }

                    $roomlist .= '</ul>';
                }

                $roomlist .= '
            </div> <!-- wrap -->
        </div> <!-- item -->
    </div> <!-- col -->';
            }

            $roomlist .= '</div> <!-- row -->'; // CLOSE ROW



            $room_package = '
            <section class="rooms1" style="padding-top:70px;">
                <div class="container">' . $pkgRow->content . '</div>
                    <section class="rooms1" data-scroll-index="1">
                <div class="container">
                    <div class="row">
                            ' . $roomlist . '
                        </div>
                </div>
            </section>';
        }
    } elseif ($pkgRow->id == 8) {

        $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
        $pkgRowImg = $pkgRow->banner_image;
        if ($pkgRowImg != "a:0:{}") {
            $pkgRowList = unserialize($pkgRowImg);
            $file_path = SITE_ROOT . 'images/package/banner/' . $pkgRowList[0];
            if (file_exists($file_path) and !empty($pkgRowList[0])) {
                $imglink = IMAGE_PATH . 'package/banner/' . $pkgRowList[0];
            } else {
                $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
            }
        }

        $roombread .= '
        <div class="banner-header section-padding valign bg-img bg-darkbrown1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>' . $pkgRow->title . '</h1>
                </div>
            </div>
        </div>
    </div>
';

        $sql = "SELECT *  FROM tbl_package_sub WHERE status='1' AND type = '{$pkgRow->id}' ORDER BY sortorder DESC ";

        $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
        $limit = 200;
        $total = $db->num_rows($db->query($sql));
        $startpoint = ($page * $limit) - $limit;
        $sql .= " LIMIT " . $startpoint . "," . $limit;
        $query = $db->query($sql);
        $pkgRec = Subpackage::find_by_sql($sql);
        // pr($pkgRec);
        $image = '';

        if (!empty($pkgRec)) {

            foreach ($pkgRec as $key => $subpkgRow) {
                $imageList = '';
                $image = '';
                if ($subpkgRow->image != "a:0:{}") {
                    $imageList = unserialize($subpkgRow->image);
                    if (!empty($imageList)) {
                        $image .= '<img src="' . IMAGE_PATH . 'subpackage/' . $imageList[0] . '" alt="package_image" >';
                    }
                }
                // pr($subpkgRow);

                $roomlist .= '
                <div class="col-lg-4 col-md-6">
                    <div class="pricing-card">
                        <div class="img"><a href="' . BASE_URL . '' . $subpkgRow->slug . '">' . $image . '</a></div>
                        <div class="desc">
                            <div class="name"><a href="' . BASE_URL . '' . $subpkgRow->slug . '">' . $subpkgRow->title . '</a></div>
';
                $itineraryInfos = Itinerary::get_itinerarylimit($subpkgRow->id);
                if (!empty($itineraryInfos)) {
                    $roomlist .= '<ul class="list-unstyled list">';
                    foreach ($itineraryInfos as $itineraryInfo) {
                        $roomlist .= '<li><i class="ti-check"></i>' . $itineraryInfo->title . '</li>';

                    }
                    $roomlist .= '</ul>';
                }


                $roomlist .= '
                              </div>
                    </div>
                </div>



                ';
            }

            $room_package = '
              <section class="pricing section-padding">
        <div class="container">
            <div class="row">
                    ' . $roomlist . '
                   </div>
        </div>
    </section>';
        }
    } else {
        $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
        $pkgRowImg = $pkgRow->banner_image;
        if ($pkgRowImg != "a:0:{}") {
            $pkgRowList = unserialize($pkgRowImg);
            $file_path = SITE_ROOT . 'images/package/banner/' . $pkgRowList[0];
            if (file_exists($file_path) and !empty($pkgRowList[0])) {
                $imglink = IMAGE_PATH . 'package/banner/' . $pkgRowList[0];
            } else {
                $imglink = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
            }
        }
        $roombread .= '
           <div class="banner-header section-padding valign bg-img" data-overlay-dark="5" data-background="' . $imglink . '">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>' . $pkgRow->title . '</h1>
                </div>
            </div>
        </div>
    </div>
';

        $sql = "SELECT *  FROM tbl_package_sub WHERE status='1' AND type = '{$pkgRow->id}' ORDER BY sortorder DESC ";

        $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
        $limit = 200;
        $total = $db->num_rows($db->query($sql));
        $startpoint = ($page * $limit) - $limit;
        $sql .= " LIMIT " . $startpoint . "," . $limit;
        $query = $db->query($sql);
        $pkgRec = Subpackage::find_by_sql($sql);

        // pr($pkgRec);

        if (!empty($pkgRec)) {

            $count = 1;


            $max_count = count($subpkgRec);

            foreach ($pkgRec as $key => $subpkgRow) {
                $gallRec = SubPackageImage::getImagelimit_by(3, $subpkgRow->id);
                $subpkg_caro = '';
                foreach ($gallRec as $row) {
                    $file_path = SITE_ROOT . 'images/package/galleryimages/' . $row->image;
                    if (file_exists($file_path) and !empty($row->image)):

                        // $active=($count==0)?'active':'';
                        $subpkg_caro .= '
                    <div class="mad-owl-item">
                                        <img src="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" alt="' . $row->title . '" />
                                    </div>



                                ';


                    endif;
                }

                $button = '';
                $modal = '';
                $imageList = '';
                $image = '';
                if ($subpkgRow->image != "a:0:{}") {
                    $imageList = unserialize($subpkgRow->image);
                    if (!empty($imageList)) {
                        $image .= '<img src="' . IMAGE_PATH . 'subpackage/' . $imageList[0] . '" alt="subpackage_image" >';
                    }
                }

                //  <div class="ul-project-info">
                //                                 <span class="icon"><i class="fa-light fa-timer"></i></span>
                //                                 <span class="text">' . $subpkgRow->theatre_style. '</span>
                //                             </div>
                $roomlist .= '
<div class="item mt-20">
    <div class="img">
        <img src="' . $imagepath . '" alt="subpackage_image">
    </div>

    <div class="wrap">
        <div class="cont">
            <div class="price">' . $subpkgRow->currency . $subpkgRow->onep_price . ' <span>/ night</span></div>

            <h3><a href="' . BASE_URL . $subpkgRow->slug . '">' . $subpkgRow->title . '</a></h3>

             <div class="details">
                        <span><i class="fa-thin fa-user"></i> ' . $subpkgRow->occupancy . '</span>
                        <span><i class="fa-thin fa-expand"></i> ' . $subpkgRow->room_size . '</span>
                    </div>
        </div>

        <div class="arrow">
            <a href="' . BASE_URL . $subpkgRow->slug . '">
                <span class="fa-regular fa-arrow-right"></span>
            </a>
        </div>
    </div>
</div>';




                $room_package = '
                  <section class="rooms1 section-padding" data-scroll-index="1">
        <div class="container">
            <div class="row">
                    ' . $roomlist . '
               </div>
        </div>
    </section>';
            }
        }
    }

}


/*
 * package homepage listing
 */
$homeroomdetail = '';
if (defined('HOME_PAGE')) {

    $sql = "SELECT *  FROM tbl_package_sub WHERE status='1' AND type = '5' ORDER BY sortorder DESC ";

    $page = (isset($_REQUEST["pageno"]) and !empty($_REQUEST["pageno"])) ? $_REQUEST["pageno"] : 1;
    $limit = 200;
    $total = $db->num_rows($db->query($sql));
    $startpoint = ($page * $limit) - $limit;
    $sql .= " LIMIT " . $startpoint . "," . $limit;
    $query = $db->query($sql);
    $pkgRec = Subpackage::find_by_sql($sql);

    if (!empty($pkgRec)) {

        $pkgdetail = Package::find_by_id(5);

        $roomlist = '';

        foreach ($pkgRec as $key => $subpkgRow) {

            $imageList = unserialize($subpkgRow->image);
            $imagepath = '';

            if (!empty($imageList[0])) {
                $file_path = SITE_ROOT . 'images/subpackage/' . $imageList[0];
                if (file_exists($file_path)) {
                    $imagepath = IMAGE_PATH . 'subpackage/' . $imageList[0];
                }
            }

            $feature_list = '';

            if (!empty($subpkgRow->feature)) {

                $ftRec = unserialize($subpkgRow->feature);

                if (!empty($ftRec)) {
                    foreach ($ftRec as $k => $v) {

                        if (empty($v[1]))
                            continue;

                        $max_features = 3;
                        $count = 0;

                        foreach ($v[1] as $vv) {

                            if ($count >= $max_features)
                                break;

                            $sfetname = Features::find_by_id($vv);

                            // Always show icons (no images)
                            $feature_list .= '
                                <span style="margin-right:12px;">
                                    <i class="' . $sfetname->icon . '" title="' . $sfetname->title . '"></i>
                                </span>';

                            $count++;
                            //      if (!empty($sfetname->image)) {
                            //                 $feature_list .= '
                            // <li><img src="' . BASE_URL . 'images/features/' . $sfetname->image . '" alt="wifi" title="' . $sfetname->title . '"></li>
                            //       ';
                            //             } else {
                            //                 $feature_list .= '
                            // <li><i class="' . $sfetname->icon . '" title="' . $sfetname->title . '"></i></li>';
                            //             }

                            //             $i++;
                            //             $count++;
                        }
                    }
                }
            }

            $roomlist .= '
<div class="item mt-20">
    <div class="img">
        <img src="' . $imagepath . '" alt="subpackage_image">
    </div>

    <div class="wrap">
        <div class="cont">
         '.(!empty($subpkgRow->currency . $subpkgRow->onep_price) ? '
            <div class="price">' . $subpkgRow->currency . $subpkgRow->onep_price . ' <span>/ night</span></div>
            ' : '').'
            <h3><a href="' . BASE_URL . $subpkgRow->slug . '">' . $subpkgRow->title . '</a></h3>

             <div class="details">
                        '.(!empty($subpkgRow->occupancy) ? '
                        <span><i class="fa-thin fa-user"></i> ' . $subpkgRow->occupancy . '</span>
                        ' : '').'
                        
                       '.(!empty($subpkgRow->room_size) ? '
                        <span><i class="fa-thin fa-expand"></i> ' . $subpkgRow->room_size . '</span>
                        ' : '').'
                    </div>
        </div>

        <div class="arrow">
            <a href="' . BASE_URL . $subpkgRow->slug . '">
                <span class="fa-regular fa-arrow-right"></span>
            </a>
        </div>
    </div>
</div>';
        }


        $homeroomdetail .= '
<section class="rooms1 section-padding bg-darkgray">
    <div class="container">
        <div class="row mb-30 align-items-center">
            <div class="col-md-5 text-left">
                <div class="section-subtitle">Luxury Resort Hotel</div>
                <div class="section-title white mb-0">' . $pkgdetail->title . '</div>
            </div>

            <div class="col-md-5">
                <p>' . $pkgdetail->brief . '</p>
            </div>

            <div class="col-md-2 d-flex justify-content-center justify-content-lg-end">
                <div class="my-owl-nav">
                    <span class="my-prev-button"><i class="fa-light fa-angle-left"></i></span>
                    <span class="my-next-button"><i class="fa-light fa-angle-right"></i></span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="owl-carousel owl-theme">
                    ' . $roomlist . '
                </div>
            </div>
        </div>
    </div>
</section>';
    }
}



$jVars['module:list-modalpop-up'] = $modalpopup;
$jVars['module:list-room-detail'] = $homeroomdetail;
$jVars['module:list-package-room'] = $room_package; //package list garne
$jVars['module:list-package-room-bred'] = $roombread;


/*
 * Sub package detail
 */
$resubpkgDetail = '';
$subimg = '';
$imageList = '';
$subpkg_img = '';

if (defined('SUBPACKAGE_PAGE') and isset($_REQUEST['slug'])) {
    $slug = !empty($_REQUEST['slug']) ? addslashes($_REQUEST['slug']) : '';
    $subpkgRec = Subpackage::find_by_slug($slug);
    $gallRec = SubPackageImage::getImagelist_by($subpkgRec->id);

    $booking_code = Config::getField('hotel_code', true);
    if (!empty($subpkgRec)) {
        $pkhdata = Package::find_by_id($subpkgRec->type);
        // pr($pkhdata);
        if ($pkhdata->type == 1) {
            $relPacs = Subpackage::get_relatedpkg(1, $subpkgRec->id, 12);

              $imglink = '';
            $img = $subpkgRec->image2;
            if (!empty($siteRegulars->other_upload)) {
                $defaultImg = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
            } else {
                $defaultImg = BASE_URL . 'template/web/img/rooms/02.jpg';
                ;
            }
            // Start with default banner
            $imglink = $defaultImg;
            // If the article has images
            if (!empty($img) && $img != "a:0:{}") {
                $file_path = SITE_ROOT . 'images/subpackage/image/' . $img;
                if (file_exists($file_path)) {
                    $imglink = IMAGE_PATH . 'subpackage/image/' . $img;
                }
            }

            $pkgRec = Package::find_by_id($subpkgRec->type);
            $subpkg_carousel = '';
            if (!empty($gallRec)) {
                $subpkg_carousel .= '';
                foreach ($gallRec as $row) {
                    $file_path = SITE_ROOT . 'images/package/galleryimages/' . $row->image;
                    if (file_exists($file_path) and !empty($row->image)):
                        $subpkg_carousel .= '
                            <div class="item">
                            <a href="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" title="" class="gallery-masonry-item-img-link img-zoom">
                                <div class="img"> <img src="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" class="img-fluid mx-auto d-block" alt=""> </div>
                            </a>
                        </div>';
                    endif;
                }
               
            }

            $resubpkgDetail .= '
                <section class="banner-header full-height valign bg-img" data-overlay-dark="5" style="background-image:url('.$imglink.')">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-12 text-center">
                                <h1>'.$subpkgRec->title.'</h1>
                                <div class="details">
                                    <span><i class="fa-thin fa-user"></i> ' . $subpkgRec->occupancy . '</span>
                                    <span><i class="fa-thin fa-expand"></i> ' . $subpkgRec->room_size . '</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            ';
            // pr($imglink);


            $resubpkgDetail .= '
            <section class="page-details section-padding">
                <div class="container">
                
                    <div class="row">
                        <!-- LEFT CONTENT -->
                        <div class="col-lg-7 col-md-12 mb-30">
                            <div class="row mb-30">
                                <div class="col-md-12">
                                    <div class="section-subtitle">' . $subpkgRec->short_title . '</div>
                                    <div class="section-title">' . $subpkgRec->title . '</div>
                                    ' . $subpkgRec->content . '
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-lg-4 offset-lg-1 col-md-12">
                            <div class="row mb-30">
                                <div class="col-md-12 text-center">
                                    <div class="design-room">
                                        <p class="pb-30" style="font-size:20px;">Book Your Room Today!</p>
                                        <a href="#" class="button-3" data-bs-toggle="modal" data-bs-target="_blank">
                                            <i class="fa-solid fa-thumbs-up"></i> Book Your Stay
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="cont">
                ';


            if (!empty($subpkgRec->feature)) {
                $ftRec = unserialize($subpkgRec->feature);
                if (!empty($ftRec)) {
                    foreach ($ftRec as $k => $v) {
                        if (empty($v[1]))
                            continue;
                        $feattitle = !empty($v[0][0]) ? $v[0][0] : $fparent;

                        $resubpkgDetail .= '<h5>' . $feattitle . '</h5>';
                        $resubpkgDetail .= '<ul class="list">';

                        foreach ($v[1] as $vv) {
                            $sfetname = Features::find_by_id($vv);
                            if (!empty($sfetname->image)) {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><img src="' . BASE_URL . 'images/features/' . $sfetname->image . '" /></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            } else {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><i class="' . $sfetname->icon . '"></i></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            }
                        }

                        $resubpkgDetail .= '</ul>';
                    }
                }
            }

            $resubpkgDetail .= '
                            </div>
                        </div>
                    </div> <!-- END FIRST ROW -->
                </div>
            </section>
             <section class="galleryscroll mb-30">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-md-12 text-center mb-20">
                            <div class="section-title">Gallery Of '.$subpkgRec->title.'</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="owl-carousel owl-theme">
            ';
            $resubpkgDetail .= $subpkg_carousel;
            $resubpkgDetail .= '
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            ';

            //ya bata

        } /******** For service inner page ***************/ 
        elseif ($subpkgRec->type == 6) {
            $relPacs = Subpackage::get_relatedpkg(6, $subpkgRec->id, 12);

              $imglink = '';
            $img = $subpkgRec->image2;
            if (!empty($siteRegulars->other_upload)) {
                $defaultImg = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
            } else {
                $defaultImg = BASE_URL . 'template/web/img/banner/11.jpg';
                ;
            }
            // Start with default banner
            $imglink = $defaultImg;
            // If the article has images
            if (!empty($img) && $img != "a:0:{}") {
                $file_path = SITE_ROOT . 'images/subpackage/image/' . $img;
                if (file_exists($file_path)) {
                    $imglink = IMAGE_PATH . 'subpackage/image/' . $img;
                }
            }

            $pkgRec = Package::find_by_id($subpkgRec->type);
            $subpkg_carousel = '';
            if (!empty($gallRec)) {
                $subpkg_carousel .= '';
                foreach ($gallRec as $row) {
                    $file_path = SITE_ROOT . 'images/package/galleryimages/' . $row->image;
                    if (file_exists($file_path) and !empty($row->image)):
                        $subpkg_carousel .= '
                            <div class="item">
                            <a href="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" title="" class="gallery-masonry-item-img-link img-zoom">
                                <div class="img"> <img src="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" class="img-fluid mx-auto d-block" alt=""> </div>
                            </a>
                        </div>';
                    endif;
                }
               
            }

            $resubpkgDetail .= '
                <section class="banner-header full-height valign bg-img" data-overlay-dark="5" style="background-image:url('.$imglink.')">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-12 text-center">
                                <h1>'.$subpkgRec->title.'</h1>
                            </div>
                        </div>
                    </div>
                    
                </section>
            ';


            $resubpkgDetail .= '
            <section class="page-details section-padding">
                <div class="container">
                
                    <div class="row">
                        <!-- LEFT CONTENT -->
                        <div class="col-lg-7 col-md-12 mb-30">
                            <div class="row mb-30">
                                <div class="col-md-12">
                                    <div class="section-subtitle">' . $subpkgRec->short_title . '</div>
                                    <div class="section-title">' . $subpkgRec->title . '</div>
                                    ' . $subpkgRec->content . '
                                </div>
                            </div>
                        </div>
                    
                        <div class="col-lg-4 offset-lg-1 col-md-12">
                            
                            <div class="cont">
                ';


            if (!empty($subpkgRec->feature)) {
                $ftRec = unserialize($subpkgRec->feature);
                if (!empty($ftRec)) {
                    foreach ($ftRec as $k => $v) {
                        if (empty($v[1]))
                            continue;
                        $feattitle = !empty($v[0][0]) ? $v[0][0] :$fparent;

                        $resubpkgDetail .= '<h5>' . $feattitle . '</h5>';
                        $resubpkgDetail .= '<ul class="list">';

                        foreach ($v[1] as $vv) {
                            $sfetname = Features::find_by_id($vv);
                            if (!empty($sfetname->image)) {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><img src="' . BASE_URL . 'images/features/' . $sfetname->image . '" /></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            } else {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><i class="' . $sfetname->icon . '"></i></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            }
                        }

                        $resubpkgDetail .= '</ul>'
                        ;
                        
                    }
                }
            }

           $columns = [
                'Hall Name' => $subpkgRec->title,
                '<img src="template/web/img/icon/area.png">Hall Size' => $subpkgRec->size,
                '<img src="template/web/img/icon/u-shaped.png">U Shape' => $subpkgRec->shape,
                '<img src="template/web/img/icon/class.png">Classroom' => $subpkgRec->class_room_style,
                '<img src="template/web/img/icon/seats-map.png">Theatre' => $subpkgRec->theatre_style,
                '<img src="template/web/img/icon/round-table.png">Round Table' => $subpkgRec->round_table,
            ];

            // remove empty columns
            $columns = array_filter($columns, function ($v) {
                return !empty($v);
            });

            $resubpkgDetail .= '
            </div>
            </div>

            <table class="table table-bordered border border-danger mb-30"
                style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
            <thead>
            <tr>';

            foreach (array_keys($columns) as $header) {
                $resubpkgDetail .= '<th scope="col">' . $header . '</th>';
            }

            $resubpkgDetail .= '
            </tr>
            </thead>
            <tbody>
            <tr>';

            foreach ($columns as $value) {
                $resubpkgDetail .= '<td>' . $value . '</td>';
            }

            $resubpkgDetail .= '
            </tr>
            </tbody>
            </table>';

            /* ================= CTA ================= */
            $resubpkgDetail .= '
            </div> <!-- END FIRST ROW -->
                    </div> <!-- END FIRST ROW -->
                    <div class="col-md-12 text-center">
                            <div class="design-hall">
                                <p class="pb-30" style="font-size: 20px;">Book Your Perfect Event Hall Today! Secure your spot for meetings, parties, conferences, and more.</p>
                                <a href="#" class="button-3" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-thumbs-up"></i> Book Now</a>
                            </div>
                        </div>
                        
                </div>
                
            </section>
             <section class="galleryscroll mb-30">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-md-12 text-center mb-20">
                            <div class="section-title">Gallery Of '.$subpkgRec->title.'</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="owl-carousel owl-theme">
            ';
            $resubpkgDetail .= $subpkg_carousel;
            $resubpkgDetail .= '
                            </div>
                        </div>
                    </div>
                </div>
            </section>
              <div class="modal fade hall-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel" style="color:#6e2a40;">Hall Enquiry</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="contactform" class="d-flex flex-column gap-3" novalidate="novalidate">
                        <div class="form-group text-start">
                            <label for="name" class="mb-3">Full Name <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="text" name="name" id="name" placeholder="Full Name" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="email" class="mb-3">Your Email <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="email" name="email" id="email" placeholder="Enter your email" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="phone" class="mb-3">Mobile No. <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="number" name="phone" id="phone" placeholder="Enter your number" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="event_name" class=" mb-3">Event Name <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="text" name="event_name" id="event_name" placeholder="Event Name" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="event_date" class=" mb-3">Event Date <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="date" name="event_date" id="event_date" placeholder="Event Date" required="" class="hasDatepicker" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="pax" class="  mb-3">No. of Pax <span class="ninja-forms-req-symbol">*</span></label>
                            <div class="position-relative">
                                <input type="number" min="1" name="pax" id="pax" placeholder="Enter Pax" required="" aria-required="true">
                            </div>
                        </div>

                        <div class="form-group text-start">
                            <label for="message" class=" mb-3">Message <span class="ninja-forms-req-symbol">*</span></label>
                            <textarea class="form-control" id="message" name="message" placeholder="Message"></textarea>
                        </div>
                        
                        <div class="form-group text-start">
                            <div class="position-relative">
                                <input type="hidden" id="message" name="message" value="'.$subpkgRec->title.'">
                            </div>
                        </div>

                        <div class="d-flex flex-wrap justify-content-center gap-4 mt-20 mb-20">
                            <div class="is__social facebook">
                                <div id="result_msg" class="alert-success alert" style="display: none"></div>
                                <button class="theme-btn btn-style sm-btn" type="submit" id="submit"><span>Send</span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
            ';

            //ya bata

        }  /******** For other inner page ***************/ 
        elseif ($subpkgRec->type == 8) {
            $relPacs = Subpackage::get_relatedpkg(1, $subpkgRec->id, 12);
            $imglink = '';
            if (!empty($subpkgRec->image2)) {
                $file_path = SITE_ROOT . 'images/subpackage/image/' . $subpkgRec->image2;
                if (file_exists($file_path)) {
                    $imglink = IMAGE_PATH . 'subpackage/image/' . $subpkgRec->image2;
                } else {
                    $imglink = IMAGE_PATH . 'static/default.jpg';
                }
            } else {
                $imglink = IMAGE_PATH . 'static/default.jpg';
            }
            $gallRec = SubPackageImage::getImagelist_by($subpkgRec->id);
            $subpkg_carousel = '';
            if (!empty($gallRec)) {
                foreach ($gallRec as $row) {
                    $file_path = SITE_ROOT . 'images/package/galleryimages/' . $row->image;
                    if (file_exists($file_path) and !empty($row->image)):
                        $subpkg_carousel .= '
                        <section class="banner-header full-height valign bg-img" data-overlay-dark="4"  data-background="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '"
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-12 text-center">
                                        <div class="title mb-0">Hall</div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    ';
                    endif;
                }


            }

            $resubpkgDetail .= '
             <header class="header slider">
        <div class="owl-carousel owl-theme">
           ' . $subpkg_carousel . '
        </div>
        <!-- arrow down -->
        <div class="arrow bounce text-center">
            <a href="#" data-scroll-nav="1" class=""> <i class="ti-arrow-down"></i> </a>
        </div>
    </header>


            ';
            $resubpkgDetail .= '
             <section class="rooms-page section-padding" data-scroll-index="1">
        <div class="container">
            <!-- project content -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="section-title">Hiking</div>
                    <p class="mb-30">
                    ' . $subpkgRec->content . '</p>
                </div>

                <div class="col-md-12 text-center">
                    <div class="row justify-content-md-center">
                        <div class="col-md-2 pricing-card  mt-30" style="background: transparent;">
                            <div class="amount">' . $subpkgRec->currency . $subpkgRec->onep_price . '<span>/ person</span></div>
                        </div>
                        <div class="col-md-2">
                            <a class="btn-form1-submit activity-btn mt-15" href="https://wa.me/' . $siteRegulars->whatsapp_a . '" data-bs-toggle="modal" data-bs-target="#exampleModalactivities">Enquiry now</a>
                        </div>
                    </div>
                </div>
            </div>

       ';
            $resubpkgDetail .= '
<div class="row">
    <div class="col-md-12 text-center"><h4 class="mt-30">Our Itinerary</h4></div>
';

            $itineraryInfos = Itinerary::get_itinerary($subpkgRec->id);
            if (!empty($itineraryInfos)) {
                $count = 0;
                foreach ($itineraryInfos as $itineraryInfo) {
                    // Open first column every 3 items (start of set)
                    if ($count % 3 == 0) {
                        // If it's not the very first item, close previous column
                        if ($count > 0 && $count % 6 == 0) {
                            // Close previous row and start a new one after 6 items
                            $resubpkgDetail .= '
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <ul class="accordion-box clearfix">';
                        } elseif ($count % 6 == 3) {
                            // Start second column after 3 items
                            $resubpkgDetail .= '
                </ul>
            </div>
            <div class="col-md-6">
                <ul class="accordion-box clearfix">';
                        } elseif ($count == 0) {
                            // Start first column on first iteration
                            $resubpkgDetail .= '
                <div class="col-md-6">
                    <ul class="accordion-box clearfix">';
                        }
                    }

                    // Add the itinerary item
                    $resubpkgDetail .= '
        <li class="accordion block">
            <div class="acc-btn">' . $itineraryInfo->title . '</div>
            <div class="acc-content">
                <div class="content">
                    <div class="text">' . $itineraryInfo->content . '</div>
                </div>
            </div>
        </li>';

                    $count++;
                }

                // Close open tags properly
                $resubpkgDetail .= '
                </ul>
            </div>
        </div>
        ';
            } else {
                $resubpkgDetail .= '
        <div class="col-md-12"><p class="text-center">No itinerary available.</p></div>
    </div>';
            }


            $resubpkgDetail .= '    </div>
    </section>

     <div class="modal fade" id="exampleModalactivities" tabindex="-1" aria-labelledby="exampleModalactivities" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background: #e4e7e9;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Enquiry Form</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="activityform" class="contact__form contactform_4" >
                        <!-- form elements -->
                        <div class="row">
                            <input type="hidden" name="slug" value="' . $subpkgRec->slug . '"/>
                            <div class="col-md-12 form-group">
                                <input name="name" type="text" placeholder="Full Name *" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <input name="email" type="email" placeholder="Email Address *" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <input name="phone" type="text" placeholder="Phone Number *" required>
                            </div>
                            <div class="col-md-12 form-group">
                                <textarea name="message" id="message" cols="30" rows="4" placeholder="Message *" required></textarea>
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="g-recaptcha" data-sitekey="6LeTWg4sAAAAAALJoGmx_RfzVCgwJ9_pS1TFfYdI" style="margin-top:15px;"></div>
                            </div>
                            <div id="result_msg"></div>
                            <div class="col-md-12">
                                <button type="submit" id="submit" class="butn-dark2" style="margin-top:15px;"><span>Send Message</span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    ';


        } /******** For other other inner page ***************/ 
        else {
            $relPacs = Subpackage::get_relatedpkg(6, $subpkgRec->id, 12);

              $imglink = '';
            $img = $subpkgRec->image2;
            if (!empty($siteRegulars->other_upload)) {
                $defaultImg = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
            } else {
                $defaultImg = BASE_URL . 'template/web/img/banner/11.jpg';
                ;
            }
            // Start with default banner
            $imglink = $defaultImg;
            // If the article has images
            if (!empty($img) && $img != "a:0:{}") {
                $file_path = SITE_ROOT . 'images/subpackage/image/' . $img;
                if (file_exists($file_path)) {
                    $imglink = IMAGE_PATH . 'subpackage/image/' . $img;
                }
            }
            $pkgRec = Package::find_by_id($subpkgRec->type);
            $subpkg_carousel = '';
            if (!empty($gallRec)) {
                $subpkg_carousel .= '';
                foreach ($gallRec as $row) {
                    $file_path = SITE_ROOT . 'images/package/galleryimages/' . $row->image;
                    if (file_exists($file_path) and !empty($row->image)):
                        $subpkg_carousel .= '
                            <div class="item">
                            <a href="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" title="" class="gallery-masonry-item-img-link img-zoom">
                                <div class="img"> <img src="' . IMAGE_PATH . 'package/galleryimages/' . $row->image . '" class="img-fluid mx-auto d-block" alt=""> </div>
                            </a>
                        </div>';
                    endif;
                }
               
            }

            $resubpkgDetail .= '
                <section class="banner-header full-height valign bg-img" data-overlay-dark="5" style="background-image:url('.$imglink.')">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8 col-md-12 text-center">
                                <h1>'.$subpkgRec->title.'</h1>
                            </div>
                        </div>
                    </div>
                </section>
            
            <section class="page-details section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-subtitle">'.$subpkgRec->short_title.'</div>
                            <div class="section-title">About '.$subpkgRec->title.'</div>
                        </div>
                    </div>
                    <div class="row mb-30">
                    <div class="col-md-12">
                        '.$subpkgRec->content.'
                    </div>
                     <div class="row mb-30">
                <div class="col-md-12 text-center">
                    <div class="design-hall">
                        <p style="font-size: 20px;">Experience delightful dining, where exceptional food, warm ambiance, and impeccable service await you. Whether it\'s a special celebration or a casual meal, we’re here to make your time with us unforgettable.</p>
                        <a href="https://wa.me/'.$siteRegulars->whatsapp_a.'"  target="_blank" class="button-3"><i class="fab fa-whatsapp"></i>Inquiry Now</a>
                    </div>
                </div>
         

            </div>
                    <div>
                    
                </div>
            </section>
           ';

                
         


            if (!empty($subpkgRec->feature)) {
                $ftRec = unserialize($subpkgRec->feature);
                if (!empty($ftRec)) {
                    foreach ($ftRec as $k => $v) {
                        if (empty($v[1]))
                            continue;
                        $feattitle = !empty($v[0][0]) ? $v[0][0] : 'Amenities';

                        $resubpkgDetail .= '<h5>' . $feattitle . '</h5>';
                        $resubpkgDetail .= '<ul class="list">';

                        foreach ($v[1] as $vv) {
                            $sfetname = Features::find_by_id($vv);
                            if (!empty($sfetname->image)) {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><img src="' . BASE_URL . 'images/features/' . $sfetname->image . '" /></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            } else {
                                $resubpkgDetail .= '
                                        <li>
                                            <span><i class="' . $sfetname->icon . '"></i></span>
                                            <span>' . $sfetname->title . '</span>
                                        </li>';
                            }
                        }

                        $resubpkgDetail .= '</ul>';
                    }
                }
            }

            $resubpkgDetail .= '
                            </div>
                        </div>
                    </div> <!-- END FIRST ROW -->
                </div>
            </section>
             <section class="galleryscroll mb-30">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-md-12 text-center mb-20">
                            <div class="section-title">Gallery Of '.$subpkgRec->title.'</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="owl-carousel owl-theme">
            ';
            $resubpkgDetail .= $subpkg_carousel;
            $resubpkgDetail .= '
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            ';

          

        } 
    }
}

$jVars['module:sub-package-detail'] = $resubpkgDetail;

$jVars['module:sub-package-d'] = $subpkg_img;
