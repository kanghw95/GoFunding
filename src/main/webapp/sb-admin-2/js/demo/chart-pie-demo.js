// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example *****TODO 합계 확인해야 함*****
var ctx = document.getElementById("myPieChart");
var ctx1 = document.getElementById("myPieChart1");
var ctx2 = document.getElementById("myPieChart2");
var ctx3 = document.getElementById("myPieChart3");
var ctx4 = document.getElementById("myPieChart4");
var ctx5 = document.getElementById("myPieChart5");

var statF1020=parseInt($("#statF1020").val());
var statF3040=parseInt($("#statF3040").val());
var statF5060=parseInt($("#statF5060").val());

var statC1020=parseInt($("#statC1020").val());
var statC3040=parseInt($("#statC3040").val());
var statC5060=parseInt($("#statC5060").val());

var cateF1=parseInt($("#cateF1").val());
var cateF2=parseInt($("#cateF2").val());
var cateF3=parseInt($("#cateF3").val());
var cateF4=parseInt($("#cateF4").val());
var cateF5=parseInt($("#cateF5").val());
var cateF6=parseInt($("#cateF6").val());
var cateF7=parseInt($("#cateF7").val());

var cateC1=parseInt($("#cateC1").val());
var cateC2=parseInt($("#cateC2").val());
var cateC3=parseInt($("#cateC3").val());
var cateC4=parseInt($("#cateC4").val());
var cateC5=parseInt($("#cateC5").val());

var maleF=parseInt($("#maleF").val());
var femaleF=parseInt($("#femaleF").val());

var maleC=parseInt($("#maleC").val());
var femaleC=parseInt($("#femaleC").val());



var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["10-20대", "30-40대", "50-60대"],
    datasets: [{
      data: [statF1020, statF3040, statF5060],
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
      data: [cateF1, cateF2, cateF3, cateF4, cateF5, cateF6, cateF7],
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
      data: [maleF, femaleF],
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

var myPieChart3 = new Chart(ctx3, {
	type: 'doughnut',
	data: {
		labels: ["10-20대", "30-40대", "50-60대"],
		datasets: [{
			data: [statC1020, statC3040, statC5060],
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

var myPieChart4 = new Chart(ctx4, {
	type: 'doughnut',
	data: {
		labels: ["자유게시판", "후기게시판", "질답게시판", "이벤트게시판", "정보공유게시판"],
		datasets: [{
			data: [cateC1, cateC2, cateC3, cateC4, cateC5],
			backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#cff09e', '#79bd9a'],
			hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#fcf6c1', '#a8dba8'],
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

var myPieChart5 = new Chart(ctx5, {
	type: 'doughnut',
	data: {
		labels: ["남자", "여자"],
		datasets: [{
			data: [maleC, femaleC],
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