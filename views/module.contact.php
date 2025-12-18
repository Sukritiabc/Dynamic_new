<?php
/*
* Contact form
*/
$rescont = $innerbred = '';
$img='';
if (defined('CONTACT_PAGE')) {


    $siteRegulars = Config::find_by_id(1);
$maintell='';

    $tellinked = '';
    $telno = explode(",", $siteRegulars->contact_info);
    $lastElement = array_shift($telno);
    $phonelink='<a href="tel:' . $lastElement . '" target="_blank" rel="noreferrer" class="whatsapp">
                                             Talk with us
                                            </a>';
    $tellinked .= '<a href="tel:' . $lastElement . '" target="_blank" rel="noreferrer" class="text-decoration-none text-black">' . $lastElement . '</a>';
    foreach ($telno as $key => $tel) {
     
        
        $tellinked .= ',<a href="tel:+977-' . $tel . '" target="_blank" rel="noreferrer" class="text-decoration-none text-black">' . $tel . '</a>';
        if(end($telno)!= $tel){
        $tellinked .= ',';
        }   
         if($key%2==0){
          $maintell .='<div class="d-flex align-items-center justify-content-start mb-2 text-white">
                                        <i class="flaticon-telephone me-2"></i>
                                        <div>
                                        '.$tellinked.'
                                        </div>
                                    </div>
                                        ';
      }
}
$imglink= $siteRegulars->contact_upload ;
if(!empty($imglink)){
    $img= IMAGE_PATH . 'preference/contact/' . $siteRegulars->contact_upload ;
}
else{
  $img=IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
}
        // pr($siteRegulars);
$nearbydetail='';
         $recRows = Nearby::find_all_active();
    // pr($recRow);
    if (!empty($recRows)) {

        foreach($recRows as $recRow){

         

            $nearbydetail .= '
            <div class="accordion-item">
          <h2 class="accordion-header" id="heading' . $recRow->title . '">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse' . $recRow->title . '" aria-expanded="false" aria-controls="collapse' . $recRow->title . '">
              ' . $recRow->title . ' <span class="badge   rounded-pill ms-2">' . $recRow->distance . '</span>
            </button>
          </h2>
          <div id="collapse' . $recRow->title . '" class="accordion-collapse collapse" aria-labelledby="heading' . $recRow->title . '" data-bs-parent="#nearbyAccordion">
            <div class="accordion-body">
              ' . strip_tags($recRow->content) . '
              <div class="mt-3"></div>
                        <a href="' . $recRow->google_embeded . '" target="_blank" rel="noreferrer" class="btn btn-outline-primary btn-sm">
                            Get Direction
                        </a>
            </div>
          </div>
        </div>
            ';

        } 
    }
    $rescont .= '
    <div class="banner-header section-padding valign bg-img " data-overlay-dark="4" data-background="'.$img.'">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>Contact Us</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact -->

   <section class="contact section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12">
                    <div class="row mb-30">
                        <div class="col-lg-6 col-md-12 mb-25">
                            <div class="item">
                                <div class="front">
                                    <div class="contents"> <span class="fa-thin fa-location-dot"></span>
                                        <h2 class="title">Address</h2>
                                      <p>'. $siteRegulars->fiscal_address .'</p>
                                    </div>
                                </div>
                                <div class="back"> <img class="img img-fluid" src="template\web\img\contact2.jpg">
                                    <div class="contents">
                                        <div class="btnx">
                                            <a href="'.$siteRegulars->google_map.'" target="_blank" rel="noreferrer" class="whatsapp">
                                            Location map</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 mb-25">
                            <div class="item">
                                <div class="front">
                                    <div class="contents"> <span class="fa-thin fa-phone"></span>
                                        <h2 class="title">Let\'s talk with us</h2>
                                        <p class="text">Phone: '.$tellinked.' </p>
                                    </div>
                                </div>
                                <div class="back"> <img class="img img-fluid" src="template\web/img/contact3.jpg">
                                    <div class="contents">
                                       <div class="btnx">
                                         '.$phonelink.'
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="map">
                                <iframe src="'.$siteRegulars->location_map.'" width="100%" height="450" style="border:0; border-radius: 5px" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1 col-md-12">
                    <div class="form2-sidebar mt--240">
                        <form id="contactform" class="form2">
                            <div class="head">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h5>Get in touch!</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="cont">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 form-group">
                                        <input type="text" placeholder="Name *" name="fullname">
                                    </div>
                                    <div class="col-lg-12 col-md-12 form-group">
                                        <input type="email" placeholder="Email *" name="email">
                                    </div>
                                    <div class="col-lg-12 col-md-12 form-group">
                                        <input type="text" placeholder="Phone *" name="phone">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <input type="text" placeholder="Address *" name="address">
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <textarea name="message" id="message" cols="30" rows="4" placeholder="Message"></textarea>
                                    </div>
                                     <div class="col-sm-12" style="margin: 10px 0px;">
                                        <div id="g-recaptcha-response" class="g-recaptcha" data-sitekey="6Lf1CysqAAAAAIgmN0_09HdspdNsgi6359cuvp4j"></div>
                                    </div>
                                    <div id="result_msg"></div>
                                    <div class="col-md-12">
                                        <button class="button-3" id="submit"><i class="fa-light fa-paper-plane"></i> Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    ';
}

$jVars['module:contact-us'] = $rescont;


//uc contact details
$home_contact='';
$configRec= Config::find_by_id(1);
$home_contact .= ' 
                    <div class="six columns mob-whole contact">
                    <h3>Contact Numbers:</h3>
                    <p> Cell No: <a href="'. $configRec->whatsapp .'">'. $configRec->whatsapp .'</a><br>
                    <p> Cell No: <a href="'. $configRec->address .'"> '. $configRec->address .'</a><br>
                    </p>

                    <h3>Email:</h3>
                    <p><a href="mailto:' . $configRec->email_address . '"> ' . $configRec->email_address . '</a><br>
                    </p>

                    <h3>Address:</h3>
                    <p><a href="'.$configRec->contact_info2.'" target="_blank" rel="noreferrer"> ' . $configRec->fiscal_address . ' </a>
                    </p>
                </div>
                </div>
                ';

$jVars['module:contact:home'] = $home_contact;
