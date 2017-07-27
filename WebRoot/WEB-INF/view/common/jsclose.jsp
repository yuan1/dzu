<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script type="text/javascript">
function navTabAjaxDone(json){
var forwardurl =json.forwardUrl;
forwardurl = forwardurl;
if (json.statusCode == 200) {
      alertMsg.correct(json.message);
}
if (json.statusCode == 300) {
      alertMsg.error(json.message);
}
navTab.closeCurrentTab();
navTab.reload(forwardurl, "", json.navTabId);
}
</script>
</body>
</html>