extends MeshInstance3D

# Configuration
var map_size = Global.map_size

var noise_frequency = 0.05
var noise_octaves = 5

func _ready():
	# Create plane mesh
	var plane = PlaneMesh.new()
	plane.size = map_size
	self.mesh = plane

func render_elevation_texture():
	# Prepare noise parameters
	var noise_params = {
		"type": FastNoiseLite.TYPE_PERLIN,  # Assuming Perlin as the default type
		"fractal_type": FastNoiseLite.FRACTAL_FBM,  # Assuming FBM as the default fractal type
		"octaves": noise_octaves,
		"frequency": noise_frequency
	}
	
	# Generate and apply texture using updated noise parameters
	var texture = generate_elevation_texture(map_size.x, map_size.y, noise_params)
	var material = StandardMaterial3D.new()
	material.albedo_texture = texture
	self.material_override = material

func generate_elevation_texture(width, height, noise_params):
	var image = Image.create(int(width), int(height), false, Image.FORMAT_RGBA8)
	var noise = FastNoiseLite.new()
	
	# Apply noise parameters from arguments
	noise.noise_type = noise_params["type"]
	noise.set_fractal_type(noise_params["fractal_type"])
	noise.fractal_octaves = noise_params["octaves"]
	noise.frequency = noise_params["frequency"]

	# (Consider adding blending of different noise types here)

	for x in range(image.get_width()):
		for y in range(image.get_height()):
			# (Adjust noise generation logic based on blended noise maps)
			var noise_value = noise.get_noise_2d(x, y) * 0.5 + 0.5
			image.set_pixel(x, y, Color(noise_value, noise_value, noise_value, 1))

	var texture = ImageTexture.create_from_image(image)
	return texture
	

func update_noise_parameter(param, value):
	if param == "frequency":
		noise_frequency = value
	elif param == "octaves":
		noise_octaves = value
	render_elevation_texture()
