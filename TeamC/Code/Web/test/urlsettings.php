<?php

$localTesting = false;

$testingStudentUser = true;
$testingTutorUser   = false;
$testingManagerUser = false;

$urlBody = '';
if($localTesting)
{
   //lu link body
  $urlBody = 'http://localhost:8888/Web/LuisCastilloWebsite/asi/Code/Web/';

  //wil link body
  // $urlBody = 'localhost:8888/GO-LOCAL-STAFF-APP/Website/';
  
}
else
{
  $urlBody = 'http://luiscastillo.me/asi/Code/Web/';
}

  $url_sendLogin                = $urlBody.'jsonPOST_login.php';
  $url_sendForgotPassword1      = $urlBody.'jsonPOST_forgotPassword1.php';
  $url_sendForgotPassword2      = $urlBody.'jsonPOST_forgotPassword2.php';



  //testing links
  $url_sendSMS                  = $urlBody.'jsonPOST_sms.php';
  $url_sendSMSCode              = $urlBody.'jsonPOST_smsCode.php';

  $url_sendEmployerRegistration = $urlBody.'jsonPOST_registration.php';
  $url_sendSearchTalent         = $urlBody.'jsonPOST_searchTalent.php';
  $url_getSearchStaffDetailView = $urlBody.'jsonPOST_getSearchStaffDetail.php';

?>
