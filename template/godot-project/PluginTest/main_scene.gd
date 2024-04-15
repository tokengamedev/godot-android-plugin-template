extends Control

const TEMPLATE_PLUGIN_NAME = "Template"
@onready var label: Label = $Container/Label

var template_plugin = null

func _ready() -> void:
	if Engine.has_singleton(TEMPLATE_PLUGIN_NAME):
		template_plugin = Engine.get_singleton(TEMPLATE_PLUGIN_NAME)


func _on_button_pressed() -> void:
	if template_plugin:
		var result = template_plugin.sayHello("Token")
		label.label_settings.font_color = Color.PALE_GREEN
		label.text = result
	else:
		label.label_settings.font_color = Color.CORAL
		label.text = "Plugin '%s' not found." % TEMPLATE_PLUGIN_NAME
