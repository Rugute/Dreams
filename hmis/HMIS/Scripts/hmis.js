
function validateEmpty(fld) {
    var error = "";

    if (fld.value.length == 0) {
        fld.style.background = 'Yellow';
        error = "The required field has not been filled in.\n"
    } else {
        fld.style.background = 'White';
    }
    return error;

    if (fld.value == "") {
        alert("Enter a name");
        fld.focus();
        return false;
    }
    if (!/^[a-zA-Z]*$/g.test(fld.value)) {
        alert("Invalid characters");
        fld.focus();
        return false;
    }
}

function CompareDates(txtRegDate,txtDOB) {
        var fdate = document.getElementById("txtRegDate");
        var edate = document.getElementById("txtDOB");
        var FromDate = fdate.value.split('/');
        var EndDate = edate.value.split('/');
        var val = 'false';

        if (parseInt(FromDate[2]) < parseInt(EndDate[2])) {
            val = 'true';
            return true;
        }
        else if (parseInt(FromDate[2]) == parseInt(EndDate[2])) {
            if (parseInt(FromDate[0]) < parseInt(EndDate[0])) {
                val = 'true';
                return true;
            }
            else if (parseInt(FromDate[0]) == parseInt(EndDate[0])) {
                if (parseInt(FromDate[1]) <= parseInt(EndDate[1])) {
                    val = 'true';
                    return true;
                    edate = "";
                }
            }
        }
        if (val == "false") {
            alert("Registration date must be less than Date of Birth");
            return false;
        }
    }

