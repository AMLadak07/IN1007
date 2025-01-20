// Transport Data Visualization System
// Includes Bar Chart, Pie Chart, Timeline, and 3D Visualization

// Transport mode data class
class TransportRecord {
  String date;
  String mode;
  int duration;
  float distance;
  
  TransportRecord(String d, String m, int dur, float dist) {
    date = d;
    mode = m;
    duration = dur;
    distance = dist;
  }
}

// Global variables
ArrayList<TransportRecord> transportData;
String[] modes = {"Walk", "Bike", "Bus", "Car", "Train"};
color[] modeColors = {#FF9AA2, #FFB7B2, #FFDAC1, #E2F0CB, #B5EAD7};
int currentView = 0; // 0: Bar Chart, 1: Pie Chart, 2: Timeline, 3: 3D View
boolean mouseOverButton = false;
float pieChartX, pieChartY;

// 3D View variables
float rotationY = 0;
float targetRotationY = 0;
float rotationX = PI/4;
float targetRotationX = PI/4;

void setup() {
  size(800, 600, P3D);
  smooth(8); // Enable anti-aliasing to reduce blurriness
  frameRate(60); // Set high frame rate for smoother interaction
  textAlign(CENTER, CENTER);
  generateData();
  pieChartX = width/2;
  pieChartY = height/2;
}

void draw() {
  background(255);
  
  // Draw visualization based on current view
  switch(currentView) {
    case 0:
      drawBarChart();
      break;
    case 1:
      drawPieChart();
      break;
    case 2:
      drawTimeline();
      break;
    case 3:
      draw3DView();
      break;
  }
  
  // Draw UI elements
  hint(DISABLE_DEPTH_TEST);
  camera();
  noLights();
  drawButtons();
  
  // Draw title
  fill(0);
  textSize(24);
  text("Monthly Transport Usage", width/2, 60);
  hint(ENABLE_DEPTH_TEST);
}

// Bar Chart Visualization
void drawBarChart() {
  float barWidth = (width - 100) / modes.length;
  float maxHeight = height - 200;
  
  // Calculate totals
  int[] modeTotals = new int[modes.length];
  for(TransportRecord record : transportData) {
    for(int i = 0; i < modes.length; i++) {
      if(record.mode.equals(modes[i])) {
        modeTotals[i] += record.duration;
      }
    }
  }
  
  int maxDuration = max(modeTotals);
  
  // Draw bars
  for(int i = 0; i < modes.length; i++) {
    float x = 50 + i * barWidth;
    float barHeight = map(modeTotals[i], 0, maxDuration, 0, maxHeight);
    
    fill(modeColors[i]);
    rect(x, height - 100 - barHeight, barWidth - 10, barHeight);
    
    // Draw label
    fill(0);
    pushMatrix();
    translate(x + barWidth/2, height - 90);
    rotate(-QUARTER_PI);
    text(modes[i], 0, 0);
    popMatrix();
    
    // Draw value
    text(modeTotals[i] + " min", x + barWidth/2, height - 110 - barHeight);
  }
}

// Pie Chart Visualization
void drawPieChart() {
  pieChartX = width / 2;
  pieChartY = height / 2;
  float diameter = min(width, height) * 0.5; // Dynamic resizing

  float lastAngle = 0;

  // Calculate totals
  int[] modeTotals = new int[modes.length];
  int total = 0;
  for (TransportRecord record : transportData) {
    for (int i = 0; i < modes.length; i++) {
      if (record.mode.equals(modes[i])) {
        modeTotals[i] += record.duration;
        total += record.duration;
      }
    }
  }

  // Draw pie segments and labels
  for (int i = 0; i < modes.length; i++) {
    fill(modeColors[i]);
    float angle = map(modeTotals[i], 0, total, 0, TWO_PI);
    arc(pieChartX, pieChartY, diameter, diameter, lastAngle, lastAngle + angle);

    float labelAngle = lastAngle + angle / 2;
    float labelRadius = diameter / 2 + 60; // Adjust radius for text
    float labelX = pieChartX + cos(labelAngle) * labelRadius;
    float labelY = pieChartY + sin(labelAngle) * labelRadius;

    // Draw connecting lines and labels
    stroke(0, 127);
    line(pieChartX + cos(labelAngle) * (diameter / 2), pieChartY + sin(labelAngle) * (diameter / 2), labelX, labelY);
    fill(0);
    noStroke();
    textSize(12);
    text(modes[i], labelX, labelY - 10);
    text(nf(modeTotals[i] * 100.0 / total, 0, 1) + "%", labelX, labelY + 10);

    lastAngle += angle;
  }
}


// Timeline Visualization
void drawTimeline() {
  float timelineHeight = height - 200;
  float dayWidth = (width - 100) / 31;
  
  // Draw timeline axis
  stroke(0);
  line(50, timelineHeight, width - 50, timelineHeight);
  
  // Plot points and connecting lines
  for(TransportRecord record : transportData) {
    int day = int(record.date.split("-")[0]);
    float x = 50 + (day - 1) * dayWidth;
    
    for(int i = 0; i < modes.length; i++) {
      if(record.mode.equals(modes[i])) {
        float y = map(record.duration, 0, 120, timelineHeight, timelineHeight - 200);
        fill(modeColors[i]);
        ellipse(x, y, 8, 8);
        
        // Draw connecting lines
        stroke(modeColors[i], 100);
        if(day > 1) {
          for(TransportRecord prev : transportData) {
            int prevDay = int(prev.date.split("-")[0]);
            if(prev.mode.equals(record.mode) && prevDay == day - 1) {
              float prevX = 50 + (prevDay - 1) * dayWidth;
              float prevY = map(prev.duration, 0, 120, timelineHeight, timelineHeight - 200);
              line(prevX, prevY, x, y);
              break;
            }
          }
        }
      }
    }
  }
  
  // Draw day labels
  fill(0);
  for(int day = 1; day <= 31; day += 5) {
    float x = 50 + (day - 1) * dayWidth;
    text(day, x, timelineHeight + 20);
  }
  
  // Draw legend
  float legendX = 50;
  float legendY = 100;
  for(int i = 0; i < modes.length; i++) {
    fill(modeColors[i]);
    ellipse(legendX, legendY + i * 20, 8, 8);
    fill(0);
    textAlign(LEFT);
    text(modes[i], legendX + 15, legendY + i * 20);
    textAlign(CENTER);
  }
}

// 3D Visualization
void draw3DView() {
  // Update rotation
  rotationY += (targetRotationY - rotationY) * 0.1;
  rotationX += (targetRotationX - rotationX) * 0.1;

  // Set up 3D view
  push();
  translate(width / 2, height / 2, 0);
  rotateX(rotationX);
  rotateY(rotationY);

  // Draw grid
  stroke(200);
  float gridSize = 300;
  int gridDivisions = 5;
  float spacing = gridSize / gridDivisions;

  for (int i = -gridDivisions; i <= gridDivisions; i++) {
    line(i * spacing, -gridSize / 2, -200, i * spacing, -gridSize / 2, 200);
    line(-gridSize / 2, -gridSize / 2, i * spacing, gridSize / 2, -gridSize / 2, i * spacing);
  }

  // Draw axis labels
  stroke(0);
  fill(0);
  textSize(12);

  // X-axis label (Days)
  push();
  translate(gridSize / 2 + 20, -gridSize / 2 - 10, 0);
  rotateY(-rotationY);
  rotateX(-rotationX);
  text("Days", 0, 0);
  pop();

  // Y-axis label (Duration)
  push();
  translate(0, -gridSize / 2 - 220, 0);
  rotateY(-rotationY);
  rotateX(-rotationX);
  text("Duration (mins)", 0, 0);
  pop();

  // Z-axis label (Modes)
  push();
  translate(0, -gridSize / 2 - 10, gridSize / 3 + 50);
  rotateY(-rotationY);
  rotateX(-rotationX);
  text("Modes", 0, 0);
  pop();

  // Draw values on X-axis (Days)
  for (int day = 0; day <= 30; day += 5) {
    float x = map(day, 0, 30, -gridSize / 2, gridSize / 2);
    push();
    translate(x, -gridSize / 2 - 10, 0);
    rotateY(-rotationY);
    rotateX(-rotationX);
    text(day, 0, 0);
    pop();
  }

  // Draw values on Y-axis (Duration)
  for (int y = 0; y <= 200; y += 50) {
    float yPos = map(y, 0, 200, -gridSize / 2, -gridSize / 2 - 200); // Adjusted direction
    push();
    translate(-gridSize / 2 - 20, yPos, 0);
    rotateY(-rotationY);
    rotateX(-rotationX);
    text(y, 0, 0);
    pop();
  }

  // Draw values on Z-axis (Modes)
  for (int i = 0; i < modes.length; i++) {
    float z = map(i, 0, modes.length - 1, -gridSize / 3, gridSize / 3);
    push();
    translate(0, -gridSize / 2 - 10, z);
    rotateY(-rotationY);
    rotateX(-rotationX);
    text(modes[i], 0, 0);
    pop();
  }

  // Calculate data for 3D view
  float[][][] data = new float[31][modes.length][2]; // [day][mode][count, totalDuration]

  for (TransportRecord record : transportData) {
    int day = int(record.date.split("-")[0]) - 1;
    for (int i = 0; i < modes.length; i++) {
      if (record.mode.equals(modes[i])) {
        data[day][i][0]++;
        data[day][i][1] += record.duration;
      }
    }
  }

  // Find maximum duration
  float maxDuration = 0;
  for (int day = 0; day < 31; day++) {
    for (int mode = 0; mode < modes.length; mode++) {
      maxDuration = max(maxDuration, data[day][mode][1]);
    }
  }

  // Draw 3D columns
  float columnWidth = 10;
  float maxHeight = 200;

  for (int day = 0; day < 31; day++) {
    for (int mode = 0; mode < modes.length; mode++) {
      if (data[day][mode][0] > 0) {
        float x = map(day, 0, 30, -gridSize / 2, gridSize / 2);
        float z = map(mode, 0, modes.length - 1, -gridSize / 3, gridSize / 3);
        float h = map(data[day][mode][1], 0, maxDuration, 0, maxHeight);

        push();
        translate(x, -gridSize / 2 - h / 2, z);
        fill(modeColors[mode]);
        noStroke();
        box(columnWidth, h, columnWidth);
        pop();
      }
    }
  }

  // Draw 3D legend
  float legendX = -gridSize / 2 - 50;
  float legendZ = -gridSize / 3;
  float legendSpacing = gridSize / (modes.length - 1);

  for (int i = 0; i < modes.length; i++) {
    push();
    translate(legendX, -gridSize / 2 - 20, legendZ + i * legendSpacing);
    fill(modeColors[i]);
    box(20, 20, 20);

    rotateY(-rotationY);
    rotateX(-rotationX);
    fill(0);
    textSize(12);
    text(modes[i], 40, 0);
    pop();
  }

  pop();
}



// UI Controls
void drawButtons() {
  String[] buttonLabels = {"Bar Chart", "Pie Chart", "Timeline", "3D View"};
  float buttonWidth = 120;
  float buttonHeight = 40;
  float startX = width/2 - (buttonLabels.length * buttonWidth)/2;
  
  for(int i = 0; i < buttonLabels.length; i++) {
    float x = startX + i * buttonWidth;
    float y = height - 50;
    
    boolean hover = mouseX >= x && mouseX <= x + buttonWidth &&
                   mouseY >= y && mouseY <= y + buttonHeight;
    
    fill(hover ? #E0E0E0 : #F0F0F0);
    stroke(0);
    rect(x, y, buttonWidth, buttonHeight, 5);
    
    fill(0);
    textSize(14);
    text(buttonLabels[i], x + buttonWidth/2, y + buttonHeight/2);
  }
}

void mousePressed() {
  float buttonWidth = 120;
  float buttonHeight = 40;
  float startX = width/2 - (4 * buttonWidth)/2;
  float buttonY = height - 50;
  
  for(int i = 0; i < 4; i++) {
    float x = startX + i * buttonWidth;
    if(mouseX >= x && mouseX <= x + buttonWidth &&
       mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
      currentView = i;
      break;
    }
  }
}

void mouseDragged() {
  if(currentView == 3) {
    targetRotationY += (mouseX - pmouseX) * 0.01;
    targetRotationX = constrain(targetRotationX + (mouseY - pmouseY) * 0.01, -PI/2, PI/2);
  }
}

// Data Generation
void generateData() {
  transportData = new ArrayList<TransportRecord>();
  
  for(int day = 1; day <= 31; day++) {
    int numRecords = int(random(2, 4));
    for(int i = 0; i < numRecords; i++) {
      String date = nf(day, 2) + "-03-2024";
      String mode = modes[int(random(modes.length))];
      int duration = int(random(15, 120));
      float distance = random(1, 15);
      
      transportData.add(new TransportRecord(date, mode, duration, distance));
    }
  }
}
