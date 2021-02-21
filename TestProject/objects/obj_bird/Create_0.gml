///@desc Init

randomize();

//True when playing, false when not.
global.go = 0;
image_speed = .25;

function pipe_generate(_x)
{
	var _h = 336-irandom(192);
	instance_create_depth(_x,_h+64,0,obj_pipe);
	var _inst = instance_create_depth(_x,_h-64,0,obj_pipe);
	_inst.image_yscale = -1;
}