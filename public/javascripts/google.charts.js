GoogleCharts = {
  val: "yada",
  init:function(){  
    if($("#chart").length > 0 ){
      // Load the Visualization API and the piechart package.
       google.load('visualization', '1', {'packages':['corechart']});

       // Set a callback to run when the Google Visualization API is loaded.
        google.setOnLoadCallback(this.drawChart);
    }  
  },
  getData:function(){
    var currentUrl = document.location.href;
    var dataRecord = currentUrl.match(/url\/\d+/)[0].match(/\d+/)[0];
    $.ajax({
      url: '/get_trends?id='+dataRecord,
      dataType: 'json',
      error:function(res){
        console.log('error');
      },
      success:function(res){
      }
    })
  },
  drawChart:function(){
    var urlData =  GoogleCharts.getData(); 
    
    // Create our data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Size');
    data.addColumn('number', 'HTML');
    data.addColumn('number', 'CSS');
    data.addColumn('number', 'JavaScript');
    
    data.addRows([
      ['Date', 3,2,1],
      // ['Onions', 1],
      // ['Olives', 1], 
      // ['Zucchini', 1],
      // ['Pepperoni', 2]
    ]);

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.LineChart(document.getElementById('chart'));
    chart.draw(data, { height: 440});
  }
}

GoogleCharts.init();