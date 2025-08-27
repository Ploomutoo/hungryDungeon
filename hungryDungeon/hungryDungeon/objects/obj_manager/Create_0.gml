if (instance_number(object_index) > 1)
	instance_destroy(self);

//put your enums for enviroments here
enum ENVIROMENTS {
	DEFAULT = 0
}

// put your textures here
texture_list = [
	sTiles128
]

// internals
global.textures = array_create(array_length(texture_list));
global.ready = false
global.cell_height = texture_size_y;
global.cell_width = texture_size_x;

// level info
global.world_data = [];
global.world_height = 0;
global.world_width = 0;
global.next_level = rm_test0;
global.texures_index = ENVIROMENTS.DEFAULT;

event_user(0);

//sprite_index = global.textures[0]
//image_speed = 0.1