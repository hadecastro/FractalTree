private double fractionLength = .68; 
private int smallestBranch = 10; 
private double branchAngle = 0.5;
private double fLength = 0.1;
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
	drawBranches(320,380,100,3*Math.PI/2);  //will add later 
} 

public void mouseClicked()
{

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
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
		drawBranches(endX3, endY3, branchLength, angle3);
	}
} 
