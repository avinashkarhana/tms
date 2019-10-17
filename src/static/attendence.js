function tcheckattend(){
    
    
    try{
        var arq = document.getElementById('arq').value;
        var aof = document.getElementById('aof').value;
        var xq=0;
    }
    catch{
        var xq=1;
    }
    if (xq==1)
    {
        var aof = document.getElementById('tlst').options[document.getElementById('tlst').selectedIndex].value;
        var arq = 'T';
    }
    var url="/attendence/?aof="+aof+"&arq="+arq;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("result").innerHTML =this.responseText;
      }
    };
    xhttp.open("GET",url , true);
    xhttp.send();
    if (document.getElementById('result').style.display=='none'){
        document.getElementById('result').style.display='block';
        document.getElementById('atmark').style.display='none';
    }
 }

 function datesel(){
    var sd=document.getElementById('sd').value;
    var ed=document.getElementById('ed').value;
    if ( sd=='none' || sd=="" || ed=='none' || ed=='')
    {
        alert("Select Start and End dates! ");
        return(1);
    }
    if (Date.parse(sd)>Date.parse(ed))
    {
        var pal=sd;
        sd=ed;
        ed=pal
    }

    var attendence_data= document.getElementById('atnd').value
    attendence_data=JSON.parse(attendence_data)
    var i=0;
    var z=1;

    try{var name=document.getElementById('tlst').options[document.getElementById('tlst').selectedIndex].innerHTML}
    catch{var name="None";}

    var node1 = document.createElement("br");
    document.getElementById("result").appendChild(node1);
    var node2 = document.createElement("br");
    document.getElementById("result").appendChild(node2);

    var node5 = document.createElement("div");
    node5.setAttribute("id", "result1");
    document.getElementById("result").appendChild(node5);

    var node = document.createElement("table");
    node.classList.add('pure-table-striped');
    node.setAttribute("id", "attendtable");
    node.style.margin = "30px";
    var rw = document.createElement("tr");
    var cell1 = document.createElement("th");
    cell1.innerHTML="Dates";
    var cell2 = document.createElement("th");
    cell2.innerHTML="Status";
    rw.appendChild(cell1);
    rw.appendChild(cell2);
    node.appendChild(rw);
    for (i=0;i<attendence_data.length;i++){ 
        if ( Date.parse(attendence_data[i].date)>=Date.parse(sd) && Date.parse(attendence_data[i].date)<=Date.parse(ed) ) 
        {
            var row = node.insertRow(z); 
            var c1  = row.insertCell(0);    
            var c2  = row.insertCell(1);  
            c1.innerHTML = attendence_data[i].date;
            c2.innerHTML = attendence_data[i].status;        
            z=z+1;
        } 
    }
    var node3 = document.createElement("p");
    node3.innerHTML="Attendence data of "+name+" from "+sd+" to "+ed;
    node3.setAttribute("id","node3");
    try{document.getElementById("result1").replaceChild(node3,document.getElementById('node3'));}
    catch{document.getElementById("result1").appendChild(node3);}
    try{document.getElementById("result1").replaceChild(node,document.getElementById('attendtable'));}
    catch{document.getElementById("result1").appendChild(node);}
    var xa = document.getElementById("attendtable").rows.length;
    xa=xa-1;
    var attendinp = document.createElement("p");
    attendinp.innerHTML="Total number attendence in given time period: "+xa;
    attendinp.setAttribute("id","attendinp");
    var totalattend = document.createElement("p");
    totalattend.setAttribute("id","totalattend");
    totalattend.innerHTML="Total number attendence Till Date: "+attendence_data.length;
    try{document.getElementById("result1").replaceChild(attendinp,document.getElementById('attendinp'));}
    catch{document.getElementById("result1").appendChild(attendinp);}
    try{document.getElementById("result1").replaceChild(totalattend,document.getElementById('totalattend'));}
    catch{document.getElementById("result1").appendChild(totalattend);}
}

 function markattend()
 {
    if (document.getElementById('result').style.display=='none'){
        document.getElementById('result').style.display='block';
        document.getElementById('atmark').style.display='none';
    }
    else
    {
        document.getElementById('result').style.display='none';
        document.getElementById('atmark').style.display='block';
        al();
    }
 }