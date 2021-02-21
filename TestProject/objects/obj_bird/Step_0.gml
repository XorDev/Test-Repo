///@desc Move

//Check flap buttons
var _flap = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space);
//Clamp to ceiling
y = max(y,0);

//If you hit the floor or pipe, stop
if (y>=460) || place_meeting(x,y,obj_pipe)
{
	vspeed = 0;
	y = min(y,460);
	global.go = 0;
	image_speed = 0;
}

//Flap
if _flap
{
	vspeed = -8;
	
	//Reset if the game ended
	if !global.go
	{
		score = 0;
		image_speed = .25;
		instance_destroy(obj_pipe);
		x = xstart;
		y = ystart;
		
		//Start with 4 pipes.
		for(var i = 0;i<4;i++)
		{
			pipe_generate(x+480+i*180);
		}
		global.go = 1;
	}
}

//Update movement
if global.go
{
	vspeed += .5;
	x+=2;
	image_angle = -vspeed*3;
	
	//Make sure there are pipes ahead!
	if instance_number(obj_pipe)<8
	{
		pipe_generate(x+480);
	}
}

var _x = lerp(camera_get_view_x(view_camera[0]),x-240,.1);
camera_set_view_pos(view_camera[0],_x,0);