var options = { valueNames: ["name", "description", "tag"] };
var projectList = new List("projects", options);

$(".tag-filter").on("click", function() {
  var tag = this.textContent;

  projectList.filter(function(item) {
    var tags = item.values().tag.split(", ");
    return tags.find(function(t) { console.debug(tag); return t == tag });
  });
});

$(".clear-filter").on("click", function() {
  projectList.filter();
  return false;
});
