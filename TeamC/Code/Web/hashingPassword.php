<?php

  require 'API.php';/* adding API */
          


  $password = "studentpassword";

  $hashedPassword = hashPassword($password);

  ?>
    <p>
      <?php
        echo "password: ".$password;
      ?>
    </p>

    <p>
      <?php
        echo "hashedPassword: ".$hashedPassword;
      ?>
    </p>
<?php



?>