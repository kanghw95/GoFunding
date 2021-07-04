// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var ctx1 = document.getElementById("myPieChart1");
var ctx2 = document.getElementById("myPieChart2");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["10-20대", "30-40대", "50-60대"],
    datasets: [{
      data: [55, 30, 15],
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
      data: [15, 15, 15, 15, 15, 15, 10],
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
      data: [50, 50],
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