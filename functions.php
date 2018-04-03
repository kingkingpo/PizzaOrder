<?php

function url_for($script_path){
    //add the leading '/' if not present
    if($script_path[0] != '/'){
        $script_path = "/" . $script_path;
    }
    return WWW_ROOT . $script_path;
}

function redirect_to($location) {
    header("Location: ". $location);
    exit;
}

function is_post_request() {
    return $_SERVER['REQUEST_METHOD'] == 'POST';
}

function is_get_request() {
    return $_SERVER['REQUEST_METHOD'] == 'GET'; //This will return true or false
}

/////////////////////////////////////////////

// DB operations
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


function getUserInfo() {

    if ( isset($_POST['email']) ) {

        // connect to the DB
        $db_conn = connect_db();

        // sanitize user inputs
        $email = $db_conn->real_escape_string($_POST['email']);

        // 사용자 아이디 가져와서 SESSION 값으로 넣어주기
        $userId = "SELECT CustId FROM customers WHERE Email ='".$email."'";
        $resultId = $db_conn->query($userId);

        if ($resultId->num_rows > 0){

            while ($rowId = $resultId->fetch_assoc()){
                $custId = $rowId['CustId'];
                $_SESSION["CustId"] = $custId;
            }
        }

        // 사용자 이메일을 기준으로 오더 테이블에 있는 주소 가져오기
        $sql = "SELECT DISTINCT c.Email, o.DeliveryStreetAddress, o.DeliveryUnitNum, o.DeliveryCity, o.DeliveryProvince, o.DeliveryPostCode
                FROM customers c
                INNER JOIN orders o
                ON c.CustId = o.CustId
                WHERE email='" .$email."'";
        
        // echo "<p>$sql</p>";
        $result = $db_conn->query($sql);
        
        if ($db_conn->error) {
            $error = $db_conn->error;
        }

        if ($result->num_rows > 0){

            $customers = array("status" => "OK");
            $customers['customers'] = array();

            while ($row = $result->fetch_assoc()){

                array_push($customers['customers'], $row);

            } //End While()

            echo json_encode($customers);
        
        } else {
            // 만약 결과가 없으면 이메일 없음
            echo '{ "status": "No email found" }';
        }

        // disconnect DB
        disconnect_db($db_conn);
    }

} //end getUserInfo()


function saveUserInfo() {

    if ( isset($_POST['fullName']) && isset($_POST['street']) && isset($_POST['unitNum']) 
        && isset($_POST['city']) && isset($_POST['province']) && isset($_POST['postalCode'])) {

        // connect to the DB
        $db_conn = connect_db();

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
            // $lastId = $db_conn->lastInsertId();
            
            if (!$affectedRows){
                echo '{ "status": "Oops. Something is missing. Please fill all the fields" }';
        
            } else if ($affectedRows == 1) {
                // customer 테이블에 사용자 정보 업데이트 성공하면
                //echo '{ "status": "OK" }';

                //get updated CustId
                $sql2 = "SELECT * FROM customers WHERE Email = '".$email. "'";
                $getCustAdd = $db_conn->query($sql2);

                if ($db_conn->error) {
                    $error = $db_conn->error;
                    echo $error;
                }
                
                if ($getCustAdd->num_rows > 0){

                    $customers = array("status" => "NewOK");
                    $customers['customers'] = array();
        
                    while ($row = $getCustAdd->fetch_assoc()){
        
                        array_push($customers['customers'], $row);
        
                    } //End While()
        
                    echo json_encode($customers);
                } else {
                    // 만약 결과가 없으면 이메일 없음
                    echo '{ "status": "Something went wrong." }';
                }

            }
        
        // disconnect DB
        disconnect_db($db_conn);
    }
}
} // end saveUserInfo()


?>