<?php 
$resoffr=$socialshare='';
$expired='';
$link='';
$enquiry='';
$resrandoffr=$hmresoffr=$resinndetail=$offbredd=$resinnscript='';
$offrRec = Offers::get_offer_by();

if(defined('OFFERS_PAGE') and isset($_REQUEST['slug'])) {
    $slug = addslashes($_REQUEST['slug']);
    $recRow = Offers::find_by_slug($slug);
    if(!empty($recRow)) {
        
        if(!empty($recRow->image)) { 
              $imglink =IMAGE_PATH.'offers/'.$recRow->image;
        }
        else {
            $imglink = IMAGE_PATH.'static/inner-img.jpg';
        }
        $socialshare='<div class="share-social">
            <a class="facebook-share" target="blank" href="https://www.facebook.com/dialog/share?app_id=1469386494025980&display=popup&href=' . BASE_URL . 'offer/' . $recRow->slug . '&name=' . $recRow->title . '&caption=' . $recRow->title . $recRow->slug . '&description=' . $recRow->brief . '">
                <i class="fa fa-facebook" aria-hidden="true"></i><span>Share</span></a> 
            <a class="twitter-share" target="blank" href="https://twitter.com/intent/tweet?text='.$recRow->title.' ?url='.BASE_URL.'offer/'.$recRow->slug.'" >
                <i class="fa fa-twitter" aria-hidden="true"></i><span>Share</span></a>
            <a class="gplus-share" target="blank" href="https://plus.google.com/share?url='.BASE_URL.'offer/'.$recRow->slug.'">
                <i class="fa fa-google-plus" aria-hidden="true"></i><span>Share</span></a>
        </div>';
        $rescontent = explode('<hr id="system_readmore" style="border-style: dashed; border-color: orange;" />', trim($recRow->content));   
        $content = !empty($rescontent[1])?$rescontent[1] : $rescontent[0];
    $currentdate = date("Y-m-d") ;
    // pr($recRow);
    // pr($currentdate);
    if($recRow->offer_date > $currentdate){
        $enquiry='<a href="'.BASE_URL.'offer-list/'.$recRow->slug.'" class="btn btn-primary btn-book" style="color: #fff;background-color: #7b2b2e;border-color: #7b2b2e;">Enquiry</a>';
    }
    else{
        $enquiry='';
    }
          $resinndetail.=$socialshare.'
                        <div class="offer-detail3">
                            <h2>'.$recRow->title.'</h2>
                            '.$content.'
                            '.$enquiry.'
                        </div>';

                $offbredd.='
               <div class="banner-section aboutus-bg-img d-flex justify-content-center align-items-center position-relative text-white" style="background: url(' . IMAGE_PATH . 'offers/' . $recRow->image . ') no-repeat center/cover;">
        <h1 class="position-absolute z-1">Exlusive Offer</h1>
    </div>';
    }
    else {
        redirect_to(BASE_URL);
    }    
}
else{ 
    $imglink= $siteRegulars->offer_upload ;
if(!empty($imglink)){
    $img= IMAGE_PATH . 'preference/offer/' . $siteRegulars->offer_upload ;
}
else{
  $img=IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
}
    
      $offbredd.='    
      <div class="banner-header section-padding valign bg-darkbrown1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center caption mt-90">
                    <h1>Our Offers</h1>
                </div>
            </div>
        </div>
    </div> 
    ';
         $offList= Offers::find_all();
         $resinndetail.=' <section class="news section-padding">
        <div class="container">
            <div class="row">
                        ';
         foreach ($offList as $offer) {
   
             $currentdate = date("Y-m-d") ;
             if($offer->start_date <= $currentdate){
            //  pr($offer->offer_date);
            //  pr($currentdate);
             if($offer->offer_date < $currentdate ){
             $expired .=' <div class="expire_date position-absolute top-0 end-0 text-white bg-danger text-uppercase">
              <p class="mb-0  px-2 py-2">Expired</p>
            </div>';
            $link='';
             }
             else{
                 $expired .='';
                 $link='href="'.BASE_URL.'offer-list/'.$offer->slug.'"';
             }
            //  pr($expired);
            $resinndetail.='
            <div class="col-md-4">
                    <div class="item">
                        <div class="position-re o-hidden"> 
                            <img src="'.IMAGE_PATH.'offers/listimage/'.$offer->list_image.'" alt="">
                        </div>
                        <div class="con position-re" style="padding:10px;">
                            <span class="category">
                                Valid till ' . date("d M Y", strtotime($offer->offer_date)) . '
                            </span>
                            <h5 style="margin-left: 0px;" data-bs-toggle="modal" data-bs-target="#'.$offer->slug.'">'.$offer->title.'</h5>
                            <div class="share3 offer-con">
                                <ul>
                                    <li><a href="https://www.linkedin.com/company/resorts-by-manakamana-cable-car-pvt-ltd/?viewAsMember=true" target="_blank"><i class="fa-brands fa-linkedin"></i></a></li>
                                    <li><a href="https://www.facebook.com/people/Resorts-By-Manakamana-Cable-Car-P-Ltd/61550283189443/" target="_blank"><i class="ti-facebook"></i></a></li>
                                    <li><a href="#" target="_blank"><i class="ti-pinterest"></i></a></li>
                                    <li><a href="#" target="_blank"><i class="ti-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
        
    ';
    $resinndetail.='
    
     <div class="modal fade" id="'.$offer->slug.'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="background: #e4e7e9;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">'.$offer->title.'</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class=" ">
                                <img src="'.IMAGE_PATH.'offers/listimage/'.$offer->list_image.'" class="img-fluid w-100" alt="offers">
                            </div>
                            
                        </div>
                        <div class="col-lg-6">
                            <form method="post" class="contact__form contactform_'.$offer->id.'" action="#">
                                <!-- form message -->
                              <input name="offertitle" value="'.$offer->title.'" type="hidden"/>
                                <!-- form elements -->
                                <div class="row">
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
                                    <!--<div class="col-md-12 form-group">-->
                                        <!-- reCAPTCHA widget -->
                                    <!--    <div class="g-recaptcha" data-sitekey="6LeVBaIrAAAAALMY6DrLboZqrjelsfi-ho56pDBk" style="margin-bottom:20px;"></div>-->
                                    <!--</div>-->
                                    <div id="result_msg'.$offer->id.'"></div>
                                    <div class="col-md-12">
                                        <button type="submit" class="butn-dark2 submit_'.$offer->id.'" style="margin-top:15px;"><span>Send Message</span></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

';
                    $resinnscript .='   
                     <script type="text/javascript">
$(document).ready(function () {
    $(\'.contactform_'.$offer->id.'\').validate({
        errorElement: \'span\',
        errorClass: \'validate-has-error\',
        rules: {
            name: { required: true },
            phone: { required: true },
            address: { required: true },
            email: { required: true, email: true },
            message: { required: true }
        },
        messages: {
            name: { required: "Please enter your First Name." },
            country: { required: "Please enter your Country." },
            address: { required: "Please enter your Address." },
            email: { required: "Please enter your Email Address." },
            message: { required: "Please enter your Message." }
        },
        submitHandler: function (form) {
            // var recaptcha = $("#g-recaptcha-response").val();
            // if (recaptcha === "") {
            //     event.preventDefault();
            //     alert("Please check the recaptcha");
            //     return false;
            // }

            const formData = new FormData(form);
            formData.append("action", "foroffer");

            $("button.submit_'.$offer->id.'").attr("disabled", true).text(\'Processing...\');

            $.ajax({
                type: "POST",
                url: "enquery_mail.php",
                data: formData,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (data) {
                    $("button.submit_'.$offer->id.'").removeAttr("disabled").text(\'Submit\');
                    $(\'div#result_msg'.$offer->id.'\').html(data.message).css(\'display\', \'block\').fadeOut(8000);
                    form.reset();
                }
            });

            return false;
        }
    });
});
</script>
';
         $expired='';
         $link='';
         }
         }
         $resinndetail.='  </div>
  </div>
</section>';
}


    // Rand offer
    $randRec = Offers::get_offer_rand();
    if(!empty($randRec)) {
        $file_path = SITE_ROOT.'images/offers/'.$randRec->image;
        if(file_exists($file_path) and !empty($randRec->image)) {
            $linkTarget = ($randRec->linktype == 1)? ' target="_blank" ' : ''; 
            $linksrc    = ($randRec->linktype != 1)? BASE_URL.$randRec->linksrc : $randRec->linksrc;
            $linkstart  = ($randRec->linksrc!='')? '<a href="'.$linksrc.'" '.$linkTarget.'>' : '<a href="javascript:void(0);">';
            $linkend    = ($randRec->linksrc!='')? '</a>' : '</a>' ;


            $resrandoffr.='<div class="section panel">
                <div class="item fade">
                    <div class="back" data-image="'.IMAGE_PATH.'offers/'.$randRec->image.'"></div>
                    <div class="panel-button">
                        <div class="button-container">
                            '.$linkstart.$randRec->title.$linkend.'
                            <span>Our Offer <i class="icon ion-ios-arrow-right"></i>
                        </div>
                    </div>
                </div>

            </div>';
        }
    }

if(defined('HOME_PAGE')) {
    
     if($offrRec) {
        $hmresoffr.='<div class="row" >';
                foreach($offrRec as $offrRow) {
                    $file_path = SITE_ROOT.'images/offers/'.$offrRow->image;
                    
                    if(file_exists($file_path) and !empty($offrRow->image)) {
                        $linkTarget = ($offrRow->linktype == 1)? ' target="_blank" ' : ''; 
                        $linksrc    = ($offrRow->linktype != 1)? BASE_URL.$offrRow->linksrc : $offrRow->linksrc;
                        $linkstart  = ($offrRow->linksrc!='')? '<a class="button" href="'.$linksrc.'" '.$linkTarget.'>' : '<a class="button" href="javascript:void(0);">';
                        $linkend    = ($offrRow->linksrc!='')? '</a>' : '</a>' ;

                        $hmresoffr.='
                        <div class="col-sm-3">
                            <div class="figure"><a href="'.BASE_URL.'offer/'.$offrRow->slug.'"><img src="'.IMAGE_PATH.'offers/'.$offrRow->image.'" alt="'.$offrRow->image.'"></a></div>
                            <div class="details">
                                <h3><a href="'.BASE_URL.'offer/'.$offrRow->slug.'">'.strip_tags($offrRow->title).'</h3>
                                <p>'.strip_tags($offrRow->brief).'</p>
                                
                            </div>
                            <div class="screen">
                                <div class="back" data-image="'.IMAGE_PATH.'offers/'.$offrRow->image.'"></div>
                            </div>
                        </div>';

                    }
                }

            $hmresoffr.='</div>';
    }  
    }


$jVars['module:homeoffers-list'] = $hmresoffr;
$jVars['module:offers-details'] = $resinndetail;
$jVars['module:offers-script'] = $resinnscript;
$jVars['module:offer_breadcrum'] = $offbredd;


//hompage popup code
$homepopup='';


if(defined('HOME_PAGE')){
    //  header("Location: '.BASE_URL.'/offer-list");
    $homepopupdatas= offers::get_offer_by_popup();
    // pr($homepopupdatas);
if (!empty($homepopupdatas)) {
    //modal img
    $count = 1;
    $active = '';
    $homepopup = ' 
     <div class="col-sm-10 center-block center-text">
        <div class="modal fade" id="modal-popup-image">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
					<!--CAROUSEL CODE GOES HERE-->
                        <div id="myCarousel" class="carousel slide">
                            <div class="carousel-inner">		
                            ';
    foreach ($homepopupdatas as $popr) {
        if (!empty($popr->list_image)) {
            $q = $popr->list_image;
            $file_path = SITE_ROOT . 'images/offers/listimage/' . $q;
            if (file_exists($file_path)) {
                $imglink = IMAGE_PATH . 'offers/listimage/' . $q;
            } else {
                $imglink = BASE_URL . 'template/cms/images/welcome.jpg';
            }
            $active = ($count == 1) ? 'active' : '';
            $linkhref = ($popr->linktype == 1) ? $popr->linksrc : BASE_URL . $popr->linksrc;
            $target = ($popr->linktype == 1) ? 'target="_blank"' : '';
            $homepopup .= '  
                <div class="carousel-item ' . $active . '">
                    <a href="' . $linkhref . '" ' . $target . '><img src="' . $imglink . '" alt="' . $popr->title . '"></a>
                </div>
                ';
                // pr($imglink);

            $count++;
        }
    }
    $homepopup .= ' <!--end carousel-inner-->
                        </div>
    ';
    if(sizeof($homepopupdatas) > 1) {
        $homepopup .= '
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        ';
    }
    $homepopup .='
                        
                        </div>
                        <!--end carousel-->
                    </div>
                    <!--end modal-body-->
                </div>
                <!--end modal-content-->
            </div>
            <!--end modal-dialoge-->
        </div>
        <!--end myModal-->
    </div>
    <!--end col-->					
';
}
}

$jVars['module:offer_homepopup'] = $homepopup;


//mutli,dynamic,fixed,none mode for offer detail page 
$resbpkg='';
$resbpkgclass='';

if(defined('OFFERS_PAGE') and isset($_REQUEST['slug'])) {
	$slug = !empty($_REQUEST['slug'])?addslashes($_REQUEST['slug']):'';
	$sRec = Offers::find_by_slug($slug);

	if(!empty($sRec)) {
if(!empty($sRec->image)){
    $img= IMAGE_PATH . 'offers/' . $sRec->image  ;
}
else{
  $img=IMAGE_PATH . 'preference/other/' . $siteRegulars->other_upload;
}
 
		$resbpkg.='

           <div class="banner-section aboutus-bg-img d-flex justify-content-center align-items-center position-relative text-white" style="background: url(' . $img . ') no-repeat center/cover;">
        <h1 class="position-absolute z-1">' . $sRec->title . '</h1>
    </div>
        
	 	
	 <section class="container py-md-5">
<!-- generate -->
<div class="gallery-inner">

  <!-- Offer Title -->

  <div class="offer-detail3 mb-4 d-flex justify-content-between align-items-center flex-wrap">
      <h2 class="display-5 fw-bold mb-4 mb-xl-0">' . $sRec->title . '</h2>
        <!-- Social Sharing -->
  <div class="share-social d-flex gap-3 mb-5">
    <a class="facebook-share btn btn-outline-primary rounded-pill px-4 py-2 d-flex align-items-center gap-2" target="_blank"
        href="https://www.facebook.com/dialog/share?app_id=1469386494025980&display=popup&href=' . BASE_URL . 'offer-list/' . $sRec->slug . '&name=' . $sRec->title . '&caption=' . $sRec->title . $sRec->slug . '&description=' . $sRec->brief . '">
        <i class="fa-brands fa-facebook-f"></i> Share on Facebook
    </a>
    <a class="twitter-share btn btn-outline-dark rounded-pill px-4 py-2 d-flex align-items-center gap-2" target="_blank"
        href="https://twitter.com/share?url=' . BASE_URL . 'offer-list/' . $sRec->slug . '&text=' . $sRec->title . '">
        <i class="fa-brands fa-x-twitter"></i> Share on Twitter
    </a>
</div>
  </div>

  <!-- Success Message -->
  <div class="alert alert-success d-none" id="msg"></div>
					<form action="" method="post" id="frm-booking">
					    <div class="row g-5">
							    <input type="hidden" name="offer_type" value="'.$sRec->type.'">';
                                if ($sRec->type == 1) {
                                $resbpkg .= '
                                 <div class="col-lg-7">
                  <input type="hidden" name="offer_type" value="1">
                  <div class="card shadow-sm border-0 rounded-4 p-4">
                      <table class="table table-bordered text-center align-middle mb-0">
                          <thead class="table-light">
                              <tr>
                                  <th>Package</th>
                                  <th>Price (NPR)</th>
                                  <th>No. of People</th>
                                  <th>Total</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr class="parent">
                                  <td>
                                      <a href="' . BASE_URL . 'offer/' . $sRec->slug . '"
                                         target="_blank" class="fw-medium text-decoration-none text-reset">
                                          ' . $sRec->title . '
                                      </a>
                                      <input type="hidden" name="package_title[]" value="' . $sRec->title . '">
                                  </td>
                                  <td>
                                      ' . $sRec->rate . '
                                      <input type="hidden" name="package_price[]" value="' . $sRec->rate . '">
                                      <input type="hidden" name="package_discount[]" value="' . $sRec->discount . '">
                                  </td>
                                  <td>
                                      <select name="no_pax[]" class="form-select form-control-lg">
                                          <option value="">Select</option>
                                            ';
                                            for ($i = 1; $i <= $sRec->adults; $i++) {
                                                $resbpkg .= '<option value="' . $i . '">' . $i . '</option>';
                                            }
                                            $resbpkg .= '
                                      </select>
                                  </td>
                                  <td class="totalamt fw-semibold">0</td>
                              </tr>';
            if (!empty($sRec->discount) and $sRec->discount > 0) {
                $resbpkg .= '
                <tr>
                                  <td colspan="3" class="text-end text-muted">
                                      Discount (' . $sRec->discount . '%)<br>
                                      <small>* Discount not applicable for only 1 person</small>
                                  </td>
                                  <td class="discountamt text-success">0</td>
                              </tr>
                    ';
            }
                        $resbpkg .= '      
                              <tr class="table-info">
                                  <td colspan="3" class="fw-bold text-end">Grand Total</td>
                                  <td class="grand-total fw-bold text-dark">0</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>

								';
                                $resbpkgclass='col-lg-5';
        }

        if ($sRec->type == 0) {
            $resbpkg .= '
                <div class="col-lg-5 dynamic-form-wrapper">
            <input type="hidden" name="offer_type" value="0">
            <div class="table-responsive">

							 <table class="table align-middle text-center">
                <thead>
                  <tr>
                    <th>Choose</th>
                    <th>Price (NPR)</th>
                    <th>Number Of People</th>
                  </tr>
                </thead>
									';
            $sql = "SELECT * FROM tbl_offer_child WHERE offer_id=$sRec->id";
            $query = $db->query($sql);
            $num = $db->num_rows($query);
            
            if ($num > 0) {
                while ($row = $db->fetch_array($query)) {
                    if(!empty($row['offer_usd'] )){
                    $resbpkg .= '
                    <tbody>
                  <tr class="parent">
                    <td>
                      <div class="form-check d-flex justify-content-center">
                        <input class="form-check-input" type="radio" name="radio_type" value="' . $row['offer_pax'] . ';;' . $row['offer_usd'] . '" id="radio_type">
                      </div>
                    </td>
                    <td>
                      5656
                      <input type="hidden" name="package_title[]" value="' . $sRec->title . '">
                      <input type="hidden" name="package_price[]" value="' . $row['offer_usd'] . '">
                    </td>
                    <td>
                      <input type="text" name="no_pax[]" class="form-control form-control-sm" value="' . $row['offer_pax'] . '" disabled>
                    </td>
                  </tr>
                </tbody>
                    ';
                    $resbpkgclass='col-lg-6 offset-lg-1';
                }
                }
            }
            $resbpkg .= '
								</table>
                                </div>
           </div>

								';
        }
		if ($sRec->type == 2) {
            $resbpkg .= '
							 <div class="col-lg-5 multi-form-wrapper">
            <div class="table-responsive">
              <table class="table align-middle text-center">
                <thead>
                  <tr>
                    <th>Choose</th>
                    <th>Items</th>
                    <th>Price of Item</th>
                    <th>No of Pax</th>
                    <th>Total</th>
                  </tr>
                </thead>  <tbody>
									';
            $sql = "SELECT * FROM tbl_offer_child WHERE offer_id=$sRec->id";
            $query = $db->query($sql);
            $num = $db->num_rows($query);
            
            if ($num >= 0) {
                while ($row = $db->fetch_array($query)) {
                    if(!empty($row['multi_offer_npr'] )){
                    $resbpkg .= '
                      <tr class="parent">
                    <td>
                      <div class="form-check d-flex justify-content-center">
                        <input class="form-check-input" type="checkbox" name="multi_item[]" value="' . $row['multi_offer_title'] . '|' . $row['multi_offer_npr'] . '">
                      </div>
                    </td>
                    <td>' . $row['multi_offer_title'] . '</td>
                    <td>
                      ' . $row['multi_offer_npr'] . '
                      <input type="hidden" name="package_title[]" value="' . $sRec->title . '">
                      <input type="hidden" name="package_price[]" value="' . $row['multi_offer_npr'] . '">
                      <input type="hidden" name="package__item[]" value="' . $row['multi_offer_title'] . '">
                    </td>
                    <td>
                      <input type="number" name="no_pax[]" class="form-control form-control-sm" min="1" value="" disabled>
                    </td>
                    <td>
                      <div class="row_total"></div>
                      <input type="hidden" name="row_hidden[]" class="row_hidden" value="">
                    </td>
                  </tr>
											';
										}
										}
									}
									$resbpkg .= '

                                       <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Grand Total</td>
                    <td class="gtotal"></td>
                    <input type="hidden" class="gtotal" name="multitotal" value="">
                  </tr>
                </tbody>
              </table>
            </div>
           </div>
								';
                                $resbpkgclass='col-lg-6 offset-lg-1';
        }
		if ($sRec->type == 3) {
            $resbpkg .= '
              <div class="col-lg-5 multi-form-wrapper">
            <img src="'.IMAGE_PATH.'offers/listimage/'.$sRec->list_image.'" alt="" class="img-fluid w-100">
           </div>';
           $resbpkgclass='col-lg-6 offset-lg-1';
        }

        $resbpkg .= '
        <div class="'.$resbpkgclass.'">
              <div class="card shadow-sm border-0 rounded-4 p-4">
                  <div class="row g-3">
                      <div class="col-sm-6">
                          <input name="person_first" type="text" class="form-control form-control-lg"
                                 placeholder="First Name" />
                      </div>
                      <div class="col-sm-6">
                          <input name="person_last" type="text" class="form-control form-control-lg"
                                 placeholder="Last Name" />
                      </div>
                      <div class="col-sm-6">
                        <input name="person_checkin" type="text" class="form-control form-control-lg"
                               placeholder="Check In Date" id="my-datepicker" autocomplete="off"/>
                    </div>
                      <div class="col-sm-6">
                          <input name="person_contact" type="text" class="form-control form-control-lg" id="person_contact"
                                 placeholder="Contact No." />
                      </div>
                      <div class="col-sm-6">
                          <input name="person_email" type="email" class="form-control form-control-lg"
                                 placeholder="Email Address" />
                      </div>
                      <div class="col-sm-6">
                          <input name="person_address" type="text" class="form-control form-control-lg"
                                 placeholder="Address" />
                      </div>
                      <div class="col-sm-6">
                          <select name="person_country" class="form-select form-control-lg" id="countrySelect">
                              <option value="">Choose Country</option>
                           ';
        $contRec = Countries::find_all();
        // pr($contRec);
        foreach ($contRec as $contRow) {
            $resbpkg .= '<option value="' . $contRow->country_name . '" contact-value="' . $contRow->country_no_code . '">' . $contRow->country_name . '</option>';
        }
        $resbpkg .= '
                          </select>
                      </div>
                      <div class="col-sm-6">
                          <input name="person_city" type="text" class="form-control form-control-lg"
                                 placeholder="City" />
                      </div>
                      <div class="col-sm-6">
                          <input name="person_zpicode" type="text" class="form-control form-control-lg"
                                 placeholder="Zip Code" />
                      </div>
                      <div class="col-sm-12">
                          <textarea name="person_message" rows="3" class="form-control form-control-lg"
                                    placeholder="Message"></textarea>
                      </div>
                      <div class="col-sm-12">
                          <div class="g-recaptcha" data-sitekey="6LfJi3IpAAAAADFACrwrLTyGei-eQMJsR6eS4yh_"></div>
                      </div>
                      <div class="col-sm-12">
                        <button type="submit" class="btn booking--btn form--btn-styling">Submit</button>
                      </div>
                  </div>
              </div>
          </div>


</div>
  </form>
</div>




<!-- generate end -->

  </section>
';
	}
}

$jVars['module:bookpkg_detail'] = $resbpkg;


