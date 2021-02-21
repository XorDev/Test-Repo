///@desc

var _jump = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space);

y = max(y,0);

if (y>=460) || place_meeting(x,y,obj_pipe)
{
	vspeed = 0;
	y = min(y,460);
	global.go = 0;
	image_speed = 0;
}

if _jump
{
	vspeed = -8;
	if !global.go
	{
		image_speed = .25;
		instance_destroy(obj_pipe);
		x = xstart;
		y = ystart;
		for(var i = 0;i<4;i++)
		{
			var _h = 336-irandom(192);
			instance_create_depth(x+360+i*180,_h+64,0,obj_pipe);
			var _inst = instance_create_depth(x+360+i*180,_h-64,0,obj_pipe);
			_inst.image_yscale = -1;
		}
	}
	global.go = 1;
}

if global.go
{
	vspeed += .5;
	x+=2;
	image_angle = -vspeed*3;
	
	if instance_number(obj_pipe)<8
	{
		var _h = 336-irandom(192);
		instance_create_depth(x+360,_h+64,0,obj_pipe);
		var _inst = instance_create_depth(x+360,_h-64,0,obj_pipe);
		_inst.image_yscale = -1;
	}
}

camera_set_view_pos(view_camera[0],x-360,0);