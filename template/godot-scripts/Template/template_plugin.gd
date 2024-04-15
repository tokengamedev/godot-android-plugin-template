@tool
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var export_plugin : TemplatePlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	export_plugin = TemplatePlugin.new()
	add_export_plugin(export_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_export_plugin(export_plugin)
	export_plugin = null


class TemplatePlugin extends EditorExportPlugin:
	## TODO Step 3: Update the PLUGIN_NAME and PLUGIN_FILE_NAME here
	const PLUGIN_NAME = "Template"
	const PLUGIN_FILE_NAME = "template-release.aar"

	func _supports_platform(platform):
		if platform is EditorExportPlatformAndroid:
			return true
		return false

	func _get_android_libraries(platform, debug):
		## TODO Step 4: Update the path of the file if you have two version of the file
		return PackedStringArray([PLUGIN_NAME.path_join(PLUGIN_FILE_NAME)])
		#if debug:
			#return PackedStringArray([PLUGIN_NAME.path_join(PLUGIN_FILE_NAME % "debug") )
		#else:
			#return PackedStringArray([_plugin_name + "/bin/release/" + _plugin_name + "-release.aar"])

	func _get_android_dependencies(platform, debug):
		## TODO Step 5: Update the dependencies if any as mentioned in the dependency
		## in gradle build file
		if debug:
			return PackedStringArray([])
		else:
			return PackedStringArray([])

	func _get_name():
		return PLUGIN_NAME
