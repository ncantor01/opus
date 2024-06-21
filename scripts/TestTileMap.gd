extends TileMap


@export var map_noise : NoiseTexture2D
@export var tiles_across :int = 16
@export var ocean_percent:float = 1;
@export var map_width = 500
@export var map_height = 500

func create_noise(x_pos_abs,y_pos_abs,width,height):
	var x_pos = 0
	var y_pos = 0
	var noise_val = 0
	var normalized_noise = 0
	for x in range(width):
		for y in range(height):
			x_pos = x+x_pos_abs
			y_pos = y+y_pos_abs
			noise_val = map_noise.get_noise_2d(x_pos,y_pos)
			normalized_noise = abs(noise_val) * 256
			
			set_cell(0,Vector2i(x_pos,y_pos),int(map_noise.get_noise_2d(x_pos,y_pos)+ocean_percent),
				Vector2i(normalized_noise/(tiles_across*self.tile_set.tile_size.x),
				 int(normalized_noise) % (tiles_across*self.tile_set.tile_size.x)))
			
func _ready():
	print("here")
	map_noise.set_noise_type(3)
	map_noise.set_seed(randi())
	print(map_noise.get_cellular_jitter())
	create_noise(-1*map_width,-1*map_height,2*map_width,2*map_height)
	pass # Replace with function body.

