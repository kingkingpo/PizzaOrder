<?php 

/*
 * Course:          INFO  - LAMP 2
 * Program:
 * Date:            2018-April-10
 * Group Members:   
 */

require_once('initialize.php'); ?>

<?php include('header.php'); ?>

<header>
<h2>Order Pizza Online</h2>
</header>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-md-5">
            <p>Welcome to Fanshawe Pizza Parlor!</p>

            <p>Order your favorite pizzas online.</p>
            <ul>
            <li>Please click the button below to start the order process.</li>
            <li>This survey consists of three separate pages.</li>
            <li>You can go back to the previous order steps with 'Back' button.</li>
            <li>It is not possible to progress to the next page unless all fields are satisfactory.</li>
            </ul>
        </div>

        <div class="col-xs-12 col-md-5">
            <img src="./images/shopOpen.png">
        </div>
    </div>
    
    <a href="<?php echo url_for('/order.php'); ?>">Start</a>
</div>

<?php include('footer.php'); ?>