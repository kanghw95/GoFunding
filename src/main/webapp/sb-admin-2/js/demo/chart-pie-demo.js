// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var ctx1 = document.getElementById("myPieChart1");
var ctx2 = document.getElementById("myPieChart2");

var stat1020=parseInt($("#stat1020").val());
var stat3040=parseInt($("#stat3040").val());
var stat5060=parseInt($("#stat5060").val());
var cate1=parseInt($("#cate1").val());
var cate2=parseInt($("#cate2").val());
var cate3=parseInt($("#cate3").val());
var cate4=parseInt($("#cate4").val());
var cate5=parseInt($("#cate5").val());
var cate6=parseInt($("#cate6").val());
var cate7=parseInt($("#cate7").val());
var male=parseInt($("#male").val());
var female=parseInt($("#female").val());

var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["10-20대", "30-40대", "50-60대"],
    datasets: [{
      data: [stat1020, stat3040, stat5060],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

var myPieChart1 = new Chart(ctx1, {
  type: 'doughnut',
  data: {
    labels: ["일자리 창출", "공정 무역", "친환경", "기부", "작은가게", "미디어", "창작자"],
    datasets: [{
      data: [cate1, cate2, cate3, cate4, cate5, cate6, cate7],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#cff09e', '#79bd9a', '#3CB371', '#40E0D0'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#fcf6c1', '#a8dba8', '#2E8B57', '#AFEEEE'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

var myPieChart2 = new Chart(ctx2, {
  type: 'doughnut',
  data: {
    labels: ["남자", "여자"],
    datasets: [{
      data: [male, female],
      backgroundColor: ['#4e73df', '#1cc88a'],
      hoverBackgroundColor: ['#2e59d9', '#17a673'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});