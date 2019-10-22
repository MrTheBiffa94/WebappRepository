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


/*Pulsante per tornare in cima alla pagina*/
$(document).ready(function(){
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

    $('#back-to-top').tooltip('show');

});


