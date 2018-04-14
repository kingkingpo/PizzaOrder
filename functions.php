<?php


// Connect to DB
function connect_db(){
    $db_conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
        if ($db_conn->connect_errno) {
            die ("Could not connect to database server".$db_host."\n Error: "
                .$db_conn->connect_errno 
                ."\n Report: ".$db_conn->connect_error."\n");
        }
        return $db_conn;
}

function disconnect_db($db_conn){
    $db_conn->close();
}


// Check user email, and get user information stored in the DB
function getUserInfo() {

    if ( isset($_POST['email']) ) {

        // Connect to the DB
        $db_conn = connect_db();

        if ($db_conn->error) {
            $error = $db_conn->error;
        }

        // Sanitize user inputs
        $email = $db_conn->real_escape_string($_POST['email']);

        //*****************0409 테스트 */
        $userId = "SELECT CustId FROM customers WHERE Email ='".$email."'";
        $resultId = $db_conn->query($userId);

        if ($resultId->num_rows > 0){

            while ($rowId = $resultId->fetch_assoc()){
                $custId = $rowId['CustId'];
            }
        }

        // Get exising delivery addresses
        $sql = "SELECT DISTINCT o.CustId, c.Email, o.DeliveryStreetAddress, o.DeliveryUnitNum, o.DeliveryCity, o.DeliveryProvince, o.DeliveryPostCode
                FROM customers c
                INNER JOIN orders o
                ON c.CustId = o.CustId
                WHERE email='" .$email."'";
  
            $result = $db_conn->query($sql);

            if ($result->num_rows > 0){

                $customers = array("status" => "OK");
                $customers['customers'] = array();

                while ($row = $result->fetch_assoc()){

                    array_push($customers['customers'], $row);

                } //End While-loop

                echo json_encode($customers);
            
            } else {
                // if no result, send out an error message
                echo '{ "status": "No email found" }';
            }

        // disconnect DB
        disconnect_db($db_conn);
    }

} //end getUserInfo()


// Save NEW USER data in DB
function saveUserInfo() {

    if ( isset($_POST['fullName']) && isset($_POST['street']) && isset($_POST['unitNum']) 
        && isset($_POST['city']) && isset($_POST['province']) && isset($_POST['postalCode'])) {

        // connect to the DB
        $db_conn = connect_db();

        if ($db_conn->error) {
            $error = $db_conn->error;
            echo $error;
        }

        // sanitize user inputs
        $email = $db_conn->real_escape_string($_POST['email']);
        $fullName = $db_conn->real_escape_string($_POST['fullName']);
        $phoneNum = $db_conn->real_escape_string($_POST['phoneNum']);
        $unitNum = $db_conn->real_escape_string($_POST['unitNum']);
        $street = $db_conn->real_escape_string($_POST['street']);
        $city = $db_conn->real_escape_string($_POST['city']);
        $province = $db_conn->real_escape_string($_POST['province']);
        $postalCode = $db_conn->real_escape_string($_POST['postalCode']);

        $sql = 'INSERT INTO customers (FullName, UnitNum, StreetAddress, City, Province, PostCode, Email, PhoneNumber)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)';

        $stmt = $db_conn->stmt_init();

        if(!$stmt->prepare($sql)) {
            $error = $stmt->error;
            echo $error;
        } else {
            $stmt->bind_param('ssssssss', $fullName, $unitNum, $street, $city, $province, $postalCode, $email, $phoneNum);
            $stmt->execute();
            $affectedRows = $stmt->affected_rows;
            
            if (!$affectedRows){
                echo '{ "status": "Oops. Something is missing. Please fill out all the fields" }';
            } else if ($affectedRows == 1) {
                // if INSERT is done successfully,
                //get the CustId
                $sql2 = "SELECT * FROM customers WHERE Email = '".$email. "'";
                $getCustAdd = $db_conn->query($sql2);
                
                if ($getCustAdd->num_rows > 0){
                    // if there is any results returned from SQL query,
                    // create & populate customers array    
                    $customers = array("status" => "NewOK");
                    $customers['customers'] = array();
        
                    while ($row = $getCustAdd->fetch_assoc()){
        
                        array_push($customers['customers'], $row);
        
                    } //End While()
        
                    echo json_encode($customers);
                } else {
                    // if no result, send out an error message
                    echo '{ "status": "Something went wrong." }';
                }

            }
        
        // disconnect DB
        disconnect_db($db_conn);
    }
}
} // end saveUserInfo()


