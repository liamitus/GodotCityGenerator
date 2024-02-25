extends Panel

var city_ground: Node3D
var road_network: Node3D

var frequency_slider: HSlider
var octaves_slider: HSlider

func _ready():
    city_ground = get_node("/root/CityGenerator/CityGround") as Node3D
    if city_ground == null:
        print("CityGround not found")

    road_network = get_node("/root/CityGenerator/RoadNetwork") as Node3D
    if road_network == null:
        print("RoadNetwork not found")

    for button in self.get_children():
        button.pressed.connect(on_pressed.bind(button))

func on_pressed(button):
    print(button.name + " pressed")
    if button.name == "GenerateTerrain":
        city_ground.render_elevation_texture()
    if button.name == "GenerateRoads":
        road_network.generate_road_network()

func _on_frequency_slider_value_changed(value):
    # Update the frequency in the city_ground script
    city_ground.update_noise_parameter("frequency", value)
    city_ground.render_elevation_texture()

func _on_octaves_slider_value_changed(value):
    # Update the octaves in the city_ground script
    city_ground.update_noise_parameter("octaves", int(value))
    city_ground.render_elevation_texture()
