/* validation_contact */

"use strict";

//function tyAlert() {
//	alert("Thank you for your interest. I will contact you soon.");
//};
		
var $ = function(id) {
    return document.getElementById(id);
};

var contactUs = function() {
	var firstName1 = $("firstName").value;
	var lastName1 = $("lastName").value;
	var emailAddress1 = $("email").value;
	var address1 = $("address").value;
	var city1 = $("city").value;
	var state1 = $("state").value;
	var zip1 = $("zip").value;
    var isValid = true;

    // validate the entries
    	
    if (firstName1 == "") {
    	$("firstName").nextElementSibling.firstChild.nodeValue = 
    		"First name is required.";
    	isValid = false;
    } else {
    	$("firstName").nextElementSibling.firstChild.nodeValue = "";
	}
	
	if (lastName1 == "") {
    	$("lastName").nextElementSibling.firstChild.nodeValue = 
    		"Last name is required.";
    	isValid = false;
    } else {
    	$("lastName").nextElementSibling.firstChild.nodeValue = "";
	}
	
	if (emailAddress1 == "") {
    	$("email").nextElementSibling.firstChild.nodeValue 
    		= "Email address required.";
          isValid = false;
    } else {
    	$("email").nextElementSibling.firstChild.nodeValue = "";
    }
	
	if (address1 == "") {
    	$("address").nextElementSibling.firstChild.nodeValue 
    		= "Address required.";
          isValid = false;
    } else {
    	$("address").nextElementSibling.firstChild.nodeValue = "";
    }
	
	if (city1 == "") {
    	$("city").nextElementSibling.firstChild.nodeValue 
    		= "City required.";
          isValid = false;
    } else {
    	$("city").nextElementSibling.firstChild.nodeValue = "";
    }
	
	if (state1 == "") {
    	$("state").nextElementSibling.firstChild.nodeValue 
    		= "State required.";
          isValid = false;
    } else {
    	$("state").nextElementSibling.firstChild.nodeValue = "";
    }

	if (zip1 == "") {
    	$("zip").nextElementSibling.firstChild.nodeValue 
    		= "Zip code required.";
          isValid = false;
    } else {
    	$("zip").nextElementSibling.firstChild.nodeValue = "";
    }
	
    // submit the form if all entries are valid
    if (isValid) {
        $("contactus").submit();
		//return tyAlert();
    }
};

window.onload = function() {
    $("contact_us").onclick = contactUs;
    /*$("firstName").focus();*/
};
