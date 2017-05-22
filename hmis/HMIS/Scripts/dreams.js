
function findage(txtDOB1) {

    var birthDay = document.getElementById("txtDOB1");
    var now = new Date()
    var b_split = birthDay.value.split('/');
    if (b_split.length == 3) {
        var birthDate = new Date(b_split[2], b_split[1] * 1 - 1, b_split


     [0]);
        var years = Math.floor((now.getTime() - birthDate.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
        //alert(years)
        document.getElementById("txtAge").value = years;
    }


}