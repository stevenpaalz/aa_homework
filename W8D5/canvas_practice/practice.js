document.addEventListener("DOMContentLoaded", function(){

});
// phase 1
const canvasEl = document.getElementById("mycanvas");
canvasEl.height = 500;
canvasEl.width = 500;
const ctx = canvasEl.getContext('2d');

// phase 2
ctx.fillStyle = 'red';
ctx.fillRect(200, 400, 20, 15);

// phase 3
// ctx.beginPath();
// ctx.arc(100, 75, 50, 2 * Math.PI, 5);
// ctx.strokeStyle = 'blue';
// ctx.lineWidth = 5;
// ctx.stroke();
// ctx.fillStyle = 'yellow';
// ctx.fill();

// phase 4
ctx.beginPath(50);
ctx.moveTo(300, 300);
ctx.lineTo(200, 75);
ctx.lineTo(50, 200);
ctx.fillStyle= 'maroon';
ctx.fill();
