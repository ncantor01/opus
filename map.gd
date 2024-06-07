
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#map_generate(1)
	pass 	

func map_generate(map_seed):
	var map_noise = FastNoiseLite.new()
	var noise_array = []
	print("here")
	for i in range(0,127):
		noise_array.append([])
		noise_array[i]=[]
		for j in range(0,127):
			noise_array[i].append([])
			noise_array[i][j] = map_noise.get_noise_2d(i,j)
	for i in noise_array:
		print(i)
			
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
