var sendOrders = {
    DeliveryStreetAddress: "",
    UnitNum: "",
    DeliveryCity: "",
    DeliveryProvince: "",
    DeliveryPostCode: "",
    PizzaType: [],
    Size: [],
    DoughType: [],
    SauceType: [],
    CheeseType: [],
    Toppings: []
};


function chooseAddress(row) {
    sendOrders.DeliveryStreetAddress = document.getElementById('DeliveryStreetAddress_' + row).innerHTML;
    sendOrders.UnitNum = document.getElementById('UnitNum_' + row).innerHTML;
    sendOrders.DeliveryCity = document.getElementById('DeliveryCity_' + row).innerHTML;
    sendOrders.DeliveryProvince = document.getElementById('DeliveryProvince_' + row).innerHTML;
    sendOrders.DeliveryPostCode = document.getElementById('DeliveryPostCode_' + row).innerHTML;


    $("#addressList").hide();
	$("#addressListNew").hide();
    $("#choosePizza").show();


}

function choosePizza() {
    var pizzaType = document.getElementById("pizzaType").value;
    var size = document.getElementById("size").value;
    var doughType = document.getElementById("doughType").value;
    var sauceType = document.getElementById("sauceType").value;
    var cheeseType = document.getElementById("cheeseType").value;

    sendOrders.PizzaType.push(pizzaType);
    sendOrders.Size.push(size);
    sendOrders.DoughType.push(doughType);
    sendOrders.SauceType.push(sauceType);
    sendOrders.CheeseType.push(cheeseType);

    $("#choosePizza").hide();
    $("#chooseTopping").show();

}

function chooseTopping() {

    var toppings = "";
    toppings += (document.getElementById("GreenOlives").checked == true) ? "GreenOlives, " : "";
    toppings += (document.getElementById("Zucchini").checked == true) ? "Zucchini, " : "";
    toppings += (document.getElementById("Onions").checked == true) ? "Onions, " : "";
    toppings += (document.getElementById("Garlic").checked == true) ? "Garlic, " : "";
    toppings += (document.getElementById("Mushrooms").checked == true) ? "Mushrooms, " : "";
    toppings += (document.getElementById("Pineapple").checked == true) ? "Pineapple, " : "";
    toppings += (document.getElementById("Broccoli").checked == true) ? "Broccoli, " : "";
    toppings += (document.getElementById("Tomatoes").checked == true) ? "Tomatoes, " : "";
    toppings += (document.getElementById("GreenPeppers").checked == true) ? "GreenPeppers, " : "";
    toppings += (document.getElementById("Spinach").checked == true) ? "Spinach, " : "";

    var n = toppings.length; //get rid of , at the end of the text

    toppings = toppings.substr(0, n - 2);
    sendOrders.Toppings.push(toppings);

    $("#chooseTopping").hide();
    $("#step5Page").show();

    showCurrentOrder();

}

function showCurrentOrder() {

    var lastIndex = sendOrders.PizzaType.length - 1;
    $("#pizzaTable").html("<tr><th>Pizza Name</th><th>Size</th><th>Dough Type</th><th>Sauce Type</th><th>Cheese Type</th><th>Topping</th></tr>");

    $("#pizzaTable").append(
        "<tr><td>" + sendOrders.PizzaType[lastIndex] +
        "</td><td>" + sendOrders.Size[lastIndex] +
        "</td><td>" + sendOrders.DoughType[lastIndex] +
        "</td><td>" + sendOrders.SauceType[lastIndex] +
        "</td><td>" + sendOrders.CheeseType[lastIndex] +
        "</td><td>" + sendOrders.Toppings[lastIndex] + "</td></tr>"
    );


}

function addPizza() {
    $("#pizzaTable").html("");
    $("#step5Page").hide();
    $("#choosePizza").show();

}

function discardCurrentAndAddPizza() {
    //discard current pizza
    sendOrders.PizzaType.pop();
    sendOrders.Size.pop();
    sendOrders.DoughType.pop();
    sendOrders.SauceType.pop();
    sendOrders.CheeseType.pop();
    sendOrders.Toppings.pop();

    $("#step5Page").hide();
    $("#choosePizza").show();
}

