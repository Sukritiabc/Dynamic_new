<?php
require_once("includes/initialize.php");
$usermail = User::get_UseremailAddress_byId(1);
$ccusermail = User::field_by_id(1, 'optional_email');
$sitename = Config::getField('sitename', true);

foreach ($_POST as $key => $val) {
  $$key = $val;
}
if($_POST['action']=="forContact"):


// 1️⃣ Only run when form is submitted
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

        $secretKey = '6LfrcTIsAAAAAGeCSqOMgYW9YBIiZON2qB6ROefM';
        $verifyUrl = 'https://www.google.com/recaptcha/api/siteverify';

        // 2️⃣ Get captcha token from form
        $captcha = $_POST['g-recaptcha-response'] ?? '';

        if (empty($captcha)) {
            echo json_encode([
                'success' => false,
                'message' => 'Captcha is required'
            ]);
            exit;
        }

        // 3️⃣ Prepare data for Google
        $data = [
            'secret'   => $secretKey,
            'response' => $captcha,
            'remoteip' => $_SERVER['REMOTE_ADDR']
        ];

        // 4️⃣ VERIFY CAPTCHA (this is the code you asked about)
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $verifyUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        $response = curl_exec($ch);
        curl_close($ch);

        // 5️⃣ Decode Google response
        $result = json_decode($response, true);

        // 6️⃣ Check result
        if (!isset($result['success']) || $result['success'] !== true) {
            echo json_encode([
                'success' => false,
                'message' => 'Captcha verification failed'
            ]);
            exit;
        }
    }


	foreach($_POST as $key=>$val){$$key=$val;}
	$body = '
	<table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
	  <tr>
		<td><p>Dear Sir,</p>
		</td>
	  </tr>
	  <tr>
		<td><p><span style="color:#0065B3; font-size:14px; font-weight:bold">Comment message</span><br />
		  The details provided are:</p>
		  <p><strong>Fullname</strong> : '.$fullname.'<br />		
		  <strong>E-mail Address</strong>: '.$email.'<br />
		  <strong>Contact</strong>: '.$phone.'<br />
		  <strong>Address</strong>: '.$address.'<br />
		  <strong>Message</strong>: '.$message.'<br />
		  </p>
		</td>
	  </tr>
	  <tr>
		<td><p>&nbsp;</p>
		<p>Thank you,<br />
		'.$fullname.'
		</p></td>
	  </tr>
	</table>
	';
	
	/*
	* mail info
	*/

	$mail = new PHPMailer(); // defaults to using php "mail()"
	
	$mail->SetFrom($email, $fullname);
	$mail->AddReplyTo($email,$fullname);
	
	$mail->AddAddress($usermail, $sitename);
	// if add extra email address on back end
	if(!empty($ccusermail)){
		$rec = explode(';', $ccusermail);
		if($rec){
			foreach($rec as $row){
				$mail->AddCC($row,$sitename);
			}		
		}
	}
	
	$mail->Subject    = 'Enquiry mail from '.$fullname;
	
	$mail->MsgHTML($body);
	
	if(!$mail->Send()) {
		echo json_encode(array("action"=>"unsuccess","message"=>"We could not sent your message at the time. Please try again later."));
	}else{
		echo json_encode(array("action"=>"success","message"=>"Your message has been successfully sent."));
	}
endif;


if ($_POST['action'] == "forHall"):
  $body = '
      <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
          <tr>
              <td><p>Dear Sir,</p></td>
          </tr>
          <tr>
              <td>
                  <p>
                      <span style="color:#0065B3; font-size:14px; font-weight:bold">Hall Inquiry message</span><br />
                      The details provided are:
                  </p>
                  <p>
                      <strong>Event Name</strong> : ' . $event_name . '<br />	
                      <strong>Hall Name</strong> : ' . $hall_name . '<br />		
                      <strong>Event Date</strong> : ' . $event_date . '<br />		
                      <strong>Pax</strong> : ' . $pax . '<br />		
                      <strong>Schedule</strong> : ' . $schedule . '<br />		

                      <strong>Name</strong> : ' . $fullname . '<br />		
                      <strong>E-mail Address</strong>: ' . $email . '<br />
                      <strong>Phone</strong>: ' . $phone . '<br />
                      <strong>Address</strong>: ' . $Address . '<br />
                       <strong>Message</strong>: '.$message.'<br />
                  </p>
              </td>
          </tr>
          <tr>
              <td>
                  <p>Thank you,<br />
                  ' . $fullname . '
                  </p>
              </td>
          </tr>
      </table>
';

  $mail = new PHPMailer();
  $mail->SetFrom($email, $fullname);
  $mail->AddReplyTo($email, $fullname);
  $mail->AddAddress($usermail, $sitename);
  if (!empty($ccusermail)) {
      $rec = explode(';', $ccusermail);
      if ($rec) {
          foreach ($rec as $row) {
              $mail->AddCC($row, $sitename);
          }
      }
  }

  $mail->Subject = 'Hall Inquiry mail from ' . $fullname;
  $mail->MsgHTML($body);

  if (!$mail->Send()) {
      echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your Inquiry at the time. Please try again later."));
  } else {
      echo json_encode(array("action" => "success", "message" => "Your Inquiry has been successfully sent."));
  }
