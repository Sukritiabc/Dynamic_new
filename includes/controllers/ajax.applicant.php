<?php 
	// Load the header files first
	header("Expires: 0"); 
	header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); 
	header("cache-control: no-store, no-cache, must-revalidate"); 
	header("Pragma: no-cache");

	// Load necessary files then...
	require_once('../initialize.php');
	
	$action = $_REQUEST['action'];
	
	switch($action) 
	{			
			
		case "delete":
			$id = $_REQUEST['id'];
			$record = giftvoucher::find_by_id($id);
			$name=$record->fullname;
			$db->begin();
			$res = $db->query("DELETE FROM tbl_giftvoucher WHERE id='{$id}'");
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_giftvoucher", "sortorder");
			
			$message  = sprintf($GLOBALS['basic']['deletedSuccess_'], "giftvoucher '".$name."'");
			echo json_encode(array("action"=>"success","message"=>$message));					
			log_action("giftvoucher  [".$name."]".$GLOBALS['basic']['deletedSuccess'],1,6);
		break;
		
		// Module Setting Sections  >> <<
		case "toggleStatus":
			$id = $_REQUEST['id'];
			$record = giftvoucher::find_by_id($id);
			$record->status = ($record->status == 1) ? 0 : 1 ;
			$record->save();
			echo "";
		break;
			
		case "bulkToggleStatus":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			for($i=1; $i<count($allid); $i++){
				$record = giftvoucher::find_by_id($allid[$i]);
				$record->status = ($record->status == 1) ? 0 : 1 ;
				$record->save();
			}
			echo "";
		break;
			
		case "bulkDelete":
			$id = $_REQUEST['idArray'];
			$allid = explode("|", $id);
			$return = "0";
			$db->begin();
			for($i=1; $i<count($allid); $i++){
				$record = giftvoucher::find_by_id($allid[$i]);
				log_action("giftvoucher  [".$record->fullname."]".$GLOBALS['basic']['deletedSuccess'],1,6);				
				$res = $db->query("DELETE FROM tbl_giftvoucher WHERE id='".$allid[$i]."'");				
				$return = 1;
			}
			if($res)$db->commit();else $db->rollback();
			reOrder("tbl_giftvoucher", "sortorder");
			
			if($return==1):
				$message  = sprintf($GLOBALS['basic']['deletedSuccess_bulk'], "giftvoucher"); 
				echo json_encode(array("action"=>"success","message"=>$message));
			else:
				echo json_encode(array("action"=>"error","message"=>$GLOBALS['basic']['noRecords']));
			endif;
		break;
			
		case "sort":
			$id 	= $_REQUEST['id']; 	// IS a line containing ids starting with : sortIds
			$order	= ($_REQUEST['toPosition']==1)?0:$_REQUEST['toPosition'];// IS a line containing sortorder
			
			$db->query("UPDATE tbl_giftvoucher SET sortorder=".$order." WHERE id=".$id." ");
			
			reOrder("tbl_giftvoucher", "sortorder");
			$message  = sprintf($GLOBALS['basic']['sorted_'], "giftvoucher"); 
			echo json_encode(array("action"=>"success","message"=>$message));
		break;
	}
?>