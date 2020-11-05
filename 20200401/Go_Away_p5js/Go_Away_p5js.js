var circles = [];

function setup() {
    createCanvas(900, 900);
    noStroke();
    noCursor();
    ellipseMode(CENTER);
    colorMode(HSB, 255, 255, 255);
    
    background(0);

    // 描画用の円を生成
    circles.push(new LightCircle(0, 900.0, 0)); // 朱
    circles.push(new LightCircle(30, 900.0, 150)); // 金
    circles.push(new LightCircle(60, 900.0, 300)); // 黄緑
    circles.push(new LightCircle(90, 900.0,  450)); // 緑
    circles.push(new LightCircle(120, 900.0, 600)); // 水色
    circles.push(new LightCircle(150, 900.0, 750)); // 青
}

function draw() {
    // 半透明の黒
    fill(0, 5/360.0);
    rect(0, 0, width, height);
    
    // 中心を基準にして描画
    push();
    translate(width/2, height/2);
    circles.forEach(function(item, _, _) {
        item.draw();
    })
    pop();
}

class LightCircle {

    // var hue; // 色相
    // var y; // 円の最大直径
    // var outY; // 外側円の直径
    // var inY; // 内側円の直径
    // var startFrame; // 描画開始時のframeCount値
    
    constructor(hue, y, startFrame) {
        this.hue = hue;
        this.y = y;
        this.outY = y;
        this.startFrame = startFrame;
    }
    
    draw() {
        if (frameCount < this.startFrame) return;
        //inY = y - outY;
        
        push();
        rotate(radians(28)*(frameCount+this.startFrame));
        fill(this.hue, 150, 200);
        rect(0, this.outY, this.outY*0.1, this.outY*0.1);
        //rect(0, inY-inY*0.1, inY*0.1, inY*0.1);
        stroke(this.hue, 150, 360);
        noFill();
        ellipse(0, 0, this.outY*2, this.outY*2);
        //ellipse(0, 0, inY*2,  inY*2);
        noStroke();
        pop();
        
        // 直径が小さくなれば変化量が少なくなる
        this.outY -= this.outY / (this.y/2);
        if (frameCount%this.y-this.startFrame == 0) this.outY = this.y;
    }
    
}