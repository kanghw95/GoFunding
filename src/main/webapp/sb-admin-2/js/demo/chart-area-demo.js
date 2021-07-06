// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");

var day00=new Date();
var fmtDay00=(day00.getMonth()+1)+'/'+day00.getDate();
var day01=new Date(new Date().setDate(new Date().getDate() - 1));
var fmtDay01=(day01.getMonth()+1)+'/'+day01.getDate();
var day02=new Date(new Date().setDate(new Date().getDate() - 2));
var fmtDay02=(day02.getMonth()+1)+'/'+day02.getDate();
var day03=new Date(new Date().setDate(new Date().getDate() - 3));
var fmtDay03=(day03.getMonth()+1)+'/'+day03.getDate();
var day04=new Date(new Date().setDate(new Date().getDate() - 4));
var fmtDay04=(day04.getMonth()+1)+'/'+day04.getDate();
var day05=new Date(new Date().setDate(new Date().getDate() - 5));
var fmtDay05=(day05.getMonth()+1)+'/'+day05.getDate();
var day06=new Date(new Date().setDate(new Date().getDate() - 6));
var fmtDay06=(day06.getMonth()+1)+'/'+day06.getDate();

var pay0=days[0];
var pay1=days[3];
var pay2=days.AMOUNT;
var pay3=days.PAYMENTDATE;
var pay4=days[6];
var pay5=days[7];
var pay6=days[8];
var payments=Object.keys(days);
var payments1=Object.values(days);

var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [fmtDay06, fmtDay05, fmtDay04, fmtDay03, fmtDay02, fmtDay01, fmtDay00],
    datasets: [{
      label: "수입",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: [100,500,1000,2000,3000,4000,5000],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return '₩' + number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': ₩' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});

