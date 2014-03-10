var options = { valueNames: ["name", "description", "tag"] };
var projectList = new List("projects", options);
var filter;

document.getElementById('search').addEventListener('submit', function(event){ 
    event.preventDefault();
});

$(".tag-filter").on("click", function() {
  var tag = this.textContent;
  var parent = this.parentNode;

  if (filter) {
    filter.className = "label label-default";
    projectList.filter();
  }

  if (filter != parent) {
    this.parentNode.className = "label label-primary";

    projectList.filter(function(item) {
      var tags = item.values().tag.split(", ");

      return tags.find(function(t) {
        return t == tag;
      });
    });

    filter = parent;
  } else {
    filter = null;
  }
});
