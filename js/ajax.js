$(document).ready( function(){

	// hide everything execpt for the email form
	$("#choosePizza").hide();
	$("#chooseTopping").hide();
	$("#step5Page").hide();
	$("#step6Page").hide();
	$("#step7Page").hide();
	$("#saveUserInfo").hide();
	// $("#addAddress").hide();
	$("#btnAddAddress").hide();
	$("#newAddressForm").hide();


	// LOG IN **************************************
	//**********************************************
	// When the user clicks Login button,
	// load data from the server using a HTTP POST request
	$("#emailForm").submit( function(event){
		
		$.post("getUserInfo.php", $(this).serialize(),
		displayUserAddress);
		event.preventDefault();	 

	});

	// function to run if the Log-in request succeeds
	var displayUserAddress = function(response){

		$("#plzLogIn").hide();
		$("#btnLogin").hide();
		// $("#btnAddAddress").show();
		// console.log("response received");
		// console.log(response);

		if (response.status == "No email found") {
			$("#div1").html("No previous orders to list. Please input your delivery address.");

			$("#saveUserInfo").show();

		} else{

			// get the user email, and display it on the top menu bar
			var userEmail = response.customers[0].Email;
			$("#menuLogin").text("Hello " + userEmail + "!");

			if ( (response.status == "OK") && ($("#div1").html() == "Please log-in first") ){
           		$("#addressList").html("<table id=\"table1\" border=\"1\"></table>");
			}
			   
			$("#table1").html("<tr><th>Street Address</th><th>Unit Number</th><th>City</th><th>Province</th><th>PostCode</th><th>Select</th></tr>");

			   for (r in response.customers){
				
				$("#table1").append(

					"<tr><td id='DeliveryStreetAddress_"+r+"'>" + response.customers[r].DeliveryStreetAddress
				  + "</td><td id='UnitNum_"+r+"'>" + response.customers[r].DeliveryUnitNum
				  + "</td><td id='DeliveryCity_"+r+"'>" + response.customers[r].DeliveryCity
				  + "</td><td id='DeliveryProvince_"+r+"'>" + response.customers[r].DeliveryProvince
				  + "</td><td id='DeliveryPostCode_"+r+"'>" + response.customers[r].DeliveryPostCode
				  + "</td><td><button id='submitAddress' type='button' onclick='chooseAddress("+ r +")'>Next</button></td></tr>"
			  );

			$("#btnAddAddress").show();

			}
		}

	} //end displayUserAddress()


	// SAVE NEW USER INFORMATION********************
	//**********************************************
	// When the user clicks Save button,
	// load data from the server using a HTTP POST request
	$("#saveUserInfo").submit( function(event){

		var email = $("#email").val();
		var fullName = $("#fullName").val();
		var phoneNum = $("#phoneNum").val();
		var unitNum = $("#unitNum").val();
		var street = $("#street").val();
		var city = $("#city").val();
		var province = $("#province").val();
		var postalCode = $("#postalCode").val();
		
		var userInfo = {
			"email": email,
			"fullName": fullName,
			"phoneNum": phoneNum,
			"unitNum": unitNum,
			"street": street,
			"city": city,
			"province": province,
			"postalCode": postalCode
		}

		$.post("saveUserInfo.php", userInfo, saveUserInfo);
		event.preventDefault();	 

	});

	// function to run if the 'save' request succeeds
	var saveUserInfo = function(response){

		if (response.status == "NewOK") {
			
			$("#plzLogIn").hide();
			$("#btnLogin").hide();
			$("#saveUserInfo").hide();

			var userEmail = response.customers[0].Email;
			$("#menuLogin").text("Hello " + userEmail + "!");

			$("#div1").html("<table id=\"table1\" border=\"1\"></table>");
				
			$("#table1").html("<tr><th>Street Address</th><th>Unit Number</th><th>City</th><th>Province</th><th>PostCode</th><th>Select</th></tr>");

				for (r in response.customers){
				
					$("#table1").append(

						"<tr><td id='DeliveryStreetAddress_"+r+"'>" + response.customers[r].StreetAddress
						+ "</td><td id='UnitNum_"+r+"'>" + response.customers[r].UnitNum
						+ "</td><td id='DeliveryCity_"+r+"'>" + response.customers[r].City
						+ "</td><td id='DeliveryProvince_"+r+"'>" + response.customers[r].Province
						+ "</td><td id='DeliveryPostCode_"+r+"'>" + response.customers[r].PostCode
						+ "</td><td><button id='submitAddress' type='button' onclick='chooseAddress("+ r +")'>Next</button></td></tr>"
					);

				} // end FOR loop

		}

	}


	// ADD NEW ADDRESS *****************************
	//**********************************************
	$("#btnAddAddress").click(function() {
		$("#newAddressForm").show();
	});

	// When the user clicks 'save a new address' button,
	// load data from the server using a HTTP POST request
	$("#newAddressForm").submit( function(event){
		
		var emailNew = $("#email").val();
		var unitNumNew = $("#unitNumNew").val();
		var streetNew = $("#streetNew").val();
		var cityNew = $("#cityNew").val();
		var provinceNew = $("#provinceNew").val();
		var postalCodeNew = $("#postalCodeNew").val();
		
		var userInfoNew = {
			"emailNew": emailNew,
			"unitNumNew": unitNumNew,
			"streetNew": streetNew,
			"cityNew": cityNew,
			"provinceNew": provinceNew,
			"postalCodeNew": postalCodeNew
		}

		$.post("addNewAddress.php", userInfoNew, displayNewAddress);
		event.preventDefault();	 

	});

	

	var displayNewAddress = function(response){

		if (response.status == "NewAddressOK") {
			
			console.log("ADD NEW success");
			$("#plzLogIn").hide();
			$("#btnLogin").hide();
			$("#saveUserInfo").hide();
			$("#btnAddAddress").hide();
			$("#newAddressForm").hide();
			$("#div1").hide();
			$("#addressList").hide();

			$("#addressListNew").html("<table id=\"tableNew\" border=\"1\"></table>");
				
			$("#tableNew").html("<tr><th>Street Address</th><th>Unit Number</th><th>City</th><th>Province</th><th>PostCode</th><th>Select</th></tr>");

			for (r in response.newAddress){
				$("#tableNew").append(

					"<tr><td id='DeliveryStreetAddress_"+r+"'>" + response.newAddress[r].DeliveryStreetAddress
					+ "</td><td id='UnitNum_"+r+"'>" + response.newAddress[r].DeliveryUnitNum
					+ "</td><td id='DeliveryCity_"+r+"'>" + response.newAddress[r].DeliveryCity
					+ "</td><td id='DeliveryProvince_"+r+"'>" + response.newAddress[r].DeliveryProvince
					+ "</td><td id='DeliveryPostCode_"+r+"'>" + response.newAddress[r].DeliveryPostCode
					+ "</td><td><button id='submitAddress' type='button' onclick='chooseAddress("+ r +")'>Next</button></td></tr>"
				);
			}

	
		}
	}




	$.get("getUserInfo.php", displayUserAddress);

});