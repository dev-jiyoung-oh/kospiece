<%@page import="json.data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-treemap.min.js"></script>
<%@ page import="json.*,util.Crawling.*" %>

<script>
<%-- $(document).ready(function() { <%CrawlingLoad.Load();%> }); --%>
</script>
<!-- TREND CHART -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([${chart}], true);

    var options = {
 	     legend: 'none',
 	     bar: { groupWidth: '100%' }, // Remove space between bars.
	     candlestick: {
 	            fallingColor: { strokeWidth: 0, fill: '#0400FF' }, // red
 	            risingColor: { strokeWidth: 0, fill: '#FF0400' }   // green
   	     }
 	};

    var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart.draw(data, options);
  }
</script>


<div class="main-map">
<% trans.Data(); %>
	<div class="map" id="map">
	<script>
      anychart.onDocumentReady(function() {
		        // create data
		<%-- <% data dd = new data(); %>   --%>      
        var data = <%= trans.Data()%>

        // create a data tree
        var treeData = anychart.data.tree(eval(data), "as-tree");

        // create a treemap chart visualizing the data tree
        var chart = anychart.treeMap(treeData);
		
        var customColorScale = anychart.scales.ordinalColor();
        customColorScale.ranges([
            {less: -3},
            {from: -3, to: -2},
            {from: -2, to: -1},
            {from: -1, to: 1},
            {from: 1, to: 2},
            {from: 2, to: 3},
            {greater: 3}
        ]);
        
        customColorScale.colors(["#f63538", "#bf4045", "#8b444e" ,"#414554", "#35764e", "#2f9e4f", "#30cc5a"]);
     // set the color scale as the color scale of the chart
        chart.colorScale(customColorScale);

     
        chart.maxDepth(3);
        chart.hintDepth(3);
        chart.maxHeadersHeight("30%");
        // add a color range
        chart.colorRange().enabled(true);
        chart.colorRange().length("30%");
        // add a title for the chart
        chart.title("Kospi 200 Map");
        /* adjust the font size of labels
        according to the size of tiles */
        chart.labels().adjustFontSize(true);
        chart.labels().fontColor("white")
     // configure the font of headers
        chart.normal().headers().fontColor("#990000");
        chart.normal().headers().adjustFontSize(true);
        chart.normal().headers().fontWeight('bold');
        chart.hovered().headers().fontColor("#000099");
     // enable HTML for labels
        chart.labels().useHtml(true);

        // configure labels
        chart.labels().format(
          "<span style='font-weight:bold'>{%name}</span><br>{%value}"
        );

        // configure tooltips
        chart.tooltip().format(
          "?????????: {%value}\%\n????????????(???): {%size}"
        );
        // specify the container id
        chart.container("map");
        chart.headersDisplayMode("clip");
        
        //???????????????!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        chart.listen("pointClick", function(e) {
        	var name = e.point.get("name");
        	document.getElementById("sname").value=name;
        	$(submit).trigger( "click" );
        });

/*         state.get */
        // draw the chart
        chart.draw();

        
      });
   
      /* document.getElementById('kk').innerHTML = state.get("name"); */
    </script>
	</div>
	<div class="map-detail">
		<form id = "company-inform",name="company-inform" method ="post" class="company-inform" action="./search.do">
		    <input type="text" id = "sname" name="sname"/>
		    <input id="submit" type="submit" value="??????"/>
		</form>
		<table border="1" width="800" align="center" class="company-detail">
			<tr>
				<th colspan="12"><b>${info.stockVO.name}</b> 
				<!-- 1.???????????????????????? 2.???????????????????????? *3.?????????????????????* -->
				<!-- ????????????????????? if????????? ?????? ????????? ?????? ????????? ??????????????? ??????????????? ?????? ??? ?????? ?????? ?????? & ?????? ????????? ??????????????? ???????????? -->
				<img src="img/star.png" onclick="LoginCheck('favoritePlus',${!empty AUTHUSER},'${AUTHUSER.id}')" style="cursor:pointer"/>
				<form action="./simulation.do">
					<input type="hidden" name="sname" value="${info.stockVO.name}"/>
					<input type="submit" value="????????????"/>
				</form>
				</th>
			</tr>
			<tr>
				<th colspan="2" width="16.6%">?????????</th>
				<td colspan="2" width="16.6%">${info.stockVO.price}</td>
				<th colspan="2" width="16.6%">?????????</th>
				<td colspan="2" width="16.6%">${info.stockVO.dayrate}</td>
				<th colspan="2" width="16.6%">?????????</th>
				<td colspan="2">${info.stockVO.changerate}</td>
			</tr>
			<tr>
				<th colspan="2">?????????</th>
				<td colspan="2">${info.stockVO.volume}</td>
				<th colspan="2">????????????</th>
				<td colspan="2">${info.stockVO.dealprice}</td>
				<th colspan="2">52?????????</th>
				<td colspan="2">${info.stockVO.high52}</td>
			</tr>
			<tr>
				<th colspan="2">????????????</th>
				<td colspan="2">${info.stockVO.total}</td>
				<th colspan="2">??????</th>
				<td colspan="2">${info.stockVO.field}</td>
				<th colspan="2">????????????</th>
				<td colspan="2">${info.stockVO.detail}</td>
			</tr>
			<c:if test="${!empty error }"><tr><th colspan="12">${error}</th></tr></c:if>
			<c:if test="${empty error }">
				<c:if test="${!empty errors}"><tr><td colspan="12">${errors}</td></tr></c:if>
				<c:if test="${empty errors }">
					<tr>
						<th colspan="12">?????? ????????????  ?????? </th>
					</tr>
					<tr>
						<th colspan="3" width="200">??????</th>
						<th colspan="3" width="200">?????????</th>
						<th colspan="3" width="200">?????????</th>
						<th colspan="3" width="200">?????????</th>
					</tr>
						<c:forEach var="list" items="${info.list}">
							<tr>
								<td colspan="3">${list.name}</td>
								<td colspan="3">${list.price}</td>
								<td colspan="3">${list.dayrate}</td>
								<td colspan="3">${list.changerate}</td>
							</tr>
						</c:forEach>
				</c:if>
			</c:if>
		</table>
	</div>
	<div class="rank" id="chart_div" style="width: 900px; height: 500px;"></div>
</div>