// 🟢 Setup Procedure - Runs Once to Set The Canvas
void setup() {
    size(400, 400);
}

// 🎯 Variable Declarations Go Here
var fireworkX = 20; 
var fireworkY = 15;
var rectSize = 10;
var centerX = 200;
var centerY = 200;
var fireworkSize = 5;
var fireworkOpacity = 255;
var particleSpeed = [];
var particleAngles = [];
var numParticles = 30;

for (var i = 0; i < numParticles; i++) {
    particleSpeed[i] = random(1, 4);
    particleAngles[i] = random(0, 4);
}

// 🟢 Draw Procedure - Runs on Repeat
draw = function () {
    background(0, 0, 0, 25);

    // 🎯 Animation Code for Fireworks
    for (var i = 0; i < numParticles; i++) {
        var x = centerX + particleSpeed[i] * fireworkSize * cos(particleAngles[i]);
        var y = centerY + particleSpeed[i] * fireworkSize * sin(particleAngles[i]);

        fill(255, random(100, 255), random(100, 255), fireworkOpacity);
        noStroke();
        ellipse(x, y, 8, 8);

        // Update the animation variables
        fireworkSize += 0.2; 
        fireworkOpacity -= 2;
    }

    // Reset firework when particles fade
    if (fireworkOpacity <= 0) {
        fireworkSize = 5; 
        fireworkOpacity = 255;


        centerX = mouseX;
        centerY = mouseY;
    }

    // 🎯 Move Object with Mouse
    if (mousePressed) {
        centerX = mouseX;
        centerY = mouseY;
    }

    // 🎯 Show Mouse Position (Optional Feature)
    showXYPositions();
};

// 🟡 Extra Feature: Show Mouse Position
showXYPositions = function () {
    fill(255, 255, 255);
    rect(270, 300, 150, 100);
    fill(0, 0, 0);
    textSize(20);
    text("x = " + mouseX + "\ny = " + mouseY, 290, 330);
    fill(255, 0, 255); // Pink dot on mouse position
    ellipse(mouseX, mouseY, 10, 10);
};