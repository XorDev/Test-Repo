///@desc

var _jump = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space);

if (y>=460)
{
	y = 460;
	vspeed = 0;
	global.go = 0;
}

if _jump
{
	vspeed = -10;
	if !global.go y = ystart;
	global.go = 1;
}

if global.go
{
	vspeed += .5;
	x+=2;
	image_angle = -vspeed*3;
}

camera_set_view_pos(view_camera[0],x-360,0);