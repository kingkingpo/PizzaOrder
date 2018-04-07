<?php require_once('initialize.php'); ?>

<?php include('header.php'); ?>

<div class="container-fluid">
	
	<h1 id="plzLogIn">Please login</h1>

	<form method="POST" id="emailForm" style="width: 500px;">
		<div class="form-group">
			<label for="email">Email address</label>
			<input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email" required autofocus>
			<span class="error"><?php if(isset($emailErr)) echo $emailErr;?></span>
		</div>

		<input type="submit" id="btnLogin" name="login" value="Login" />
	</form>

</div>

<div class="container-fluid">
	<div id="div1">Please log-in first</div>

	<form method="POST" id="saveUserInfo" style="width: 500px;">
		<div class="form-group">
			<label for="fullName">Name</label>
			<input type="text" class="form-control" id="fullName" name="fullName" required>
		</div>
		<div class="form-group">
			<label for="phoneNum">Phone Number</label>
			<input type="text" class="form-control" id="phoneNum" name="phoneNum" required>
		</div>
		<div class="form-group">
			<label for="unitNum">Unit Number</label>
			<input type="text" class="form-control" id="unitNum" name="unitNum" required>
		</div>

		<div class="form-group">
			<label for="street">Street address</label>
			<input type="text" class="form-control" id="street" name="street" required>
		</div>
		<div class="form-group">
			<label for="city">City</label>
			<input type="text" class="form-control" id="city" name="city" required>
		</div>
		<div class="form-group">
			<label for="province">Province</label>
			<input type="text" class="form-control" id="province" name="province" required>
		</div>
		<div class="form-group">
			<label for="postalCode">Postal Code</label>
			<input type="text" class="form-control" id="postalCode" name="postalCode" required>
		</div>
		<input type="submit" id="btnSave" name="btnSave" value="Save" />
	</form>
</div>

<div id="addressList"></div>
<button type='button' id="addAddress" onclick='addAddress()' >Add Address</button>
<div id="choosePizza">
<!-- Pizza Name -->
<h4>Please choose the type of pizza</h4>
<select id="pizzaType">
  <option value="Classic">Classic</option>
  <option value="Hawaiian">Hawaiian</option>
  <option value="Chicken">Chicken</option>
  <option value="Veggie">Veggie</option>
  <option value="Pepperoni">Pepperoni</option>
</select></br>


<!-- Size -->
<h4>Please choose the size of pizza</h4>
<select id="size">
  <option value="L">Large</option>
  <option value="M">Medium</option>
  <option value="S">Small</option>
</select></br>

<!-- Dough Type -->
<h4>Please choose the dough type of pizza</h4>
<select id="doughType">
  <option value="stiffDough">Stiff Dough</option>
  <option value="softDough">Soft Dough</option>
  <option value="breadDough">Bread Dough</option>
</select></br>

<!-- Sauce Type -->
<h4>Please choose the sauce to be added</h4>
<select id="sauceType">
  <option value="exquisiteSauce">Exquisite Sauce</option>
  <option value="sicilianSauce">Sicilian Sauce</option>
  <option value="essanaye'sSauce">Essanaye's Sauce</option>
</select></br>

<!-- Cheese Type -->
<h4>Please choose the cheese to be added</h4>
<select id="cheeseType">
  <option value="mozzarella">Mozzarella</option>
  <option value="provolone">Provolone</option>
  <option value="cheddar">Cheddar</option>
  <option value="parmesan">Parmesan</option>
</select></br>
<button type='button' onclick='choosePizza()' >Next</button>
</div>

<!-- Toppings -->
<div id="chooseTopping">
<h4>Please choose the topping to be added</h4>
  <input type="checkbox" id="GreenOlives" value="GreenOlives">Green Olives<br>
  <input type="checkbox" id="Zucchini" value="Zucchini">Zucchini<br>
  <input type="checkbox" id="Onions" value="Onions">Onions<br>
  <input type="checkbox" id="Garlic" value="Garlic">Garlic<br>
  <input type="checkbox" id="Mushrooms" value="Mushrooms">Mushrooms<br>
  <input type="checkbox" id="Pineapple" value="Pineapple">Pineapple<br>
  <input type="checkbox" id="Broccoli" value="Broccoli">Broccoli<br>
  <input type="checkbox" id="Tomatoes" value="Tomatoes">Tomatoes<br>
  <input type="checkbox" id="GreenPeppers" value="GreenPeppers">Green Peppers<br>
  <input type="checkbox" id="Spinach" value="Spinach">Spinach<br>
  
  <button type='button' onclick='chooseTopping()' >Next</button>
</div>

<div id="step5Page">
<table id="pizzaTable" border="1">
</table>

  <button type='button' onclick='completeIncludeCurrent()' >Complete the order, including the current pizza and any other pizzas already added to the order</button>
  </br></br><button type='button' onclick='completNotIncludeCurrent()' >Complete the order, but do not include the current pizza</button>
  </br></br><button type='button' onclick='addPizza()' >Add another pizza to the order</button>
  </br></br><button type='button' onclick='discardCurrentAndAddPizza()' >Discard the current pizza and add another pizza to the order </button>
  </br></br><button type='button' onclick='()' >공사중 Cancel the order </button>
</div>

<div id="step6Page">
<table id="finalAddress" border="1"></table>
<table id="finalPizzaTable" border="1"></table>
</br><button type='button' onclick='()' >공사중 Cancel </button>
</br><button type='button' onclick='completeOrder()' >Order</button>
</div>

<div id="step7Page">
<h1 id="status"></h1>
<h1 id="orderNumber"></h1>
<h5 id="estimatedTime"></h5>
</br><button type='button' onclick='completeOrder()' > 공사중 place another order</button>
</div>

</body>
</html>