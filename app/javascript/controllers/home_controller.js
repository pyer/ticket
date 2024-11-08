
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  drag(ev) {
    var issue_id = this.element.children[2].innerHTML.substring(2);
    ev.dataTransfer.setData("text", issue_id);
    ev.dataTransfer.dropEffect = "move";
  }
  
  allowDrop(ev) {
    ev.preventDefault();
  }
  
  drop(ev) {
    ev.preventDefault();
    var st = this.element.cellIndex+1;
    var id = ev.dataTransfer.getData("text");
    var url = window.location.origin+"/issue/move?id="+id+"&status="+st;
    const xhr = new XMLHttpRequest();
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
    xhr.send("");
    location.reload(true);
  }

}
