@tool
extends Button

@export_file("*.jpg") var image_path

func _ready() -> void:
	$Image.texture = load(image_path)
