//compile room info and send it

// Get tilemap ID from the layer
var _layer_id   = layer_get_id(tile_layer_name); 
var _tilemap_id = layer_tilemap_get_id(_layer_id);

// Get tilemap dimensions in tiles
var _world_width = tilemap_get_width(_tilemap_id);
var _world_height = tilemap_get_height(_tilemap_id);

world_data = array_create(0);

for (var ty = 0; ty < _world_height; ty++) {
    for (var tx = 0; tx < _world_width; tx++) {
        // Get tile data (packed index + flags)
        var _tile = tilemap_get(_tilemap_id, tx, ty);
		var _tile_index = 0
		if (_tile)
			_tile_index = tile_get_index(_tile) * 2 - 1;
		
		array_insert(world_data, 0, _tile_index)
	}
}

global.world_data = world_data
global.world_width = _world_width;
global.world_height = _world_height;
global.texures_index = enviroment;

show_debug_message(global.world_data)
show_debug_message(global.world_width)
show_debug_message(global.world_height)
show_debug_message(global.texures_index)


room_goto(rm_camera_display)