endif;


if ($_POST['action'] == "foroffer"):
  $body = '
      <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
          <tr>
              <td><p>Dear Sir,</p></td>
          </tr>
          <tr>
              <td>
                  <p>
                      <span style="color:#0065B3; font-size:14px; font-weight:bold">Offer Inquiry message</span><br />
                      The details provided are:
                  </p>
                   <p><strong>Fullname</strong> : '.$fullname.'<br />		
		  <strong>E-mail Address</strong>: '.$email.'<br />
		  <strong>Contact</strong>: '.$phone.'<br />
		  <strong>Message</strong>: '.$message.'<br />
		  </p>
              </td>
          </tr>
          <tr>
              <td>
                  <p>Thank you,<br />
                  ' . $fullname . '
                  </p>
              </td>
          </tr>
      </table>
';

  $mail = new PHPMailer();
  $mail->SetFrom($email, $fullname);
  $mail->AddReplyTo($email, $fullname);
  $mail->AddAddress($usermail, $sitename);
  if (!empty($ccusermail)) {
      $rec = explode(';', $ccusermail);
      if ($rec) {
          foreach ($rec as $row) {
              $mail->AddCC($row, $sitename);
          }
      }
  }

  $mail->Subject = 'Offer Inquiry mail from ' . $fullname.' for '.$offertitle.'';
  $mail->MsgHTML($body);

  if (!$mail->Send()) {
      echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your Inquiry at the time. Please try again later."));
  } else {
      echo json_encode(array("action" => "success", "message" => "Your Inquiry has been successfully sent."));
  }
endif;

if ($_POST['action'] == "foractivity"):
    $subpackagedata= Subpackage::find_by_slug($slug);

    if(!empty($subpackagedata)){
        $price=$subpackagedata->currency.$subpackagedata->onep_price;
        $actname=$subpackagedata->title;

    }
  $body = '
      <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
          <tr>
              <td><p>Dear Sir,</p></td>
          </tr>
          <tr>
              <td>
                  <p>
                      <span style="color:#0065B3; font-size:14px; font-weight:bold">Activity Inquiry message</span><br />
                      The details provided are:
                  </p>
                   <p>
                   <strong>Activity name</strong> : '.$actname.'<br />		
                   <strong>price</strong> : '.$price.'<br />		
                   <strong>Fullname</strong> : '.$fullname.'<br />		
		  <strong>E-mail Address</strong>: '.$email.'<br />
		  <strong>Contact</strong>: '.$phone.'<br />
		  <strong>Message</strong>: '.$message.'<br />
		  </p>
              </td>
          </tr>
          <tr>
              <td>
                  <p>Thank you,<br />
                  ' . $fullname . '
                  </p>
              </td>
          </tr>
      </table>
';

  $mail = new PHPMailer();
  $mail->SetFrom($email, $fullname);
  $mail->AddReplyTo($email, $fullname);
  $mail->AddAddress($usermail, $sitename);
  if (!empty($ccusermail)) {
      $rec = explode(';', $ccusermail);
      if ($rec) {
          foreach ($rec as $row) {
              $mail->AddCC($row, $sitename);
          }
      }
  }

  $mail->Subject = 'Activity Inquiry mail from ' . $fullname .' for '.$actname .'';
  $mail->MsgHTML($body);

  if (!$mail->Send()) {
      echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your Inquiry at the time. Please try again later."));
  } else {
      echo json_encode(array("action" => "success", "message" => "Your Inquiry has been successfully sent."));
  }
endif;


if ($_POST['action'] == "forblog"):
  $body = '
      <table width="100%" border="0" cellpadding="0" style="font:12px Arial, serif;color:#222;">
          <tr>
              <td><p>Dear Sir,</p></td>
          </tr>
          <tr>
              <td>
                  <p>
                      <span style="color:#0065B3; font-size:14px; font-weight:bold">Blog Comment</span><br />
                      The details provided are:
                  </p>
                   <p>
                   <strong>Fullname</strong> : '.$fullname.'<br />		
		  <strong>E-mail Address</strong>: '.$email.'<br />
		  <strong>Message</strong>: '.$message.'<br />
		  </p>
              </td>
          </tr>
          <tr>
              <td>
                  <p>Thank you,<br />
                  ' . $fullname . '
                  </p>
              </td>
          </tr>
      </table>
';

  $mail = new PHPMailer();
  $mail->SetFrom($email, $fullname);
  $mail->AddReplyTo($email, $fullname);
  $mail->AddAddress($usermail, $sitename);
  if (!empty($ccusermail)) {
      $rec = explode(';', $ccusermail);
      if ($rec) {
          foreach ($rec as $row) {
              $mail->AddCC($row, $sitename);
          }
      }
  }

  $mail->Subject = 'Blog Comment from ' . $fullname.' for '.$blogtitle.' ';
  $mail->MsgHTML($body);

  if (!$mail->Send()) {
      echo json_encode(array("action" => "unsuccess", "message" => "We could not sent your Inquiry at the time. Please try again later."));
  } else {
      echo json_encode(array("action" => "success", "message" => "Your Inquiry has been successfully sent."));
  }
endif;


?>