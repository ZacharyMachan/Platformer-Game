// core player logic / player inputs


key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(ord("W"));

//calculating movement
var _move = key_right - key_left; 

hsp = _move * walksp;

//gravity
vsp = vsp + grv;

if (place_meeting(x,y+1,oInvisibleWall) && (key_jump))
{
	vsp = -jumpsp
}
//horizontal collision
if (place_meeting(x+hsp,y,oInvisibleWall))		
{
	while (!place_meeting(x+sign(hsp),y,oInvisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//vertical collision
if (place_meeting(x,y+vsp,oInvisibleWall))		
{
	while (!place_meeting(x,y+sign(vsp),oInvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y	 + vsp;

//animation
if (!place_meeting(x,y+1,oInvisibleWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed =1;
	if (hsp == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

if (hsp != 0) image_xscale = sign(hsp);
	