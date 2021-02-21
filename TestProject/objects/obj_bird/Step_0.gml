///@desc

x+=2*(y<470);
y = min(y,470);

if (y<470)
{
	vspeed += .5;
	if mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)
	{
		vspeed = -10;	
	}
}

camera_set_view_pos(view_camera[0],x-360,0);