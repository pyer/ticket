
// You REALLY want async = true.
// Otherwise, it'll block ALL execution waiting for server response.
var async = true;
var request = new XMLHttpRequest();

// Before we send anything, we first have to say what we will do when the
// server responds. This seems backwards (say how we'll respond before we send
// the request? huh?), but that's how Javascript works.
// This function attached to the XMLHttpRequest "onload" property specifies how
// the HTTP response will be handled. 
request.onload = function () {
  // Because of javascript's fabulous closure concept, the XMLHttpRequest "request"
  // object declared above is available in this function even though this function
  // executes long after the request is sent and long after this function is
  // instantiated. This fact is CRUCIAL to the workings of XHR in ordinary
  // applications.

  // You can get all kinds of information about the HTTP response.
  var status = request.status; // HTTP response status, e.g., 200 for "200 OK"
  var data = request.responseText; // Returned data, e.g., an HTML document.
}


function post(id,state) {
  var url = "http://localhost:8080/issue/move?id="+id+"&status="+state;
  request.open("POST", url, async);
  request.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
  request.send("");

}

function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev,ref) {
  //console.log("ref = "+postit.children[1].innerText);
  console.log("Drag "+ref);
  var issue_id = ref.substring(2);
  ev.dataTransfer.setData("text", issue_id);
}

function drop(ev,state) {
  ev.preventDefault();
  var id = ev.dataTransfer.getData("text");
  console.log("text = "+id);
  console.log("state = "+state);
  post(id,state+1);
//  ev.target.appendChild(document.getElementById(data));
  location.reload(true);
}

