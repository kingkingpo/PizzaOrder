$(document).ready( function(){

	// $("#orderForm").submit(function(event){
	// 	var abort = false;
	// 	$("div.error").remove();
		
	// 	// client-side validation
	// 	$(':input[required]').each(function(){
	// 		if ($(this).val() === ''){
	// 			$(this).after('<div class="error">This is a required field </div>');
	// 			abort = true;
	// 		}
	// 	}); //go through each 'required' value

	// 	if(abort) {
	// 		// if the input field is empty, don't call Ajax funciton
	// 		return false;
	// 	} else { 
	// 		$.post("getUserInfo.php", $(this).serialize(), displayUserAddress);
	// 		console.log("call Ajax");
	// 		event.preventDefault();	 
	// 	}

	// }) //on-submit
	
	// hide everything execpt for email form
	$("#choosePizza").hide();
	$("#chooseTopping").hide();
	$("#step5Page").hide();
	$("#step6Page").hide();
	$("#step7Page").hide();
	$("#saveUserInfo").hide();

	$("#emailForm").submit( function(event){
		
		$.post("getUserInfo.php", $(this).serialize(),
		displayUserAddress);
		console.log("wow");
		event.preventDefault();	 

	});

	var displayUserAddress = function(response){

		$("#plzLogIn").hide();
		$("#btnLogin").hide();
		console.log("response received");
		console.log(response);

		if (response.status == "No email found") {
			$("#div1").html("No previous orders to list. Please input your delivery address.");

			$("#saveUserInfo").show();

		} else{

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

			}
		}

	} //end displayUserAddress()
	

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

		$.post("saveUserInfo.php", userInfo,
		saveUserInfo);
		event.preventDefault();	 

	});

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

	$.get("getUserInfo.php", displayUserAddress);

});