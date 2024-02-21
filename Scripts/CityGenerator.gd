extends Node3D

# Parameters for city generation
var rows = 10
var cols = 10
var building_spacing = 10.0

# Called when the node enters the scene tree for the first time.
func _ready():
	#position_camera()
	#generate_city()
	#await get_tree().process_frame
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#generate_city()
	pass

func generate_city():
	for i in range(rows):
		for j in range(cols):
			# Placeholder for a building
			var building = BoxMesh.new()  # This is just a placeholder, replace with your building scene
			var instance = MeshInstance3D.new()
			instance.mesh = building
			add_child(instance)
			instance.transform.origin = Vector3(i * building_spacing, 0, j * building_spacing)

func position_camera():
	# Assuming the camera is a direct child of the CityGenerator node
	var camera = Camera3D.new()
	add_child(camera)
	camera.current = true
	camera.global_transform.origin = Vector3(rows * building_spacing / 2, 50, -(cols * building_spacing / 2) - 1)
	camera.look_at(Vector3(rows * building_spacing / 2, 0, cols * building_spacing / 2), Vector3.UP)
