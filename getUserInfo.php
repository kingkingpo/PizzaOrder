<?php

/*
 * File name:     getUserInfo.php
 * 
 * Purpose:       When the user clicks 'Login' button,
 *                checks if the email address entered by the user alraedy exists in DB.
 *                If yes, it sends the previously used delivery addresses to the browser.
 *                If not, it sends out an error message saying "No email found".
 */

session_start();
header("Content-Type: application/json");


// include a php file containing functions and constants required
require_once ('initialize.php');


/*
 * Function:    getUserInfo()
 * Purpose:     Checks if the user's email already exists in the DB
 * Return:      an array of the user's adderss which is converted into JSON,
 *              or an erro message saying "No email found"
 */
getUserInfo();

?>