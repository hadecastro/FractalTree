
private double fractionLength = 0.6; 
private int smallestBranch = 200; 
private double branchAngle = 0.5;

public void setup() 
{   
	
	size(640,480);   
	noLoop();
	
} 
public void draw() 
{ 	
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   
	drawBranches(320,380,200,3*Math.PI/2);

}

public void mousePressed()
{

	smallestBranch = smallestBranch/2;
	if(smallestBranch < 10)
	{
		smallestBranch = 200;	
	}
	redraw();	
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here
	double angle1;
	double angle2;
	double angle3;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	angle3 = angle;

	branchLength = branchLength*fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int endX3 = (int)(branchLength*Math.cos(angle3) + x);
	int endY3 = (int)(branchLength*Math.sin(angle3) + y);


	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	line(x, y, endX3, endY3);

	if(branchLength > smallestBranch)
	{
		stroke(0, 255, 0);
		drawBranches(endX1, endY1, branchLength, angle1);
		stroke(0, 255, 0);
		drawBranches(endX2, endY2, branchLength, angle2);
		stroke(0, 255, 0);
		drawBranches(endX3, endY3, branchLength, angle3);
	
	}
	/*
	else  {
		noStroke();
		fill(50, 150, 50);
		ellipse(endX1, endY1, 5, 5);
		ellipse(endX2, endY2, 5, 5);
		ellipse(endX3, endY3, 5, 5);		
	}
*/

} 