function findage(txtDOB) {
           // var PresentDay = new Date();
           // var dateOfBirth = (new Date(document.getElementById(txtDOB).value));
           // var months = (PresentDay.getMonth() - dateOfBirth.getMonth() +
           //(12 * (PresentDay.getFullYear() - dateOfBirth.getFullYear())));
    // document.getElementById(txtAge).value = Math.round(months / 12);

    var birthDay = document.getElementById("txtDOB");
    var now = new Date()
    var b_split = birthDay.value.split('/');
    if(b_split.length==3){
        var birthDate = new Date(b_split[2], b_split[1]*1-1, b_split


     [0]);
        var years = Math.floor((now.getTime() - birthDate.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
        //alert(years)
        document.getElementById("txtAge").value = years;
    }


        }
  
//padding client number

function pad(obj, length) {
    var text = obj.value;
    var str = '' + text;
    while (str.length < length) {
        str = '0' + str;
    }
      obj.value = str;
}
//,, 
function concat(lblIRDOINT,txtClientNo,txtRegDate) {
    var x = document.getElementById("txtClientNo").value;
    var y = document.getElementById("lblIRDOINT").innerHTML;
    var d = document.getElementById("txtRegDate").value;
    var yy = d.substring(10, 8);
    var label = document.getElementById("lblIRDOReference");
    var tx = x;
    var str = '' + tx;

    while (str.length < 10) {
        str = '0' + str;
    }
    tx.value = str;

    

    if (x.value != "" || x.value.length != 0) {
        //document.getElementById('<%=lblIRDOReference.ClientID%>').innerHTML = "IRDO" + '/' + y + '/' + x + '/' + yy;
        document.getElementById("txtIRDOReference").value = "IRDO" + '/' + y + '/' + str + '/' + yy;
        // document.getElementById("<%=hfIRDOReference.ClientID%>").value = "IRDO" + '/' + y + '/' + x + '/' + yy;
        //document.getElementById("txtIRDOReference").value = "xxxx";
        //document.getElementById("txtIRDOReference").value = y;
        document.getElementById("hfIRDOReference").value = tx.value;
        //var xx = x;
        //return x + y;
        label.innerHTML = "IRDO" + '/' + y + '/' + str + '/' + yy;
    }
    else {
        label.innerHTML = "";
        return false;
    }

}




//var y, x, d //define a global variable
//function updateVariables() {
//    var y = document.getElementById("txtDistrictCode").value;
//    var x = document.getElementById("txtClientNumber").value;
//    var d = document.getElementById("txtVisitDate").value; //update the global variable
//}

function concatVMMCNo(txtDistrictCode, txtClientNumber, txtVisitDate) {
    var y = document.getElementById("txtDistrictCode").value;
    var x = window.document.getElementById("txtClientnumber").value;
    var d = window.document.getElementById("txtVisitDate").value;
    var yy = d.substring(10, 8);
    var label = document.getElementById("lblIRDOReference");
    var text = window.document.getElementById("txtVMMCNo").value;
    var tx = x;
    var str = '' + tx;

    while (str.length < 10) {
        str = '0' + str;
    }
    tx.value = str;



    if (x.value != "" || x.value.length != 0) {
        //document.getElementById('<%=lblIRDOReference.ClientID%>').innerHTML = "IRDO" + '/' + y + '/' + x + '/' + yy;
        document.getElementById("txtVMMCNo").value = y + '/' + "TYP" + '/' + str + '/' + yy;
        // document.getElementById("<%=hfIRDOReference.ClientID%>").value = "IRDO" + '/' + y + '/' + x + '/' + yy;
        //document.getElementById("txtIRDOReference").value = "xxxx";
        //document.getElementById("txtIRDOReference").value = y;
        //document.getElementById("hfIRDOReference").value = tx.value;
        //var xx = x;
        //return x + y;
        
       label.innerHTML = y + '/' + "TYP" + '/' + str + '/' + yy;
    }
    else {
        label.innerHTML = "";
        return false;
    }

}

//function CompareSelectedValues(ddC1_Health, ddC2_Counseled, ddC2_Counseled) {
//    var health = document.getElementById("ddC1_Health");
//    var counseled = document.getElementById("ddC2_Counseled");
//    var consent = document.getElementById("ddC3_Consent");
//    if (health.selectedIndex != 1 || counseled.selectedIndex != 1 || consent.selectedIndex != 1) {
//        document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'visible';
//    } else {
//        document.getElementById('<%=pnl_MCProcedure.ClientID%>').style.visibility = 'hidden';
//    }
//}pnl_MCProcedure

////$(document).ready(function () {
////    //We are binding onchange event using jQuery built-in change event
////    $('#ddC1_Health').change(function () {
////        //get selected value and check if subject is selected else show alert box
////        var SelectedValue = $("#ddC1_Health").val();
////        if (SelectedValue == 1) {
////           // $('#pnl_MCProcedures').Style.Add("display", "none");
////            document.getElementById("pnl_MCProcedures").style.display = 'None';
////        } else {
////            $('#<%=pnl_MCProcedures.ClientID %>').hide();
////        }
////    });
////});
    window.onload = function () {
        var scrollY = parseInt('<%=Request.Form("scrollY")%>');             
        if (!isNaN(scrollY)) {
            window.scrollTo(0, scrollY);
        }
    };
    window.onscroll = function () {
        var scrollY = document.body.scrollTop;
        if (scrollY == 0) {
            if (window.pageYOffset) {
                scrollY = window.pageYOffset;
            }
            else {
                scrollY = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
            }
        }
        if (scrollY > 0) {
            var input = document.getElementById("scrollY");
            if (input == null) {
                input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("id", "scrollY");
                input.setAttribute("name", "scrollY");
                document.forms[0].appendChild(input);
            }
            input.value = scrollY;
        }
    };

    function concatVMMCStartTime(txD2_StartTime, txD2_StartTime2) {
        var y1 = document.getElementById("txD2_StartTime").value;
        var x1 = window.document.getElementById("txD2_StartTime2").value;
        var labelStartTime = document.getElementById("lblD2_StartTime");
        var textStartTime = document.getElementById("txtD2_StartTime");

        if (x1.value != "" || x1.value.length != 0 || y1.value != "" || y1.value.length != 0) {
            textStartTime.value = y1 + ':' + x1;
        }
        else {
            textStartTime.value = "";
            return false;
        }

    }

    function concatVMMCEndTime(txD3_EndTime, txD3_EndTime2) {
        var y2 = document.getElementById("txD3_EndTime").value;
        var x2 = window.document.getElementById("txD3_EndTime2").value;
        var labelEndTime = document.getElementById("lblD3_EndTime");
        var textEndTime = document.getElementById("txtD3_EndTime");
        if (x2.value != "" || y2.value != "") {
            textEndTime.value = y2 + ':' + x2;
        }
        else {
            textEndTime.value = "";
            return false;
        }
        
    }

    function ToggleVisible(ddl) {
        var div = document.getElementById('optional');
        var value = ddl.options[ddl.selectedIndex].value;
        if (value == 1) {
            pnl_MCProcedure.style.display = "none";
        }
        else {
            pnl_MCProcedure.style.display = "block";
        }
    }
  

    function IsString(strString)
        //  check for valid numeric strings	
    {
        var strValidChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-/0123456789";
        var strChar;
        var blnResult = true;
        if (strString.length == 0) return false;
        //test strString consists of valid characters listed above
        for (i = 0; i < strString.length && blnResult == true; i++) {
            strChar = strString.charAt(i);
            if (strValidChars.indexOf(strChar) == -1) {
                blnResult = false;
            }
        }
        return blnResult;
    }


    function MC_Procedure() {
        var selectbox1 = document.getElementById('ddC3_Consent');
        var selectedOption = selectbox1.options[selectbox1.selectedIndex];
        var selectedIndex = selectbox1.selectedIndex;
        var selectedOption = selectbox1.options[selectedIndex];

        var selectbox2 = document.getElementById('ddC1_Health');
        var selectedOption1 = selectbox2.options[selectbox2.selectedIndex];
        var selectedIndex = selectbox2.selectedIndex;
        var selectedOption1 = selectbox2.options[selectedIndex];

        var selectbox3 = document.getElementById('ddC2_Counseled');
        var selectedOption2 = selectbox3.options[selectbox3.selectedIndex];
        var selectedIndex = selectbox3.selectedIndex;
        var selectedOption2 = selectbox3.options[selectedIndex];
        var $children = $('.divMC_Procedure').children();
        if (selectedOption.text == "NO" || selectedOption1.text == "NO" || selectedOption2.text == "NO") {
    $('#pnl_MCProcedure :input').attr('disabled', true);
       
           
        }
        else {
            $('#pnl_MCProcedure :input').removeAttr('disabled');

        }  
    }

   