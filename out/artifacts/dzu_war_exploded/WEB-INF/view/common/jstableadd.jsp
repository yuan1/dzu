<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script type="text/javascript">
function table_addRow(otable){
	var len = otable.rows.length;
	var newRow = otable.insertRow(len);
	var refRow = otable.rows[len-1];//对第一行第一格的rospan+1
	var newCol;
	var obj;
	newRow.className = refRow.className;
	for ( var i = 0; i < refRow.cells.length; i++) {
		newCol = newRow.insertCell(i);
		copyProp_f(newCol, refRow.cells[i]);
		newCol.innerHTML = refRow.cells[i].innerHTML.replaceAll('\\[.*\\]','['+(len-1)+']');
		obj = newCol.firstChild;
	}
	return newRow;
}
function copyProp_f(oCol, refCol) {
	oCol.align = refCol.align;
	oCol.style.width = refCol.style.width;
	oCol.style.display = refCol.style.display;
	oCol.colSpan = refCol.colSpan;
}
function del_last_row(otable){
	var len = otable.rows.length;
	if(len==2){
		alert("最后一行,不许删除!");
		return false;
	}
	otable.deleteRow(len-1);
}
function delRow(obj){ //参数为A标签对象
    var row = obj.parentNode.parentNode; //A标签所在行
	//alert(row.innerHTML);
    var tb = row.parentNode; //当前表格
    var rowIndex = row.rowIndex; //A标签所在行下标
	if(rowIndex>1){
		 tb.deleteRow(rowIndex); //删除当前行
		 
	}
   
}
/*
 * 学历信息
 */
function addxlxx() {
	var rownum = xlxxtable.rows.length;
	if (rownum == 1) {
		var newrow = xlxxtable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xlxx[0].byyxjzy\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xlxx[0].kssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xlxx[0].jssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xlxx[0].qdxl\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xlxx[0].shxw\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xlxx[0].type\"><option value=\"全日制教育\" selected=\"selected\">全日制教育</option><option value=\"在职教育\">在职教育</option></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xlxx[0].hight\"><option value=\"1\" selected=\"selected\">是</option><option value=\"0\">否</option></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delxlxx();\">";
	} else {
		table_addRow(xlxxtable);
		var r = xlxxtable.rows.length - 2;
		document.getElementsByName("xlxx["+ r +"].byyxjzy")[0].value="";
		document.getElementsByName("xlxx["+ r +"].kssj")[0].value="";
		document.getElementsByName("xlxx["+ r +"].jssj")[0].value="";
		document.getElementsByName("xlxx["+ r +"].qdxl")[0].value="";
		document.getElementsByName("xlxx["+ r +"].shxw")[0].value="";
		document.getElementsByName("xlxx["+ r +"].type")[0].value="";
		document.getElementsByName("xlxx["+ r +"].hight")[0].value="";
	}
}
function delxlxx(){
	del_last_row(xlxxtable);
}
/*
 * 工作简历
 */
function addgzjl() {
	var rownum = gzjltable.rows.length;
	if (rownum == 1) {
		var newrow = gzjltable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"gzjl[0].kssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"gzjl[0].jssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"gzjl[0].gzdwjzw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delgzjl();\">";
	} else {
		table_addRow(gzjltable);
		var r = gzjltable.rows.length - 2;
		document.getElementsByName("gzjl["+ r +"].kssj")[0].value="";
		document.getElementsByName("gzjl["+ r +"].jssj")[0].value="";
		document.getElementsByName("gzjl["+ r +"].gzdwjzw")[0].value="";
	}
}
function delgzjl(){
	del_last_row(gzjltable);
}
/*
 * 目前在各级人大安排情况
 */
function addmqzgjrdapqk() {
	var rownum = mqzgjrdapqkable.rows.length;
	if (rownum == 1) {
		var newrow = mqzgjrdapqkable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjrdapqk[0].gjrdzzmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjrdapqk[0].jc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"mqzgjrdapqk[0].zzjb\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"mqzgjrdapqk[0].apzw\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjrdapqk[0].apsj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjrdapqk[0].bz\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delmqzgjrdapqk();\">";
	} else {
		table_addRow(mqzgjrdapqkable);
		var r = mqzgjrdapqkable.rows.length - 2;
		document.getElementsByName("mqzgjrdapqk["+ r +"].gjrdzzmc")[0].value="";
		document.getElementsByName("mqzgjrdapqk["+ r +"].jc")[0].value="";
		document.getElementsByName("mqzgjrdapqk["+ r +"].zzjb")[0].value="";
		document.getElementsByName("mqzgjrdapqk["+ r +"].apzw")[0].value="";
		document.getElementsByName("mqzgjrdapqk["+ r +"].apsj")[0].value="";
		document.getElementsByName("mqzgjrdapqk["+ r +"].bz")[0].value="";
	}
}
function delmqzgjrdapqk(){
	del_last_row(mqzgjrdapqkable);
}
/*
 * 目前在各级政协安排情况
 */
