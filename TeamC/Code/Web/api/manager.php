<?php


  /* gets all staff*/
    function getAllManagers()
    {

      $finalList = array();

      //connecting to db
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //gettting all staff
      $query = "SELECT * FROM management";
      $result = mysqli_query($dbConnection, $query);

      $totalRows = mysqli_num_rows($result);
      if($totalRows > 0)
      {
        while( $row = mysqli_fetch_array( $result, MYSQLI_ASSOC ) )
        {
          array_push($finalList, $row);
        }
      }

      return $finalList;
    }//eom


?>