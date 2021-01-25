//Java script code for validation of input fields

function validation() {
	// variable that will be used for the validation of the calendar
	var yr = document.getElementById("idyear").value;
	var mnth = document.getElementById("idmonth").value;
	var day = document.getElementById("idday").value;
	var validate = true;
	var errorMess = "";
	// check if the year text box is empty
	if (yr == "") {
		errorMess = errorMess
				+ "*Empty field for year please enter a 4 digit Year \n";
		validate = false;
	} else {
		// validation for the input field year
		if (yr.length >= 5 || yr.length < 4 || isNaN(yr)) {
			errorMess = errorMess + "*Year must be 4 Digit Number \n";
			document.getElementById("idyear").style.border = "1px solid red";
			validate = false;
		} else if (yr <= 0 || yr < 999) {
			errorMess = errorMess
					+ "*Invalid year, Please Enter a correct input. Ex. 1997 \n";
			document.getElementById("idyear").style.border = "1px solid red";
			validate = false;
		} else {
			document.getElementById("idyear").style.border = "1px solid gray";
		}
	}
	// check if the month text box is empty
	if (mnth == "") {
		errorMess = errorMess + "*Empty field for month \n";
		validate = false;
	} else {
		// validation for the input field month
		if (mnth >= 13 || mnth < 1 || isNaN(mnth)) {
			errorMess = errorMess + "*Month must be at the range of 1 - 12\n";
			document.getElementById("idmonth").style.border = "1px solid red";
			validate = false;
		}
	}
	// check if the day text box is empty
	if (day == "") {
		errorMess = errorMess + "*Empty field for days \n";
		validate = false;
	} else {
		// validation for the day if the year is leap year it will set the
		// maximum day for February is 29
		if (isleapyear(yr, mnth) && day > 29 && mnth == 2 || isNaN(day)) {
			errorMess = errorMess
					+ "*The Given Year is a leap year the maximum day for February is 29\n";
			document.getElementById("idday").style.border = "1px solid red";
			validate = false;
		}
		// validation for the day if the year is not leap year it will set the
		// maximum day for February is 28
		if (!isleapyear(yr, mnth) && day > 28 && mnth == 2 || isNaN(day)) {
			errorMess = errorMess
					+ "*The Given Year is not a leap year the maximum day for February is 28\n";
			document.getElementById("idday").style.border = "1px solid red";
			validate = false;
		}
		// validation for the day if the month has 31 days it will show an error
		if (isthirtyone(mnth) && day > 31 || isNaN(day)) {
			errorMess = errorMess + "*The Maximum day is 31\n";
			document.getElementById("idday").style.border = "1px solid red";
			;
			validate = false;
		}
		// validation for the day if the month has 30 days it will show an error
		if (isthirty(mnth) && day > 30 || isNaN(day)) {
			errorMess = errorMess + "*The Maximum day is 30\n";
			document.getElementById("idday").style.border = "1px solid red";
			validate = false;
		}

	}
	if (errorMess != "") {
		alert(errorMess);
	}

	return validate;
}
// function to check if the year is a leap year
function isleapyear(yr, mnth) {
	if ((yr % 4 == 0) && (yr % 100 != 0) || (yr % 400 == 0) && (mnth == 2)) {
		return true;
	} else {
		return false;
	}
}
// function that will check if the months with 31 days is selected
function isthirtyone(mnth) {
	if (mnth == 1 || mnth == 3 || mnth == 5 || mnth == 7 || mnth == 8
			|| mnth == 10 || mnth == 12) {
		return true;
	}
}
// function that will check if the months with 30 days is selected
function isthirty(mnth) {
	if (mnth == 4 || mnth == 6 || mnth == 9 || mnth == 11) {
		return true;
	}
}