function addmqzgjzxapqk() {
	var rownum = mqzgjzxapqktable.rows.length;
	if (rownum == 1) {
		var newrow = mqzgjzxapqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjzxapqk[0].gjzxzzmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjzxapqk[0].jc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"mqzgjzxapqk[0].zzjb\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"mqzgjzxapqk[0].apzw\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"mqzgjzxapqk[0].apsj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"mqzgjzxapqk[0].apjb\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delmqzgjzxapqk();\">";
	} else {
		table_addRow(mqzgjzxapqktable);
		var r = mqzgjzxapqktable.rows.length - 2;
		document.getElementsByName("mqzgjzxapqk["+ r +"].gjzxzzmc")[0].value="";
		document.getElementsByName("mqzgjzxapqk["+ r +"].jc")[0].value="";
		document.getElementsByName("mqzgjzxapqk["+ r +"].zzjb")[0].value="";
		document.getElementsByName("mqzgjzxapqk["+ r +"].apzw")[0].value="";
		document.getElementsByName("mqzgjzxapqk["+ r +"].apsj")[0].value="";
		document.getElementsByName("mqzgjzxapqk["+ r +"].apjb")[0].value="";
	}
}
function delmqzgjzxapqk(){
	del_last_row(mqzgjzxapqktable);
}
/*
 * 现任民主党派、工商联、爱国宗教团体、知联会、海联会、光彩会等职务情况
 */
function addxrzwqk() {
	var rownum = xrzwqktable.rows.length;
	if (rownum == 1) {
		var newrow = xrzwqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrzwqk[0].zzmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrzwqk[0].rzkssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrzwqk[0].rzjssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xrzwqk[0].apzw\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delxrzwqk();\">";
	} else {
		table_addRow(xrzwqktable);
		var r = xrzwqktable.rows.length - 2;
		document.getElementsByName("xrzwqk["+ r +"].zzmc")[0].value="";
		document.getElementsByName("xrzwqk["+ r +"].rzkssj")[0].value="";
		document.getElementsByName("xrzwqk["+ r +"].rzjssj")[0].value="";
		document.getElementsByName("xrzwqk["+ r +"].apzw")[0].value="";
	}
}
function delxrzwqk(){
	del_last_row(xrzwqktable);
}
/*
 * 现任有关部门、单位特约人员（监督员）情况
 */
function addxrygbmqk() {
	var rownum = xrygbmqktable.rows.length;
	if (rownum == 1) {
		var newrow = xrygbmqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrygbmqk[0].pqbm\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrygbmqk[0].tyrymc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrygbmqk[0].kssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrygbmqk[0].jssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delxrygbmqk();\">";
	} else {
		table_addRow(xrygbmqktable);
		var r = xrygbmqktable.rows.length - 2;
		document.getElementsByName("xrygbmqk["+ r +"].pqbm")[0].value="";
		document.getElementsByName("xrygbmqk["+ r +"].tyrymc")[0].value="";
		document.getElementsByName("xrygbmqk["+ r +"].kssj")[0].value="";
		document.getElementsByName("xrygbmqk["+ r +"].jssj")[0].value="";
	}
}
function delxrygbmqk(){
	del_last_row(xrygbmqktable);
}
/*
 * 现任其他社会职务<br />(人民团体、社会团体、学术及科研机构等)
 */
function addxrqtshzw() {
	var rownum = xrqtshzwtable.rows.length;
	if (rownum == 1) {
		var newrow = xrqtshzwtable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrqtshzw[0].zzmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrqtshzw[0].rzkssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"xrqtshzw[0].rzjssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<select name=\"xrqtshzw[0].apzw\"></select>";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delxrqtshzw();\">";
	} else {
		table_addRow(xrqtshzwtable);
		var r = xrqtshzwtable.rows.length - 2;
		document.getElementsByName("xrqtshzw["+ r +"].zzmc")[0].value="";
		document.getElementsByName("xrqtshzw["+ r +"].rzkssj")[0].value="";
		document.getElementsByName("xrqtshzw["+ r +"].rzjssj")[0].value="";
		document.getElementsByName("xrqtshzw["+ r +"].apzw")[0].value="";
	}
}
function delxrqtshzw(){
	del_last_row(xrqtshzwtable);
}
/*
 *近五年来参加培训情况
 */
function addjwnlcjpxqk() {
	var rownum = jwnlcjpxqktable.rows.length;
	if (rownum == 1) {
		var newrow = jwnlcjpxqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jwnlcjpxqk[0].zbdw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jwnlcjpxqk[0].bcmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jwnlcjpxqk[0].pxyx\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jwnlcjpxqk[0].kssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jwnlcjpxqk[0].jssj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"deljwnlcjpxqk();\">";
	} else {
		table_addRow(jwnlcjpxqktable);
		var r = jwnlcjpxqktable.rows.length - 2;
		document.getElementsByName("jwnlcjpxqk["+ r +"].zbdw")[0].value="";
		document.getElementsByName("jwnlcjpxqk["+ r +"].bcmc")[0].value="";
		document.getElementsByName("jwnlcjpxqk["+ r +"].pxyx")[0].value="";
		document.getElementsByName("jwnlcjpxqk["+ r +"].kssj")[0].value="";
		document.getElementsByName("jwnlcjpxqk["+ r +"].jssj")[0].value="";
	}
}
function deljwnlcjpxqk(){
	del_last_row(jwnlcjpxqktable);
}
/*
 *获奖或受表彰情况
 */
