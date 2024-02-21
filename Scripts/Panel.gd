extends Panel

var road_network: Node3D

func _ready():
	road_network = get_node("/root/CityGenerator/RoadNetwork") as Node3D
	if road_network == null:
		print("RoadNetwork not found")

	for button in self.get_children():
		button.pressed.connect(on_pressed.bind(button))

func on_pressed(button):
	print(button.name)
	if button.name == "GenerateRoads":
		road_network.generate_road_network()
