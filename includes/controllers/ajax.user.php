<?php 
	// Load the header files first
	header("Expires: 0"); 
	header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); 
	header("cache-control: no-store, no-cache, must-revalidate"); 
	header("Pragma: no-cache");

	// Load necessary files then...
	require_once('../initialize.php');
	
	$action = $_REQUEST['action'] ?? '';
	
	switch($action) 
	{
		case "addNewUser":
			$record = new User();

			$record->first_name 	= $_REQUEST['first_name'];
			$record->middle_name	= $_REQUEST['middle_name'];
			$record->last_name		= $_REQUEST['last_name'];				
		$record->email = !empty($_REQUEST['email']) ? $_REQUEST['email'] : null;

			$record->optional_email = $_REQUEST['optional_email'];
			$record->hall_email = $_REQUEST['hall_email'];
			$record->hr_email = $_REQUEST['hr_email'];
			$record->username		= $_REQUEST['username'];
			$record->password		= md5($_REQUEST['password']);
			$record->accesskey		= @randomKeys(25);
			$record->group_id		= $_REQUEST['field_type'];
			$record->status			= $_REQUEST['status'];
			$record->sortorder		= User::find_maximum();
			$record->added_date 	= registered();
			
			$checkDupliUname=User::checkDupliUname($record->username);
			if($checkDupliUname):
				echo json_encode(array("action"=>"warning","message"=>"Username Already Exists."));		
				exit;		
			endif;
			$db->begin();
			if($record->save()): $db->commit();
				$message  = sprintf($GLOBALS['basic']['addedSuccess_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
				log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] login Created ".$GLOBALS['basic']['addedSuccess'],1,3);
			else: $db->rollback(); echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;
		
		case "editNewUser":
			$record = User::find_by_id($_REQUEST['idValue']);
			
			$record->first_name 	= $_REQUEST['first_name'];
			$record->middle_name	= $_REQUEST['middle_name'];
			$record->last_name		= $_REQUEST['last_name'];
			$record->email = !empty($_REQUEST['email']) ? $_REQUEST['email'] : null;

			$record->optional_email = $_REQUEST['optional_email'];
			$record->hall_email = $_REQUEST['hall_email'];
			$record->hr_email = $_REQUEST['hr_email'];
			$record->accesskey		= @randomKeys(25);
			if($record->username!=$_REQUEST['username']){
				$checkDupliUname=User::checkDupliUname($_REQUEST['username']);
				if($checkDupliUname):
					echo json_encode(array("action"=>"warning","message"=>"Username Already Exists."));	
					exit;		
				endif;
			}
			
			$record->username	= $_REQUEST['username'];			
			$record->status		= $_REQUEST['status'];
			$record->group_id	= $_REQUEST['field_type'];
			if(!empty($_REQUEST['password']))
			$record->password	= md5($_REQUEST['password']);
			$db->begin();
			if($record->save()):$db->commit();
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] Edit Successfully",1,4);
			else: $db->rollback(); echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;		

		case "userPermission":
			$record = User::find_by_id($_REQUEST['idValue']);
			
			$module_id = !empty($_REQUEST['module_id'])?$_REQUEST['module_id']:array();
			$record->permission = serialize($module_id);

			$db->begin();
			if($record->save()):$db->commit();
			   $message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			   log_action("User [".$record->first_name." ".$record->middle_name." ".$record->last_name."] Edit Successfully",1,4);
			else: $db->rollback(); echo json_encode(array("action"=>"notice","message"=>$GLOBALS['basic']['noChanges']));
			endif;
		break;
					
		case "delete":			
			$id = $_REQUEST['id'];
			$record = User::find_by_id($id);
			$db->begin();
			$res = $db->query("DELETE FROM tbl_users WHERE id='{$id}'");
			if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_users", "sortorder");
			
			$message  = sprintf($GLOBALS['basic']['deletedSuccess_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			echo json_encode(array("action"=>"success","message"=>$message));					
			log_action("Question Category  [".$record->first_name.' '.$record->middle_name.' '.$record->last_name."]".$GLOBALS['basic']['deletedSuccess'],1,6);
		break;
		
		// Module Setting Sections  >> <<
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = User::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$db->begin();  	
			$res = $record->save();
			if($res):$db->commit();	else: $db->rollback();endif;
			echo "";
		break;						
		case "sortbyadmin":
			$id 	= $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$order	= ($_REQUEST['toPosition']==1)?0:$_REQUEST['toPosition'];// IS a line containing sortorder
			$db->begin();
			$res = $db->query("UPDATE tbl_users SET sortorder=".$order." WHERE id=".$id." ");
			if($res):$db->commit();	else: $db->rollback();endif;
			reOrder("tbl_users", "sortorder");
			$message  = sprintf($GLOBALS['basic']['sorted_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			echo json_encode(array("action"=>"success","message"=>$message));	
		break;
		case "sort":
			$id 	 = $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$sortIds = $_REQUEST['sortIds'];
			$posId   = Menu::field_by_id($id,'parentOf');
			datatableReordering('tbl_menu', $sortIds, "sortorder", "parentOf",$posId);
			$message  = sprintf($GLOBALS['basic']['sorted_'], "Menu"); 
			echo json_encode(array("action"=>"success","message"=>$message));
		break;

		case "checkLogin":
			$session->start();
			$uname    = addslashes($_REQUEST['username']);
			$password = addslashes($_REQUEST['password']) ;

			$found_user = User::authenticateAdmin($uname, md5($password));
			// pr($found_user);
			
			// ** check the number of login attempts
			$_SESSION['countrials'] = (isset($_SESSION['countrials'])) ? $_SESSION['countrials']+1 : 1;
			if($found_user && $found_user->status==1):

				
				
				$session->set('u_group',$found_user->group_id);
				$session->set('u_id',$found_user->id);
				$session->set('acc_ip',$_SERVER['REMOTE_ADDR']);
				$session->set('acc_agent',$_SERVER['HTTP_USER_AGENT']);
				// $session->set('user_type',$found_user->type);
				$session->set('loginUser',$found_user->username);
				$session->set('accesskey',$found_user->accesskey);

				$preId = Config::getconfig_info();
				log_action($GLOBALS['login']['login'].$session->get('loginUser').$GLOBALS['login']['loggedIn'],1,1);
				echo json_encode(array("action"=>"success","pgaction"=>$preId->action));
			else: 
				echo json_encode(array("action"=>"unsuccess","message"=>"Username Or Password Not Match "));     
			endif;
			//  pr($_SESSION);
		break;
		
		case "changepassword":
			$record = User::find_by_id($_REQUEST['idValue']);	
			
			if(!empty($_REQUEST['password']))
			$record->password	= md5($_REQUEST['password']);	
			$db->begin();		
			if($record->save()): $db->commit();
				$message  = sprintf($GLOBALS['basic']['changesSaved_'], "User '".$record->first_name." ".$record->middle_name." ".$record->last_name."'");
			    echo json_encode(array("action"=>"success","message"=>$message));
			else: $db->rollback();echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['unableToSave']));
			endif;
		break;
		
		case "forgetuser_password":

			// 1. Get username from POST
			$username = trim($_REQUEST['username']);

			if (empty($username)) {
				echo json_encode([
					'action' => 'unsuccess',
					'message' => 'Username is required'
				]);
				exit;
			}

			// 2. Find user by username
			$user = User::find_by_user($username);

			if (!$user) {
				echo json_encode([
					'action' => 'unsuccess',
					'message' => 'Invalid username'
				]);
				exit;
			}

			$accessToken = randomKeys(10);

			global $db;
			$db->query("UPDATE " . User::$table_name . " 
					SET access_code='{$accessToken}'
					WHERE username='{$username}' LIMIT 1");


			// 4. Prepare email details
			$fullName = trim($user->first_name . ' ' . $user->middle_name . ' ' . $user->last_name);
			$siteName = Config::getField('sitename', true);
			$resetLink = ADMIN_URL . 'resetpassword-' . $accessToken;

			$msgbody_admin = "
				<div>
					<h3>Password Reset Request on {$siteName}</h3>
					<p>User <strong>{$username}</strong> ({$fullName}) requested a password reset.</p>
					<p>Reset token: {$accessToken}</p>
					<p>Click <a href='{$resetLink}'>here</a> to reset their password.</p>
				</div>
			";

			
			// 5. Determine which admin should receive the email
			if ($user->id == 2) {
				// If the requesting user is admin ID 2, send to admin 2
				$admin = User::find_by_id(2);
			} else {
				// For all other users (including admin 1), send to admin ID 1
				$admin = User::find_by_id(1);
			}

			// 6. Send email
			if ($admin && !empty($admin->email)) {
				$mail = new PHPMailer();
				$mail->setFrom($admin->email, $siteName);
				$mail->addAddress($admin->email, trim($admin->first_name . ' ' . $admin->last_name));
				$mail->addReplyTo($admin->email, $siteName);
				$mail->Subject = "User {$username} requested password reset";
				$mail->msgHTML($msgbody_admin);
				$mail->send();
			}

			// 7. Respond success
			echo json_encode([
				'action' => 'success',
				'message' => 'Password reset request has been sent to the admin.'
			]);

		break;

		
		case "resetuser_password":
			$id = addslashes($_REQUEST['userId']);
			$record = User::find_by_id($id);
			$record->password = md5($_REQUEST['password']);
			$record->access_code = randomKeys(10);
			if($record->save()):
				echo json_encode(array('action'=>'success','message'=>'Password has been changed, please login!'));
			else:
				echo json_encode(array('action'=>'unsuccess','message'=>'Internal error.'));
			endif;
		break;
	}
?>