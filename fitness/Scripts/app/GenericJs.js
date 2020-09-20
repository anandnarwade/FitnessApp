// function for to get month name from month number
function getMonthname(month) {
    var s;
    switch (month) {
        case 1: {
            s = "Jan";
            break;
        }
        case 2: {
            s = "Feb";
            break;
        }
        case 3: {
            s = "Mar";
            break;
        }
        case 4: {
            s = "Apr";
            break;
        }
        case 5: {
            s = "May";
            break;

        }
        case 6: {
            s = "Jun";
            break;
        }
        case 7: {
            s = "Jul";
            break;
        }
        case 8: {
            s = "Aug";
            break;
        }
        case 9: {
            s = "Sep";
            break;
        }
        case 10: {
            s = "Oct";
            break;
        }
        case 11: {
            s = "Nov";
            break;
        }
        case 12: {
            s = "Dec";
            break;
        }
    }
    return s;
}

// function for to accepts only numbers
$(".only-numeric").bind("keypress", function (e) {

    var keyCode = e.which ? e.which : e.keyCode

    if (!(keyCode >= 48 && keyCode <= 57)) {

        $(".error").css("display", "inline");

        return false;

    } else {

        $(".error").css("display", "none");
    }

});

$("numbers").keydown(function (event) {
    // Allow only backspace and delete
    if (event.keyCode == 46 || event.keyCode == 8) {
        // let it happen, don't do anything
    }
    else {
        // Ensure that it is a number and stop the keypress
        if (event.keyCode < 48 || event.keyCode > 57) {
            event.preventDefault();
        }
    }
});




// function for validate email
function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email)) {
        return false;
    } else {
        return true;
    }
}
// It is applicable when Date Format in ('yyyy-MM-dd', 'dd-MMM-yyyy', 'dd-MMM-yy') but input date format should be string
function GetDtInddMMYYY(data) {
    try {
        var fullDate = new Date(data);
        var twoDigitMonth = fullDate.getMonth();
        var twoDigitDate = fullDate.getDate() + ""; if (twoDigitDate.length == 1) twoDigitDate = "0" + twoDigitDate;
        var mnth = (parseInt(twoDigitMonth) + 1) + ""; if (mnth.length == 1) mnth = "0" + mnth;
        var currentDate = twoDigitDate + "-" + mnth + "-" + fullDate.getFullYear();
        return currentDate;

    } catch (e) {
        return e;

    }
}

// function for Long date Format
function GetLongDate(data) {
    try {
        var s = new Date(data);
        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var day = (weekday[s.getDay()]) + ", ";
        var month = (months[s.getMonth()]) + " ";
        var dt = s.getDate() + ",";
        var year = s.getFullYear();
        var result = day + " " + month + " " + dt + " " + year;
        return result;
    } catch (e) {
        return e;

    }
}


// function for to download file without open
function download(path) {
    var file_path = path;
    var a = document.createElement('A');
    a.href = file_path;
    a.download = file_path.substr(file_path.lastIndexOf('/') + 1);
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
}


function getQryString() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

