
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  drag(ev) {
    console.log(ev.type);
    var issue_id = this.element.children[1].innerHTML.substring(2);
    ev.dataTransfer.setData("text", issue_id);
  }
  
  allowDrop(ev) {
    console.log(ev.type);
    ev.preventDefault();
  }
  
  drop(ev) {
    console.log(ev.type);
    ev.preventDefault();
    var st = this.element.cellIndex+1;
    var id = ev.dataTransfer.getData("text");
    var url = window.location.origin+"/issue/move?id="+id+"&status="+st;
    console.log(url);
    const xhr = new XMLHttpRequest();
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
    xhr.send("");
    location.reload(true);
  }

}
