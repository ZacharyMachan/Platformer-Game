// core player logic / player inputs


key_left = keyboard_check (vk_left);
key_right = keyboard_check (vk_right);
key_jump = keyboard_check_pressed (vk_space);

//calcukating movement
var _move = key_right - key_left; 

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oInvisibleWall)) && (key_jump)
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
if (place_meeting(x+vsp,y,oInvisibleWall))		
{
	while (!place_meeting(x+sign(vsp),y,oInvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y	 + vsp;