@tool
extends EditorPlugin

# A class member to hold the editor export plugin during its lifecycle.
var export_plugin : WallpaperPlugin

func _enter_tree():
	# Initialization of the plugin goes here.
	export_plugin = WallpaperPlugin.new()
	add_export_plugin(export_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_export_plugin(export_plugin)
	export_plugin = null


class WallpaperPlugin extends EditorExportPlugin:
	## TODO Step 3: Update the PLUGIN_NAME and PLUGIN_FILE_NAME here
	const PLUGIN_NAME = "Wallpaper"
	const PLUGIN_FILE_NAME = "Wallpaper.1.0.0-release.aar"

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

		return PackedStringArray(["com.github.bumptech.glide:glide:4.14.2"])
		## in gradle build file
		# if debug:
		# 	return PackedStringArray([])
		# else:
		# 	return PackedStringArray([])

	func _get_name():
		return PLUGIN_NAME