function completNotIncludeCurrent() {
    //discard current pizza
    sendOrders.PizzaType.pop();
    sendOrders.Size.pop();
    sendOrders.DoughType.pop();
    sendOrders.SauceType.pop();
    sendOrders.CheeseType.pop();
    sendOrders.Toppings.pop();

    $("#step5Page").hide();
    $("#step6Page").show();

    $("#finalAddress").html("<tr><th>Street Address</th><th>Unit Number</th><th>City</th><th>Province</th><th>PostCode</th></tr>");
    $("#finalAddress").append(
        "<tr><td>" + sendOrders.DeliveryStreetAddress +
        "</td><td>" + sendOrders.UnitNum +
        "</td><td>" + sendOrders.DeliveryCity +
        "</td><td>" + sendOrders.DeliveryProvince +
        "</td><td>" + sendOrders.DeliveryPostCode +
        "</td></tr>"
    );
    var i = 0;
    $("#finalPizzaTable").html("<tr><th></th><th>Pizza Name</th><th>Size</th><th>Dough Type</th><th>Sauce Type</th><th>Cheese Type</th><th>Topping</th></tr>");
    while (sendOrders.PizzaType[i]) {
        $("#finalPizzaTable").append(
            "<tr><td>" + (i + 1) + "</td><td>" + sendOrders.PizzaType[i] +
            "</td><td>" + sendOrders.Size[i] +
            "</td><td>" + sendOrders.DoughType[i] +
            "</td><td>" + sendOrders.SauceType[i] +
            "</td><td>" + sendOrders.CheeseType[i] +
            "</td><td>" + sendOrders.Toppings[i] + "</td></tr>"
        );
        i++;
    }


}

function completeIncludeCurrent() {
    $("#step5Page").hide();
    $("#step6Page").show();

    $("#finalAddress").html("<tr><th>Street Address</th><th>Unit Number</th><th>City</th><th>Province</th><th>PostCode</th></tr>");
    $("#finalAddress").append(
        "<tr><td>" + sendOrders.DeliveryStreetAddress +
        "</td><td>" + sendOrders.UnitNum +
        "</td><td>" + sendOrders.DeliveryCity +
        "</td><td>" + sendOrders.DeliveryProvince +
        "</td><td>" + sendOrders.DeliveryPostCode +
        "</td></tr>"
    );
    var i = 0;
    $("#finalPizzaTable").html("<tr><th></th><th>Pizza Name</th><th>Size</th><th>Dough Type</th><th>Sauce Type</th><th>Cheese Type</th><th>Topping</th></tr>");
    while (sendOrders.PizzaType[i]) {
        $("#finalPizzaTable").append(
            "<tr><td>" + (i + 1) + "</td><td>" + sendOrders.PizzaType[i] +
            "</td><td>" + sendOrders.Size[i] +
            "</td><td>" + sendOrders.DoughType[i] +
            "</td><td>" + sendOrders.SauceType[i] +
            "</td><td>" + sendOrders.CheeseType[i] +
            "</td><td>" + sendOrders.Toppings[i] + "</td></tr>"
        );
        i++;
    }
}

function completeOrder() {
    $("#step6Page").hide();
    $("#step7Page").show();

    $.post("orderAjax.php", sendOrders, order);
}
var order = function(response) {
    var time = new Date();
    var estimatedTime = new Date(time.setMinutes(time.getMinutes() + 30));
    /* converted estimatedTime to string type, then used substr function to get rid of the part that we don't need */
    var convertedEsTime = (estimatedTime.toString()).substr(0, 25);
    // alert(convertedEsTime);
    if (response.status == "succeed") {
        $("#status").html("Thank you!");
        $("#orderNumber").html("order number: " + response.orderId);
        document.getElementById("estimatedTime").innerHTML = "Estimated delivery time: " + convertedEsTime;

    } else if (response.status == "failed") {
        $("#status").html("Erro occured");
    }

    
    console.log(response);

}