GoogleCharts = {
  val: "yada",
  init:function(){  
    if($("#chart").length > 0 ){      
      google.load('visualization', '1', {'packages':['corechart']});
      google.setOnLoadCallback(GoogleCharts.drawChart);
    }  
  },
  getData:function(){
    return JSON.parse($('#data').html().trim());
  },
  drawChart:function(){
    var jsonData = GoogleCharts.getData();
    
    // Create our data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Size');
    data.addColumn('number', 'HTML');

    for(obj in jsonData){
      if(jsonData.hasOwnProperty(obj)){
        data.addRows([
          [obj, jsonData[obj]]
        ]);
      }
    }
    
    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.LineChart(document.getElementById('chart'));
    chart.draw(data, { height: 440});
  }
}

GoogleCharts.init();