var xmlHttpReq;
// 创建一个XmlHttpRequest对象
function createXmlHttpRequest() {
	if (window.XMLHttpRequest) {
		xmlHttpReq = new XMLHttpRequest();// 非IE浏览器
	} else {
		xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");// IE浏览器
	}
}
// 检测输入
function checkInput() {
	var kw = document.getElementById("inputKeyword").value;
	if (kw == "") {
		alert("请输入关键字！");
		return false;
	}
	createXmlHttpRequest();
	// 指明准备状态改变时回调的函数名
	xmlHttpReq.onreadystatechange = handle;
	// 尝试以异步的get方式访问某个URL
	// 请求服务器端的一个servlet
	var url = "checkServlet?kw=" + encodeURI(encodeURI(kw));
	xmlHttpReq.open("get", url, true);
	// 向服务器发送请求
	xmlHttpReq.send(null);
}

// 状态发生改变时回调的函数
function handle() {
	// 准备状态为4
	if (xmlHttpReq.readyState == 4) {
		// 响应状态码为200，代表一切正常
		if (xmlHttpReq.status == 200) {
			var xmlDoc = xmlHttpReq.responseText;
			var data = eval(xmlDoc);
			var result = document.getElementById("search-result-tbody");
			var choose = $("#search_choose").val();
			console.log("data.length:" + data.length);
			result.innerHTML = "";
			for (i = 0; i < data.length; i++) {
				document.getElementById("search_result_list_table").style.display = "block";
				var sign_state = data[i].sign_state == 1 ? "已签" : "未签";
				var sign_state_class = data[i].sign_state == 1 ? "green"
						: "red";
				var move_state = data[i].move_state == 1 ? "已搬家" : "未搬家";
				var move_state_class = data[i].move_state == 1 ? "green"
						: "red";
				var choose_state = data[i].person.choose_state == 1 ? "第一轮已抽签，第二轮未抽签"
						: data[i].person.choose_state == 2 ? "第二轮已抽签" : "未抽签";
				var choose_state_class = data[i].person.choose_state == 1 ? "warning"
						: data[i].person.choose_state == 2 ? "green" : "red";
				result.innerHTML += "<tr onclick=\"showDetail(\'"
						+ data[i].person_id + "\'," + choose + ")\"><td>"
						+ data[i].house_no + "</td><td>"
						+ data[i].person.p0_name + "</td><td>"
						+ data[i].person.p1_name + "</td><td>"
						+ data[i].person.telNo + "</td><td><span class=\""
						+ sign_state_class + "\">" + sign_state
						+ "</span></td><td><span class=\"" + move_state_class + "\">"
						+ move_state + "</span></td><td>" + data[i].move_seq
						+ "</td><td><span class=\"" + choose_state_class + "\">"
						+ choose_state + "</span></td></tr>";
			}
		}
	}
}