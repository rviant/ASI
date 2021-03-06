<?php  

include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendForgotPassword2);

if($testingStaffUser)
{
    //valid staff user
    $jsonData = [
      "code" => "5603",
      "newPassword" => "2987Andres",
      "userID" => "5",
      "userKey" => "staffID"
      ];
}
else
{
    //valid employer user
    $jsonData = [
      "code" => "4205",
      "newPassword" => "biglu2987",
      "userID" => "2",
      "userKey" => "employerID"
      ];
}

//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
 
echo "<p>sending the following JSON:</p>";
print_r($jsonDataEncoded);

//Tell cURL that we want to send a POST request.
curl_setopt($ch, CURLOPT_POST, 1);
 
//Attach our encoded JSON string to the POST fields.
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);
 
//Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
//Execute the request
echo "<p></p>";
echo "<p></p>";
echo "<p>JSON POST Response:</p>";
$result = curl_exec($ch);


?>
