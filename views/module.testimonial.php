<?php 

/*
* Testimonial List Home page
*/
$restst = '';   
$tstRec = Testimonial::get_alltestimonial(9);
if (!empty($tstRec)) {
    $restst .= '';
    foreach ($tstRec as $tstRow) {
        $slink = !empty($tstRow->linksrc) ? $tstRow->linksrc : 'javascript:void(0);';
        $target = !empty($tstRow->linksrc) ? 'target="_blank" rel="noreferrer"' : '';
        $rating = '';
        for ($i = 0; $i < $tstRow->type; $i++){
            $rating.='<a href="#"><i class="fa-solid fa-star"></i></a>';
        }
        $restst .= '';
        $restst .= '
        <!-- owl item -->
                            <div class="mad-grid-item">
                                <div class="mad-testimonial">
                                    <div class="mad-testimonial-info">
                                        <blockquote>
                                            <p>
                                                �' . strip_tags($tstRow->content) . '�
                                            </p>
                                        </blockquote>
                                    </div>

                                    <div class="mad-author">
                                        <div class="mad-author-info">
                                            <span class="mad-author-name">' . $tstRow->name . ' - ' . $tstRow->via_type . '</span>
                                              <a href="#"><img src="template/web/images/visor2.png" alt="tetimonial_image" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
        <!-- / owl item -->
                    ';

        $restst .= '';
    }
    $restst .= '';
}

$result_last ='
<div class="mad-section mad-section--stretched mad-colorizer--scheme-color-3 with-svg-img mad-colorizer--scheme-light  content-element-main" data-bg-image-src="footer_4_bg_img.svg">
                    <!--================ Testimonials ================-->
                    <div class="mad-testimonials style-2">
                        <div class="mad-grid mad-grid--cols-1 owl-carousel no-dots nav-size-2">
                    '. $restst .'
                    </div>
                    </div>
                    <!--================ End of Testimonials ================-->
                </div>';


$jVars['module:testimonialList123'] = $result_last;



/*
* Testimonial Header Title
*/
$tstHtitle='';

$tstHtitle = '';
if (defined('HOME_PAGE')) {
    $tstRec = Testimonial::get_alltestimonial();
    if (!empty($tstRec)) {  
        $tstHtitle .= '
            <section class="testimonials">
                <div class="bg-img bg-fixed section-padding" data-overlay-dark="5" data-background="' . BASE_URL . 'template/web/img/banner/slider1.jpg">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-7 text-center">
                                <div class="owl-carousel owl-theme">';
                    
                   foreach ($tstRec as $tstRow) {

                    $rate = str_repeat('<i class="star-rating"></i>', (int)$tstRow->rating);

                    // ✅ Static fallback image (ALWAYS exists)
                    $defaultImg = BASE_URL . 'images/testimonial/IZLof-Booking.png';

                    // Start with static image
                    $imagePath = $defaultImg;

                    // If testimonial image exists in DB
                    if (!empty($tstRow->image)) {

                        // Filesystem path (for checking existence)
                        $filePath = SITE_ROOT . 'images/testimonial/' . $tstRow->image;

                        // Public URL path
                        $publicPath = IMAGE_PATH . 'testimonial/' . $tstRow->image;

                        // Use DB image ONLY if file exists
                        if (file_exists($filePath)) {
                            $imagePath = $publicPath;
                        }
                    }

                    $tstHtitle .= '
                        <div class="item">
                            <img src="' . $imagePath . '" class="testmonial-img" alt="testimonial_image">
                            <span>' . $rate . '</span>
                            <h5>' . strip_tags($tstRow->content) . '</h5>
                            <div class="info">
                                <div class="cont">
                                    <h6>' . $tstRow->name . ' <i>|</i>
                                        <span>
                                            <a href="' . $tstRow->linksrc . '" target="_blank" rel="noopener">
                                                View on Tripadvisor
                                            </a>
                                        </span>
                                    </h6>
                                </div>
                            </div>
                        </div>';
                }


                    $tstHtitle .= '
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>';
    }
}

$jVars['module:testimonial-title'] = $tstHtitle;


/*
* Testimonial Rand
*/
$tstHead='';

$tstRand = Testimonial::get_by_rand();
if(!empty($tstRand)) {
	$tstHead.='<!-- Quote | START -->
	<div class="section quote fade">
		<div class="center">
	    
	        <div class="col-1">
	        	<div class="thumb"><img src="'.IMAGE_PATH.'testimonial/'.$tstRand->image.'" alt="'.$tstRand->name.'"></div>
	            <h5><em>'.strip_tags($tstRand->content).'</em></h5>
	            <p><span><strong>'.$tstRand->name.', '.$tstRand->country.'</strong> (Via : '.$tstRand->via_type.')</span></p>
	        </div>
	        
	    </div>
	</div>
	<!-- Quote | END -->';
}

$jVars['module:testimonial-rand'] = $tstHead;


/*
* Testimonial List
*/
$restst='';
$tstRec = Testimonial::get_alltestimonial(9);
if(!empty($tstRec)) {
	$restst.='<div class="clients_slider owl-carousel" id="testi-slider">';

        foreach($tstRec as $tstRow) {
            $slink = !empty($tstRow->linksrc)?$tstRow->linksrc:'javascript:void(0);';
            $target = !empty($tstRow->linksrc)?'target="_blank" rel="noreferrer"':'';

            
            $restst.='<div class="item">
                        <div class="media">
                        <div class="col-md-3 col-sm-3">
                            <div class="test-img">
                                <a href="'.$slink.'" '.$target.'>
                                    <img src="'.IMAGE_PATH.'testimonial/'.$tstRow->image.'" alt="'.$tstRow->name.'" class="img-responsive">
                                </a>
                            </div>
                            </div>
                            
                            <div class="col-md-9 col-sm-9">
                            <div class="media-body test">
                                <p><i>“</i>'.strip_tags($tstRow->content).'</p>
                                <a href="'.$slink.'" '.$target.'>
                                    <h4>'.$tstRow->name.'</h4>
                                </a>
                            </div>
                            </div>
                        </div>
                    </div>';
        }
    $restst.='</div>';
}

$jVars['module:testimonialList'] = $restst;
?>