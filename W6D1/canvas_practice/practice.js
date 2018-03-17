document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(100, 200, 50, 200);
  ctx.beginPath();
  ctx.arc(200, 200, 80, 200, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 15;
  ctx.stroke();
  ctx.fillStyle = 'orange';
  ctx.fill();

  ctx.beginPath();
  ctx.strokeStyle = 'green';
  ctx.lineWidth = 5;
  ctx.moveTo(50, 50);
  ctx.quadraticCurveTo(100, 50, 100, 100);
  ctx.quadraticCurveTo(100, 150, 150, 150);
  ctx.quadraticCurveTo(200, 150, 200, 200);
  ctx.quadraticCurveTo(200, 250, 250, 250);
  ctx.stroke();
});
