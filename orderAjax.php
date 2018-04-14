<?php
session_start();
header("Content-Type: application/json");
require_once ('initialize.php');

$db_conn = connect_db();

$orderId=saveOrders($db_conn);

$status=saveOrderDetails($db_conn,$orderId);

//print json string( succeed or failed) depend on the result
echo $status;

disconnect_db($db_conn);

//save CustId and address info in Orders table
function saveOrders($db_conn){
    $qry="INSERT INTO Orders SET CustId=" .$_REQUEST["CustId"]  ." , DeliveryStreetAddress='" .$_REQUEST['DeliveryStreetAddress'] 
    ."', DeliveryUnitNum='" .$_REQUEST['UnitNum'] ."', DeliveryCity='" .$_REQUEST['DeliveryCity'] 
    ."', DeliveryProvince='" .$_REQUEST['DeliveryProvince'] ."', DeliveryPostCode='" .$_REQUEST['DeliveryPostCode'] ."';"; 
    
    $db_conn->query($qry);

    //find OrderId for saving OrderDetails
    $qry="SELECT LAST_INSERT_ID();";
    $rs = $db_conn->query($qry);

    if ($rs->num_rows > 0){
        while ($row = $rs->fetch_assoc()){
            $orderId= $row;
        }
    }
    //return OrderId for saving OrderDetails
    return $orderId["LAST_INSERT_ID()"];
}

//save pizza order info in Order_Details DB
function saveOrderDetails($db_conn,$orderId){
    $length=count($_REQUEST['PizzaType']);
    for($i=0;$i<$length;$i++){
        $qry="INSERT INTO Order_Details SET OrderId=" .$orderId ." , PizzaType='" .$_REQUEST['PizzaType'][$i]
         ."', SizeType='" .$_REQUEST['Size'][$i] ."', DoughType='" .$_REQUEST['DoughType'][$i] 
         ."', SauceType='" .$_REQUEST['SauceType'][$i] ."', CheeseType='" .$_REQUEST['CheeseType'][$i] 
         ."', Toppings='" .$_REQUEST['Toppings'][$i] ."';"; 
    
         $rs = $db_conn->query($qry);
   
    }
    if($rs==true){
        return  '{ "status": "succeed", "orderId":"' .$orderId  .'" }';
    }
    else{
        return '{ "status": "failed" }';
    }
    
}


?>
