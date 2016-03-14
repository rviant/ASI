<html>
<head>
<!-- Adding BOOTSTRAP -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<head>
<body>
    <form method ="POST" action="">

    <div class="row">
     <div class="col-md-1"></div>
      <div class="col-lg-10">

            <!-- creating registered Student list -->
            <?php

              require 'API.php';/* adding API */  

              $registerStudent    = getAllStudents();
              $totalStudent       = count($registerStudent);
              //print_r($registerStudent[0]);//testing
            ?>

            <h2>
            Registered Student
            <?php echo "[$totalStudent]"; ?>
            </h2>
            <table class="table table-striped">
              <tr>
                <th>ID</th>
                <th></th>
                <th></th>
                <th>Username</th> 
                <th>Email</th> 
              </tr>
              <?php

                //iterating thru all Student
                for( $iter = 0; $iter < $totalStudent; $iter++ )
                {
                  $currentRow = $registerStudent[$iter];
                  // print_r($currentRow);
                  $peopleID = $currentRow['studentID'];
              ?>
                  <tr>
                    <td> 

                      <?php print '<div id="registeredStudentCollapse_'.$peopleID.'">'; ?>
                      <?php print '<a class="btn btn-primary" href="#registeredStudent'.$peopleID.'" data-toggle="collapse">'; ?> 
                          <?php echo $peopleID; ?> 
                        </a>
                      </div>
                    </td>
                    <td> <?php echo $currentRow['username']; ?> </td> 
                    <td> <?php echo $currentRow['email']; ?> </td>
                    </tr>
                    <!-- rest of registered user data goes below: -->
                    <tr>
                    <td>
                        <?php print '<div id="registeredStudent'.$peopleID.'" class="collapse">'; ?> 
                        <table class="table table-condensed" align="center">
                        <tbody>
                         <tr>
                            <td><b>firstName</b></td> 
                            <td> <?php echo $currentRow['firstName']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>middleName</b></td> 
                            <td> <?php echo $currentRow['middleName']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>lastName</b></td> 
                            <td> <?php echo $currentRow['lastName']; ?> </td>   
                          </tr> 
                          <tr>
                            <td><b>username</b></td> 
                            <td> <?php echo $currentRow['username']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>password</b></td> 
                            <td> <?php echo $currentRow['password']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>email</b></td> 
                            <td> <?php echo $currentRow['email']; ?> </td>   
                          </tr>
                          <tr>
                            <td><b>phone</b></td> 
                            <td> <?php echo $currentRow['phone']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>universityID</b></td> 
                            <td> <?php echo $currentRow['universityID']; ?> </td> 
                          </tr>  
                            <tr>
                            <td><b>forgotPasswordCode</b></td> 
                            <td> <?php echo $currentRow['forgotPasswordCode']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>accountLocked</b></td> 
                            <td> <?php echo $currentRow['accountLocked']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>loginRequests</b></td> 
                            <td> <?php echo $currentRow['loginRequests']; ?> </td>   
                          </tr>                                                                    
                        </tbody>
                        </table>
                    </td>
                    </tr>
                  
              <?php
                }//eofl
              ?>
            </table>


            <p></p>
            <hr>
            <p></p>
            <?php
              $registerTutors = getAllTutors();
              $totalTutors = count($registerTutors);
              //print_r($registerTutors[0]);//testing
            ?>
              <h2>
                Registered Tutor
                <?php echo "[$totalTutors]"; ?>
            </h2>
            <table class="table table-striped">
              <tr>
                <th>ID</th>
                <th></th>
                <th>Username</th> 
                <th>Email</th> 
              </tr>

             <?php

                //iterating thru all Tutor
                for( $iter = 0; $iter < $totalTutors; $iter++ )
                {
                  $currentRow = $registerTutors[$iter];
                  $TutorID = $currentRow['tutorID'];
              ?>
                  <tr>
                    <td> 
                      <?php print '<div id="registeredEmployerCollapse_'.$TutorID.'">'; ?>
                      <?php print '<a class="btn btn-primary" href="#registeredEmployer'.$TutorID.'" data-toggle="collapse">'; ?> 
                          <?php echo $TutorID; ?> 
                        </a>
                      </div>
                    </td>               
                    <td> <?php echo $currentRow['username']; ?> </td> 
                    <td> <?php echo $currentRow['email']; ?> </td>
                    </tr>
                    <tr>
                   <td>
                        <?php print '<div id="registeredEmployer'.$TutorID.'" class="collapse">'; ?> 
                        <table class="table table-condensed" align="center">
                        <tbody>
                         <tr>
                            <td><b>firstName</b></td> 
                            <td> <?php echo $currentRow['firstName']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>middleName</b></td> 
                            <td> <?php echo $currentRow['middleName']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>lastName</b></td> 
                            <td> <?php echo $currentRow['lastName']; ?> </td>   
                          </tr>
                          <tr>
                            <td><b>username</b></td> 
                            <td> <?php echo $currentRow['username']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>password</b></td> 
                            <td> <?php echo $currentRow['password']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>email</b></td> 
                            <td> <?php echo $currentRow['email']; ?> </td>   
                          </tr>

                           <tr>
                            <td><b>phone</b></td> 
                            <td> <?php echo $currentRow['phone']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>accountLocked</b></td> 
                            <td> <?php echo $currentRow['accountLocked']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>loginRequests</b></td> 
                            <td> <?php echo $currentRow['loginRequests']; ?> </td>   
                          </tr>
                          <tr>
                            <td><b>forgotPasswordCode</b></td> 
                            <td> <?php echo $currentRow['forgotPasswordCode']; ?> </td>  
                          </tr>  
                        </tbody>
                        </table>
                    </td>
                    </tr>
              <?php
                }//eofl
              ?>
            </table> 

     <p></p>
            <hr>
            <p></p>
            <?php
              $registerManagers = getAllManagers();
              $totalManagers = count($registerManagers);
              // print_r($registerManagers[0]);//testing
            ?>
              <h2>
                Registered Manager
                <?php echo "[$totalManagers]"; ?>
            </h2>
            <table class="table table-striped">
              <tr>
                <th>ID</th>
                <th></th>
                <th>Username</th> 
                <th>Email</th> 
              </tr>

             <?php

                //iterating thru all Student
                for( $iter = 0; $iter < $totalManagers; $iter++ )
                {
                  $currentRow = $registerManagers[$iter];
                  $managerID = $currentRow['managementID'];
              ?>
                  <tr>
                    <td> 
                      <?php print '<div id="registeredEmployerCollapse_'.$managerID.'">'; ?>
                      <?php print '<a class="btn btn-primary" href="#registeredEmployer'.$managerID.'" data-toggle="collapse">'; ?> 
                          <?php echo $managerID; ?> 
                        </a>
                      </div>
                    </td>               
                    <td> <?php echo $currentRow['username']; ?> </td> 
                    <td> <?php echo $currentRow['email']; ?> </td>
                    </tr>
                    <tr>
                   <td>
                        <?php print '<div id="registeredEmployer'.$managerID.'" class="collapse">'; ?> 
                        <table class="table table-condensed" align="center">
                        <tbody>
                         <tr>
                            <td><b>firstName</b></td> 
                            <td> <?php echo $currentRow['firstName']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>middleName</b></td> 
                            <td> <?php echo $currentRow['middleName']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>lastName</b></td> 
                            <td> <?php echo $currentRow['lastName']; ?> </td>   
                          </tr>
                          <tr>
                            <td><b>username</b></td> 
                            <td> <?php echo $currentRow['username']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>password</b></td> 
                            <td> <?php echo $currentRow['password']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>email</b></td> 
                            <td> <?php echo $currentRow['email']; ?> </td>   
                          </tr>
                           <tr>
                            <td><b>phone</b></td> 
                            <td> <?php echo $currentRow['phone']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>accountLocked</b></td> 
                            <td> <?php echo $currentRow['accountLocked']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>loginRequests</b></td> 
                            <td> <?php echo $currentRow['loginRequests']; ?> </td>   
                          </tr>
                        </tbody>
                        </table>
                    </td>
                    </tr>
              <?php
                }//eofl
              ?>
            </table> 

        </div>
        <div class="col-md-1"></div>
    </div>

    </form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</html>
