function setup() {
  createCanvas(400, 800);
}

var x;

function draw() {
  if (!x) {
    x = width / 3
  }

  print(x)
  background(220);
  road()
  car(x)
  keyPressed()
}

function road() {
  for (var i = 0; i < 10; i++) {
    roadStrip(i, 10)
  }
}


function keyPressed() {
    if (keyCode == RIGHT_ARROW) {
      x += 1;
    } else if (keyCode == LEFT_ARROW) {
      x -= 1;
    }

  if (x <= 20) {
    x = 20;
  }
  if (x >= width - 20) {
    x = width - 20
  }
}

function roadStrip(i, shift) {
  var length = 80;
  push()
  fill(255)
  rect(width / 2 - 10, i * length, 20, length - 10)
  pop()
}

function car(x) {
  push()
  fill(250, 20, 20)
  rect(x, height - 50, 20, 30);
  pop()
}
