<?php
$siteRegulars = Config::find_by_id(1);
$lastElement='';
$phonelinked='';
$whatsapp='';
 $virstualtour='';
$tellinked = '';
    $telno = explode(",", $siteRegulars->contact_info);
    // $lastElement = array_shift($telno);
    // $tellinked .= '<a href="tel:' . $lastElement . '" target="_blank" rel="noreferrer">' . $lastElement . '</a>';
    foreach ($telno as $tel) {
        $arb = ($telno[0] == $tel) ? '' : '+977 ';
        $tellinked .= '<a href="tel:' . $arb . $tel . '" target="_blank" rel="noreferrer">' . $tel . '</a>';
        if(end($telno)!= $tel){
            $tellinked .= ', ';
        }   
    }
    
    
$mob_txt = '';
$mobs = explode(",", $siteRegulars->contact_info2);
foreach ($mobs as $moob) {
    $arb = ($mobs[0] == $moob) ? '+977 ' : '+977 ';
    $mob_txt .= '<a href="tel:' . $arb . $moob . '" target="_blank" rel="noreferrer">' . $moob . '</a>';
    if(end($mobs)!= $moob){
        $mob_txt .= ', ';
    }   
}
    
    

$emailinked = '';
    $emails = explode(",", $siteRegulars->email_address);
    $lastEmail = array_shift($emails);
    $emailinked .= '<a href="mailto:' . $lastEmail . '" target="_blank" rel="noreferrer">' . $lastEmail . '</a>';
    foreach ($emails as $email) {
        
        $emailinked .= ',<a href="mailto:' . $email . '" target="_blank" rel="noreferrer">' . $email . '</a>';
        if(end($emails)!= $email){
        $emailinked .= ',';
        }   
}
$phoneno = explode("/", $siteRegulars->whatsapp);
$lastElement = array_shift($phoneno);
$phonelinked .= '<a href="tel:+977-' . $lastElement . '" target="_blank" rel="noreferrer">' . $lastElement. '</a>/';
foreach ($phoneno as $phone) {
    
    $phonelinked .= '<a href="tel:+977-' . $phone . '" target="_blank" rel="noreferrer">' . $phone . '</a>';
    if(end($phoneno)!= $phone){
    $phonelinked .= '/';
    }   
}
$roomslist='';
$rooms= Subpackage::find_by_sql("SELECT * FROM tbl_package_sub WHERE status='1' AND type='2' ORDER BY sortorder DESC");
if(!empty($rooms)){
foreach($rooms as $room){
    $roomslist.='<li><a href="'.BASE_URL.$room->slug.'" class="text-decoration-none">'.$room->title.'</a></li>';
}
}
if(!empty($siteRegulars->whatsapp_a)){
$whatsapp='
<div class="whats_app">
        <a href="https://wa.me/'.$siteRegulars->whatsapp_a.'" target="_blank" rel="noreferrer" class="whatsapp">
            <img src="'.BASE_URL.'template/web/img/icon/whatsapp.png" class="whatsapp_img" alt="whatsapp">
        </a>
    </div>
  ';
}   
else{
    $whatsapp='';
}
$rooms='';
$roomdatas= subpackage::get_relatedsub_by(2);
// pr($roomdatas);
if(!empty($roomdatas)){
  foreach($roomdatas as $roomdata){
  $rooms .=' <a href="'.BASE_URL.$roomdata->slug.'">'.$roomdata->title.'</a>';
                                  }
}
$vtours= VirtualTour::find_all_active();
$countvt= count($vtours);
// pr($countvt);
// pr($countvt);
// if($countvt!=0){
//     $virstualtour=' <div class="three_app">
//         <a href="'.BASE_URL.'virtual-tour" target="_blank" rel="noreferrer" class="three">
//             <img src="'.BASE_URL.'template/web/img/virtual.jpg"></a>
//     </div>';
// }
$footer = '
<div class="progress-wrap cursor-pointer">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
            <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
        </svg>
    </div>
<footer class="footer">
        <div class="top">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-30">
                        <div class="item">
                            <h3>About Rixos</h3>
                           '.$siteRegulars->breif.'
                            <div class="social-icons">
                                <ul class="list-inline">
                                '.$jVars['module:socilaLinkbtm'].'
                
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 offset-md-1 mb-30">
                        <div class="item">
                            <h3>Contact us</h3>
                            '. $siteRegulars->fiscal_address .'
                            <div class="phone"><a>'.$tellinked.'</a></div>
                            
                            <div class="mail"><a>'.$emailinked.'</a></div>
                            <p><a href="#" target="_blank">View Google Map</a></p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-30">
                        <div class="item">
                            <h3>Booking Platforms</h3>
                            <div class="social-icons1">
                                <ul class="card1 card1a">
                               '. $jVars['module:otatop'] .'
                                </ul>
                            </div>
                            <div class="newsletter">
                                <h6 style="color: #fff;font-size: 19px;">We accepts</h4>
                            </div>
                            <div class="social-icons1">
                                <ul class="card1">
                                    <li><img src="'.BASE_URL.'template/web/img/icon/visa.png" alt="visa"></li>
                                    <li><img src="'.BASE_URL.'template/web/img/icon/paypal.png" alt="paypal"></li>
                                    <li><img src="'.BASE_URL.'template/web/img/icon/mastercard.png" alt="mastercard"></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        
        <!-- bottom -->
        <div class="bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 text-center">
                     <p>'. $jVars['site:copyright'] . '</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
    '.$whatsapp.'

   '.$virstualtour.'


           ';
           

$jVars['module:footer'] = $footer;


$footer2 = '
 <footer class="group">
      <ul class="footer-social">
         <li><span><a href="mailto:' . $configRec->email_address . '"> ' . $configRec->email_address . '</a></span></li>
         '.$jVars['module:socilaLinkbtm'].'
      </ul>
      <ul class="footer-copyright">
         <li>'. $jVars['site:copyright'] . '</li>
      </ul>
   </footer>
   <!-- Scroll to Top Button -->


';
$jVars['module:footer-booking-2'] = $footer2;



$jVars['module:footer-whatsapp'] = '';
