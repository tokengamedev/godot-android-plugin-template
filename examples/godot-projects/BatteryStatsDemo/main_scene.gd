extends Control

const PLUGIN_NAME = "BatteryStats"


@onready var status: Label = $Container/Status

var battery_stats_plugin = null

func _ready() -> void:

	status.text = ""

	if Engine.has_singleton(PLUGIN_NAME):
		battery_stats_plugin = Engine.get_singleton(PLUGIN_NAME)


func _on_button_pressed() -> void:
	if battery_stats_plugin:
		var result = battery_stats_plugin.checkBatteryStatus()
		if result:
			status.text = get_status_text(result.status)
			status.text += " (%s%%)" % result.percent
		else:
			status.text = "Unable to check the status"
	else:
		status.text = "Plugin [%s] not found." % PLUGIN_NAME

func get_status_text(status:int) -> String:
	match(status):
		1: return "Unknown"
		2: return "Charging"
		3: return "Discharging"
		4: return "Not Charging"
		5: return "Full"
		_: return "-"
