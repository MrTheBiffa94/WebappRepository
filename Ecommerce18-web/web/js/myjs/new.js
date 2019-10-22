/*Checkbox per la registrazione*/
function checkboxReg() {
    if (document.getElementById("myCheckbox").checked == true)
        document.getElementById("myReg").disabled = false;
    else
        document.getElementById("myReg").disabled = true;
}

function checkpassequal() {
    var a = document.getElementById("password");
    var b = document.getElementById("Cpassword");
    if (b.isEqualNode(a)) {
        window.alert("Password diverse");
    }

}

/*pulsante*/

function up(max) {
    document.getElementById("input").value = parseInt(document.getElementById("input").value) + 1;
    if (document.getElementById("input").value >= parseInt(max)) {
        document.getElementById("input").value = max;
    }
}

function down(min) {
    document.getElementById("input").value = parseInt(document.getElementById("input").value) - 1;
    if (document.getElementById("input").value <= parseInt(min)) {
        document.getElementById("input").value = min;
    }
}





