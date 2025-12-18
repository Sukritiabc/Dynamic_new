<?php




$mainslides='';
$address='';

$Records = Slideshow::getSlideshow_by_mode(1);
$Recordvideo = Slideshow::getslide_by_mode(2);
// pr($slides);getSlideshow_by_mode
// pr($Recordvideo);
if(empty($Recordvideo)){
if ($Records) {
    
    $mainslides .= '  <header class="header slider-fade">
        <div class="owl-carousel owl-theme">';
    foreach ($Records as $RecRow) {
        
        $splitSRC = explode("http://", $RecRow->linksrc);
        $linkTarget = ($RecRow->linktype == 1) ? ' target="_blank" rel="noreferrer" ' : '';
        $linksrc = (count($splitSRC) == 1) ?   $RecRow->linksrc : $RecRow->linksrc;
        $linkstart = ($RecRow->linksrc != '') ? '<a  type="button" href="' . $linksrc . '" ' . $linkTarget . ' class="button-3 w-35"  > Explore Now' : '';
        $linkend = ($RecRow->linksrc != '') ? '</a>' : '</a>';
        $file_path = SITE_ROOT . 'images/slideshow/' . $RecRow->image;
        if (file_exists($file_path) and !empty($RecRow->image)) {
           $mainslides .= '
<div class="item bg-img" data-overlay-dark="5" data-background="' . IMAGE_PATH . 'slideshow/' . $RecRow->image . '">
    <div class="v-middle caption">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-12 text-center">
                    <h5>'.$RecRow->title.'</h5>
                    '.$RecRow->content.'
                    
                        <div class="col-md-12 mt-15">
                            ' . $linkstart .   $linkend .'
                        </div>

                </div>
            </div>
        </div>
    </div>
</div>
';

           
        }
    }
      $mainslides .= '
 </div>
    </header>';
}
}
else{
 $mainslides .= '
 <header class="header">
        <div class="video-fullscreen-wrap">
            <div class="video-fullscreen-video">
                <video playsinline="" autoplay="" loop="" muted="">
                    <source src="' . IMAGE_PATH . 'slideshow/video/' . $Recordvideo->source_vid . '" type="video/mp4" autoplay="" loop="" muted="">
                </video>
            </div>
            <div class="v-middle caption overlay">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-md-12 text-center">
                            <!--<h1>' . $Recordvideo->title . '</h1>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

';
}

$jVars['module:homeslider']= $mainslides;


/* First Slideshow */
$reslide=$rescontent = '';

$Records = Slideshow::getSlideshow_by('','',1);
// pr($Records);
// var_dump($Records); die();
if($Records) {
    $reslide.='';
        foreach($Records as $RecRow) {
        
           
            $file_path = SITE_ROOT.'images/slideshow/'.$RecRow->image;
            if(file_exists($file_path) and !empty($RecRow->image)) {
                $reslide .= '

                <div class="item"><img src="'.IMAGE_PATH.'slideshow/'.$RecRow->image.'" alt="'.$RecRow->title.'" width="100%"></div>
                
                ';

                $rescontent = '<h1>'.$siteRegulars->upcomingcontent.'</h1>';

            }
           
        }
    $reslide.=' ';
}

$jVars['module:slideshow-uc']= $reslide;
$jVars['module:slideshow-content']= $rescontent;




?>