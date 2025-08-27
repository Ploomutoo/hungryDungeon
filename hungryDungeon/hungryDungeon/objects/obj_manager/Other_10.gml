// build out textures
var _size = array_length(texture_list);
for (var _i = 0; _i < _size; _i++){
	var texture_x_count = round(sprite_get_width(texture_list[_i])/texture_size_x)
	var texture_y_count = round(sprite_get_height(texture_list[_i])/texture_size_y)
	
	var surf = surface_create(texture_size_x, texture_size_y);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	var first = true;
	
	for (var _y = 0; _y < texture_y_count; _y++){
		for (var _x = 0; _x < texture_x_count; _x++){
			if (_x == 0 && _y == 0)
				continue;
			
			for (var _j = 0; _j < 2; _j++){
				surface_set_target(surf);
				draw_clear_alpha(c_black, 0);
				var color = c_white;
				if( _j != 0)
					color = c_grey;
				draw_sprite_part_ext(texture_list[_i], 0, texture_size_x * _x, texture_size_y * _y, texture_size_x, texture_size_y, 0, 0, 1, 1, color, 1);		
				surface_reset_target();

				if (first)
					global.textures[_i] = sprite_create_from_surface(surf, 0, 0, texture_size_x, texture_size_y, false, false, 0, 0);
				else
					sprite_add_from_surface(global.textures[_i], surf, 0, 0, texture_size_x, texture_size_y, false, false);
				
				first = false
			}
		}
	}
	
	surface_free(surf);
}