// SAVE NEW ADDRESS
/* function addNewAddress(){

    if ( isset($_POST['emailNew']) && isset($_POST['streetNew']) && isset($_POST['unitNumNew']) 
        && isset($_POST['cityNew']) && isset($_POST['provinceNew']) && isset($_POST['postalCodeNew'])) {

        // Connect to the DB
        $db_conn = connect_db();

        if ($db_conn->error) {
            $error = $db_conn->error;
            echo $error;
        }

        // Sanitize user inputs
        $emailNew = $db_conn->real_escape_string($_POST['emailNew']);
        $unitNumNew = $db_conn->real_escape_string($_POST['unitNumNew']);
        $streetNew = $db_conn->real_escape_string($_POST['streetNew']);
        $cityNew = $db_conn->real_escape_string($_POST['cityNew']);
        $provinceNew = $db_conn->real_escape_string($_POST['provinceNew']);
        $postalCodeNew = $db_conn->real_escape_string($_POST['postalCodeNew']);

        // Get user id from the email address provided
        $sqlId = "SELECT CustId FROM Customers WHERE Email = '".$emailNew. "'";
        $resultID = $db_conn->query($sqlId);
        
        if ($resultID->num_rows > 0){

            while ($rowId = $resultID->fetch_assoc()){
                $CustIdRetrieved = $rowId['CustId'];
            }
        }

        // Insert the new delivery address to DB (Orders table)
        $sql = "INSERT INTO Orders (CustId, DeliveryUnitNum, DeliveryStreetAddress, DeliveryCity, DeliveryProvince, DeliveryPostCode)
                VALUES (?, ?, ?, ?, ?,?)";

        $stmt = $db_conn->stmt_init();

        if(!$stmt->prepare($sql)) {
            $error = $stmt->error;
            echo $error;
        } else {
            $stmt->bind_param('isssss', $CustIdRetrieved, $unitNumNew, $streetNew, $cityNew, $provinceNew, $postalCodeNew);
            $stmt->execute();
            $affectedRows = $stmt->affected_rows;
            
            if (!$affectedRows){
                echo '{ "status": "Oops. Something is missing. Please fill out all the fields" }';
            } else if ($affectedRows == 1) {

                //get updated CustId
                // $sql2 = "SELECT DISTINCT * FROM Orders WHERE CustId = ".$CustIdRetrieved;

                // Get all of the delivery addresses of the user
                $sql2 = "SELECT DISTINCT c.Email, o.DeliveryStreetAddress, o.DeliveryUnitNum, o.DeliveryCity, o.DeliveryProvince, o.DeliveryPostCode
                        FROM customers c
                        INNER JOIN orders o
                        ON c.CustId = o.CustId
                        WHERE c.Email='" .$emailNew."'";

                $getNewAdd = $db_conn->query($sql2);

                if ($getNewAdd->num_rows > 0){

                    $customersNew = array("status" => "NewAddressOK");
                    $customersNew['newAddress'] = array();
        
                    while ($row = $getNewAdd->fetch_assoc()){
        
                        array_push($customersNew['newAddress'], $row);
        
                    } //End While()
        
                    echo json_encode($customersNew);
                    
                } else {
                    // in case of error, send out an error message
                    echo '{ "status": "Something went wrong." }';
                }

            }
        
        // disconnect DB
        disconnect_db($db_conn);
    }

    }


} */

?>