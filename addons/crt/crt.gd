@tool
@icon("res://addons/crt/icon.svg")
class_name CRT
extends CanvasLayer

# Material and update control
var material: ShaderMaterial
@export var update_in_editor: bool = true:
	set(value):
		update_in_editor = value
		if _should_update():
			visible = true
		else:
			visible = false

# Base resolution for pixel-perfect effects
@export var resolution: Vector2 = Vector2(320.0, 180.0):
	set(value):
		resolution = value
		_set_shader_param("resolution", resolution)

# Scanline effect
@export_range(0.0, 1.0) var scan_line_amount: float = 1.0:
	set(value):
		scan_line_amount = value
		_set_shader_param("scan_line_amount", value)

@export_range(-12.0, -1.0) var scan_line_strength: float = -8.0:
	set(value):
		scan_line_strength = value
		_set_shader_param("scan_line_strength", value)

# Screen curvature/warp effect
@export_range(0.0, 5.0) var warp_amount: float = 0.1:
	set(value):
		warp_amount = value
		_set_shader_param("warp_amount", value)

# Visual noise/interference
@export_range(0.0, 0.3) var noise_amount: float = 0.03:
	set(value):
		noise_amount = value
		_set_shader_param("noise_amount", value)

@export_range(0.0, 1.0) var interference_amount: float = 0.2:
	set(value):
		interference_amount = value
		_set_shader_param("interference_amount", value)

# Shadow mask/grille
@export_range(0.0, 1.0) var grille_amount: float = 0.1:
	set(value):
		grille_amount = value
		_set_shader_param("grille_amount", value)

@export_range(1.0, 5.0) var grille_size: float = 1.0:
	set(value):
		grille_size = value
		_set_shader_param("grille_size", value)

# Vignette
@export_range(0.0, 2.0) var vignette_amount: float = 0.6:
	set(value):
		vignette_amount = value
		_set_shader_param("vignette_amount", value)

@export_range(0.0, 1.0) var vignette_intensity: float = 0.4:
	set(value):
		vignette_intensity = value
		_set_shader_param("vignette_intensity", value)

# Chromatic aberration
@export_range(0.0, 1.0) var aberation_amount: float = 0.5:
	set(value):
		aberation_amount = value
		_set_shader_param("aberation_amount", value)

# Rolling line effect
@export_range(0.0, 1.0) var roll_line_amount: float = 0.3:
	set(value):
		roll_line_amount = value
		_set_shader_param("roll_line_amount", value)

@export_range(-8.0, 8.0) var roll_speed: float = 1.0:
	set(value):
		roll_speed = value
		_set_shader_param("roll_speed", value)

# Pixel sharpness/softness
@export_range(-4.0, 0.0) var pixel_strength: float = -2.0:
	set(value):
		pixel_strength = value
		_set_shader_param("pixel_strength", value)


func _ready() -> void:
	var color_rect = ColorRect.new()
	color_rect.color = Color.WHITE
	color_rect.set_anchors_preset(Control.PRESET_FULL_RECT)

	material = ShaderMaterial.new()
	material.shader = load("res://addons/crt/crt.gdshader")

	# Initialize all shader parameters
	_set_shader_param("resolution", resolution)
	_set_shader_param("scan_line_amount", scan_line_amount)
	_set_shader_param("scan_line_strength", scan_line_strength)
	_set_shader_param("warp_amount", warp_amount)
	_set_shader_param("noise_amount", noise_amount)
	_set_shader_param("interference_amount", interference_amount)
	_set_shader_param("grille_amount", grille_amount)
	_set_shader_param("grille_size", grille_size)
	_set_shader_param("vignette_amount", vignette_amount)
	_set_shader_param("vignette_intensity", vignette_intensity)
	_set_shader_param("aberation_amount", aberation_amount)
	_set_shader_param("roll_line_amount", roll_line_amount)
	_set_shader_param("roll_speed", roll_speed)
	_set_shader_param("pixel_strength", pixel_strength)

	color_rect.material = material
	add_child(color_rect)
	if _should_update():
		visible = true
	else:
		visible = false


# Helper function to safely set shader parameters
func _set_shader_param(param_name: String, value) -> void:
	if material:
		material.set_shader_parameter(param_name, value)


func _should_update() -> bool:
	if Engine.is_editor_hint():
		return update_in_editor
	return true