function addhjhsbzqk() {
	var rownum = hjhsbzqktable.rows.length;
	if (rownum == 1) {
		var newrow = hjhsbzqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"hjhsbzqk[0].xydw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"hjhsbzqk[0].hjhsbzmc\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"hjhsbzqk[0].sjsj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delhjhsbzqk();\">";
	} else {
		table_addRow(hjhsbzqktable);
		var r = hjhsbzqktable.rows.length - 2;
		document.getElementsByName("hjhsbzqk["+ r +"].xydw")[0].value="";
		document.getElementsByName("hjhsbzqk["+ r +"].hjhsbzmc")[0].value="";
		document.getElementsByName("hjhsbzqk["+ r +"].sjsj")[0].value="";
	}
}
function delhjhsbzqk(){
	del_last_row(hjhsbzqktable);
}
/*
 *年度考核情况<br />(机关、事业单位人员填写)
 */
function addndkhqk() {
	var rownum = ndkhqktable.rows.length;
	if (rownum == 1) {
		var newrow = ndkhqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"ndkhqk[0].sj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"ndkhqk[0].khjg\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delndkhqk();\">";
	} else {
		table_addRow(ndkhqktable);
		var r = ndkhqktable.rows.length - 2;
		document.getElementsByName("ndkhqk["+ r +"].sj")[0].value="";
		document.getElementsByName("ndkhqk["+ r +"].khjg")[0].value="";
	}
}
function delndkhqk(){
	del_last_row(ndkhqktable);
}
/*
 *综合评价情况
 */
function addzhpjqk() {
	var rownum = zhpjqktable.rows.length;
	if (rownum == 1) {
		var newrow = zhpjqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"zhpjqk[0].zhpjjg\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"zhpjqk[0].pjdw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"zhpjqk[0].pjsj\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delzhpjqk();\">";
	} else {
		table_addRow(zhpjqktable);
		var r = zhpjqktable.rows.length - 2;
		document.getElementsByName("zhpjqk["+ r +"].zhpjjg")[0].value="";
		document.getElementsByName("zhpjqk["+ r +"].pjdw")[0].value="";
		document.getElementsByName("zhpjqk["+ r +"].pjsj")[0].value="";
	}
}
function delzhpjqk(){
	del_last_row(zhpjqktable);
}
/*
 *家庭成员及重要社会关系
 */
function addjtcyjzyshgx() {
	var rownum = jtcyjzyshgxtable.rows.length;
	if (rownum == 1) {
		var newrow = jtcyjzyshgxtable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jtcyjzyshgx[0].cw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jtcyjzyshgx[0].xm\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jtcyjzyshgx[0].csny\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jtcyjzyshgx[0].zzmm\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"jtcyjzyshgx[0].gzdwjzw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"deljtcyjzyshgx();\">";
	} else {
		table_addRow(jtcyjzyshgxtable);
		var r = jtcyjzyshgxtable.rows.length - 2;
		document.getElementsByName("jtcyjzyshgx["+ r +"].cw")[0].value="";
		document.getElementsByName("jtcyjzyshgx["+ r +"].xm")[0].value="";
		document.getElementsByName("jtcyjzyshgx["+ r +"].csny")[0].value="";
		document.getElementsByName("jtcyjzyshgx["+ r +"].zzmm")[0].value="";
		document.getElementsByName("jtcyjzyshgx["+ r +"].gzdwjzw")[0].value="";
	}
}
function deljtcyjzyshgx(){
	del_last_row(jtcyjzyshgxtable);
}
/*
 *去台家庭成员及重要社会关系
 */
function addqtryjtqk() {
	var rownum = qtryjtqktable.rows.length;
	if (rownum == 1) {
		var newrow = qtryjtqktable.insertRow(rownum);
		var newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"qtryjtqk[0].cw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"qtryjtqk[0].xm\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"qtryjtqk[0].csny\" readonly=\"readonly\"  onClick=\"WdatePicker({dateFmt:'yyyy-MM'})\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"qtryjtqk[0].zzmm\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input name=\"qtryjtqk[0].gzdwjzw\" type=\"text\">";
		newcell = newrow.insertCell(newrow.cells.length);
		newcell.innerHTML = "<input type=\"button\" value=\"删除\" onclick=\"delqtryjtqk();\">";
	} else {
		table_addRow(qtryjtqktable);
		var r = qtryjtqktable.rows.length - 2;
		document.getElementsByName("qtryjtqk["+ r +"].cw")[0].value="";
		document.getElementsByName("qtryjtqk["+ r +"].xm")[0].value="";
		document.getElementsByName("qtryjtqk["+ r +"].csny")[0].value="";
		document.getElementsByName("qtryjtqk["+ r +"].zzmm")[0].value="";
		document.getElementsByName("qtryjtqk["+ r +"].gzdwjzw")[0].value="";
	}
}
function delqtryjtqk(){
	del_last_row(qtryjtqktable);
}
</script>
</body>
</html>