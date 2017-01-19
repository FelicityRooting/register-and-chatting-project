function startchating() {
    var username = document.getElementById('username');
    var password = document.getElementById('password');
    if (username.value == '' || password.value == '') {
        alert('Please login to continue.');
        return false;
    }

    var xmlhttp;
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else { // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("POST", "chat?username=" + username.value + "&password=" + password.value, true);

    document.getElementById("loading-icon").innerHTML = '<img src="loader.gif" border="0" alt="Loading, please wait..." />';
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText.indexOf('Incorrect') !== -1) {
                document.getElementById("loading-icon").innerHTML = "<h4 style='color:red'>" + xmlhttp.responseText + "<h4>";
            } else {
                document.getElementById("result-data").innerHTML = '<h1>' + xmlhttp.responseText + '</h1>';
            }
        }
    }
    xmlhttp.send(null);

}

function addText() {
    var username = document.getElementById('u').value;
    var message = document.getElementById('h').value;
    olist = document.getElementById('list'); 
    op = document.createElement('p'); 
    op.innerHTML = username + "- <g>" + message + "</g>";
    ocontent = document.getElementById('content');   
    ocontent.appendChild(op);             //Add new line on click
    olist.scrollTop = olist.scrollHeight; //Adjust Height 
    document.getElementById('h').value = '';//textarea will be blank
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("POST", "chatstore?username=" + username + "&message=" + message, true);

    xmlhttp.onreadystatechange = function() {//xmlHttp.onreadystatechange指向了一个函数，这个函数是在xmlHttpRequest.readyState发生改变的时候触发
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)//描述一种"已加载"状态；此时，响应已经被完全接收。and200表示成功收到
        {
            document.getElementById("result").innerHTML = 'sent';
            document.getElementById("result").innerHTML = '';
        }
    }
    xmlhttp.send(null);
}

function reloaddata()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }


    xmlhttp.open("POST", "reloaddata", true);

    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {

            document.getElementById("content").innerHTML = xmlhttp.responseText;
            olist = document.getElementById('list'); //everything in id list
            olist.scrollTop = olist.scrollHeight;


        }


    }
    xmlhttp.send(null);
}

