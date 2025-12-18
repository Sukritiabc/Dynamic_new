<?php
$reslgall = '';
$res_gallery = '';
$gallRec = Gallery::getParentgallery(2);
if (!empty($gallRec)) {
    foreach ($gallRec as $gallRow) {
        $childRec = GalleryImage::getGalleryImages($gallRow->id);
        if (!empty($childRec)) {
            $reslgall .= '';
            foreach ($childRec as $childRow) {
                $file_path = SITE_ROOT . 'images/gallery/galleryimages/' . $childRow->image;
                if (file_exists($file_path) and !empty($childRow->image)) {
                    $reslgall .= '
    <div class="clients-logo gallery-item">
        <a href="' . IMAGE_PATH . 'gallery/galleryimages/' . $childRow->image . '" class="img-zoom">
            <div class="gallery-box">
                <img src="' . IMAGE_PATH . 'gallery/galleryimages/' . $childRow->image . '" alt="' . $childRow->title . '">
            </div>
        </a>
    </div> ';


                }
            }
            $reslgall .= '';
        }
    }


    $res_gallery = '
              <section class="clients-one section-padding bg-darkbrown" style="padding-bottom:50px;padding-top:50px;">
        <div class="container-fluid">
            <!--<div class="row">
                <div class="col-md-12 mb-30 text-center">
                    <div class="section-subtitle">Follow and share</div>
                    <div class="section-title">#Manakamana Hillcrest on Instagram</div>
                </div>
            </div>-->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="owl-carousel owl-theme">
                        ' . $reslgall . '
                    </div>
                </div>
            </div>
        </div>
    </section>


                <!-- Gallery Ends -->';
}
$jVars['module:galleryHome'] = $res_gallery;


$dininggallery = '';
$galldining = GalleryImage::getImagelist_by(19, 3);
if (!empty($galldining)) {
    $dininggallery .= '<div class="row about">
                     <div class="demo-gallery">
    		     <div id="lightgallery" class="list-unstyled">';
    foreach ($galldining as $row) {
        $dininggallery .= '<div class="item col-sm-4 col-xs-12" data-responsive="' . IMAGE_PATH . 'gallery/galleryimages/' . $row->image . '" data-src="' . IMAGE_PATH . 'gallery/galleryimages/' . $row->image . '" data-sub-html="<h4>' . $row->title . '</h4>">
                        <a href="">
                            <img src="' . IMAGE_PATH . 'gallery/galleryimages/' . $row->image . '"/>
                        </a>
                    </div>';
    }
    $dininggallery .= '</div>
    </div>
    </div>';
}
$jVars['module:dining-gallery'] = $dininggallery;


$gallerybread = '';
$siteRegulars = Config::find_by_id(1);
$imglink = $siteRegulars->gallery_upload;
if (!empty($imglink)) {
    $img = IMAGE_PATH . 'preference/gallery/' . $siteRegulars->gallery_upload;
} else {
    $img = IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
}

$gallerybread = '
 <section class="banner-header bg-img bg-fixed" data-overlay-dark="5" data-background="' . $img . '">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="title">Image Gallery</div>
                    <!--<div class="subtitle">Check out our gallery to see the luxurious rooms, elegant dining areas, and stunning facilities that make Big Hotel a memorable destination.</div> -->
                </div>
            </div>
        </div>
    </section>
';

$jVars['module:gallery-bread'] = $gallerybread;


/**
 *      Main Gallery
 */
$thegal = $gallerylistbread = $thegalnav = '';
$gallRectit = Gallery::getParentgallery();

if ($gallRectit) {
    foreach ($gallRectit as $row) {
        $thegalnav .= '
        <li class="col-md" data-class="gb-' . $row->id . '">' . $row->title . '</li>
        ';
    }
    $items = [];
    foreach ($gallRectit as $row) {
        $gallRec = GalleryImage::getGalleryImages($row->id);
        foreach ($gallRec as $row1) {
            $file_path = SITE_ROOT . 'images/gallery/galleryimages/' . $row1->image;
            if (file_exists($file_path) and !empty($row1->image)):
                $items[] = '
                <div class="col-md-4 images" data-class="gb-' . $row->id . '" data-src="' . IMAGE_PATH . 'gallery/galleryimages/' . $row1->image . '" style="display: block;">
                        <img src="' . IMAGE_PATH . 'gallery/galleryimages/' . $row1->image . '" alt="' . $row1->title . '">
                    </div>
                ';
            endif;
        }
    }
     shuffle($items);
     $thegal = implode("\n", $items);
}

$jVars['module:gallery-list'] = $thegal;
$jVars['module:gallery-nav'] = $thegalnav;


$videomain = '';
if (defined('VIDEO_PAGE')) {
    $videodatas = Video::getAllVideos();
    if (!empty($videodatas)) {
        $videomain .= '  <section class="section-padding bg-darkbrown">
        <div class="container">
            <div class="row">';

        foreach ($videodatas as $videodata) {

            $videomain .= ' <div class="col-md-6">
                    <div class="vid-area mb-30">
                        <div class="vid-icon"> <img src="' . $videodata->thumb_image . '" alt="Vimeo">
                            <a class="video-gallery-button vid" href="' . $videodata->url . '"> <span class="video-gallery-polygon">
                                    <i class="ti-control-play"></i>
                                </span> </a>
                        </div>
                    </div>
                </div>';
        }


        $videomain .= ' </div>
        </div>
    </section>
';
    }

}
$jVars['module:video-list'] = $videomain;
