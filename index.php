<?php

 function index(){
// $response = new stdClass();
$timestamp = date("Y-m-d h:i:s");
 $ip = $_SERVER['REMOTE_ADDR'];
 echo json_encode(array('timestamp'=>$timestamp,'ip'=>$ip));

}

index();
?>
