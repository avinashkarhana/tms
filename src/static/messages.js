//mark notification as read
function mrkrd(wq){
        var nfromcode= document.getElementById('notifromcode'+wq).innerHTML;
        var nfromtype=document.getElementById('notifromtype'+wq).innerHTML;
        var ntocode=document.getElementById('notitocode'+wq).innerHTML;
        var ntotype=document.getElementById('notitotype'+wq).innerHTML;
        var nmsg=document.getElementById('notimsg'+wq).innerHTML;
        var url="/rdmsg/?nfromcode="+nfromcode+"&nfromtype="+nfromtype+"&nmsg="+nmsg+"&ntocode="+ntocode+"&ntotype="+ntotype;
        var xhttp = new XMLHttpRequest();
        var rslt="";
        xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
        document.getElementById('rsoi').innerHTML=this.responseText;
        }
        };
        xhttp.open("GET",url , true);
        xhttp.send();
        console.log(document.getElementById('rsoi').innerHTML);
        if(document.getElementById('rsoi').innerHTML=="Done"){
                document.getElementById("ndiv"+wq).style.display="none";
        }
        else{}
}


//send message 
function sendmessage() 
{
  var msg = document.getElementById("message")
  var xhttp = new XMLHttpRequest();
  var tc= document.getElementById('from').value;
  document.getElementById('totype').innerHTML= tc.split('-')[0];
  document.getElementById('tocode').innerHTML= tc.split('-')[1];
  var totype=document.getElementById('totype').innerHTML;
  var tocode=document.getElementById('tocode').innerHTML;
  var parm = "msgs="+msg.value+"&tocode="+tocode+"&totype="+totype
  xhttp.onreadystatechange = function() 
  {
    if (this.readyState == 4 && this.status == 200) 
    {
      document.getElementById("alertformsg").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "/messages/?"+parm, true);
  xhttp.send();
  document.getElementById("message").value=""
}

//CHATBOX LOADER START        
function loadDoc(to)
{
  var url="/chat/?to="+to;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("chat").innerHTML =this.responseText;
    }
  };
  xhttp.open("GET",url , false);
  xhttp.send();
}
//CHATBOX LOADER END

//LOAD MESSAGES
function loadmsg(tocode,totype) {
  var url="/messages/?tocode="+tocode+"&totype="+totype;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("mpnlo").innerHTML =this.responseText;
    }
  };
  xhttp.open("GET",url , true);
  xhttp.send();
}
//LOAD MESSAGE END

//To LOAD
function rwq(tocode,totype){
  var url="/sndto/?tocode="+tocode+"&totype="+totype;
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("snto").innerHTML =this.responseText;
    }
  };
  xhttp.open("GET",url , true);
  xhttp.send();
}
rwq();
//to LOAD E
//INITAIL MESSAGE LOAD
function inicl()
{
  var url="/messages/?to=all";
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("mpnlo").innerHTML =this.responseText;
    }
  };
  xhttp.open("GET",url , true);
  xhttp.send();
}
//INITIAL MESSAGE LOAD END
var a=0
//REPEATED LOAD MESSAGE CALL
function repcall()
{
  var tc= document.getElementById('from').value;
  console.log("~~~~~~~~~~~~",tc);
  document.getElementById('totype').innerHTML= tc.split('-')[0];
  document.getElementById('tocode').innerHTML= tc.split('-')[1];
  var totype=document.getElementById('totype').innerHTML;
  var tocode=document.getElementById('tocode').innerHTML;
  console.log(tocode,totype)
  loadmsg(tocode,totype);
  if(a%7==0){rwq(tocode,totype);}
  a=a+1;
  console.log(a);
}
loadDoc('all');
inicl()
setInterval(repcall, 3000);