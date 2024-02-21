extends Node3D

# Define road network parameters
var grid_size = 10
var road_width = 2.0
var block_size = 50.0

func _ready():
	pass

func generate_road_network():
	for i in range(grid_size):
		for j in range(grid_size):
			# Horizontal roads
			var road_h = BoxMesh.new()
			road_h.size = Vector3(block_size, road_width, road_width)
			var road_instance_h = MeshInstance3D.new()
			road_instance_h.mesh = road_h
			road_instance_h.transform.origin = Vector3(i * block_size, 0, j * block_size - block_size / 2)
			add_child(road_instance_h)
			
			# Vertical roads
			var road_v = BoxMesh.new()
			road_v.size = Vector3(road_width, road_width, block_size)
			var road_instance_v = MeshInstance3D.new()
			road_instance_v.mesh = road_v
			road_instance_v.transform.origin = Vector3(i * block_size - block_size / 2, 0, j * block_size)
			add_child(road_instance_v)
