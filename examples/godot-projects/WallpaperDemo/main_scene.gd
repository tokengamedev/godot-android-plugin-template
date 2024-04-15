extends Control

const PLUGIN_NAME = "Wallpaper"

@onready var preview_image: TextureRect = $PreviewImage

var wallpaper_plugin = null
var current_image_file := ""
var user_location := "user://"


func _ready() -> void:
	preview_image.texture = null
	if Engine.has_singleton(PLUGIN_NAME):
		wallpaper_plugin = Engine.get_singleton(PLUGIN_NAME)

	for child in $Buttons.get_children():
		if child is Button:
			child.pressed.connect(_on_button_pressed.bind(child))


func _on_button_pressed(button: Button) -> void:
	current_image_file = button.image_path
	preview_image.texture = load(current_image_file)


func _on_set_wallpaper_pressed() -> void:
	# Logic:
	# Steps to set a selcted image as wallpaper.
	# 1. Select a image to view (Image is imported as CompressedTexture2D
	# 2. Copy the image to user folder
	# - Image will not be accessible in android due to security reasons hence to copy
	# - Duplicate of Images as (Image has to be imported as Image) in order to save
	# - General DirAccess.copy functions don't work so load it as image and save

	if wallpaper_plugin:
		if current_image_file:
			var file = user_location.path_join("wallpaper.jpg")
			# load as Image
			var img = load("res://images_copy".path_join(current_image_file.get_file()))

			# Save in user folder for accesble to plugin
			img.save_jpg(file)

			# Call to set the wallpaper
			wallpaper_plugin.setWallpaper(ProjectSettings.globalize_path(file))
	else:
		printerr("Plugin 'Wallpaper' not found.")
