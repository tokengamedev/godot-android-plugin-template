package org.godotengine.plugin.android.examples.wallpaper

import android.app.WallpaperManager
import android.content.Context
import android.graphics.BitmapFactory
import android.widget.Toast
import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot

class WallpaperPlugin(godot: Godot): GodotPlugin(godot)  {

    override fun getPluginName() = "Wallpaper"

    private val context: Context =
        activity?.applicationContext ?: throw IllegalStateException()

    @UsedByGodot
    fun setWallpaper(path: String){

        val bitmap = BitmapFactory.decodeFile(path)
        val message = if (bitmap == null) {
            "Error! Invalid image file path."

        } else {
            val wallpaperManager = WallpaperManager.getInstance(context)
            wallpaperManager.clear()
            wallpaperManager.setBitmap(bitmap, null,true, WallpaperManager.FLAG_SYSTEM)
            "Wallpaper set successfully."
        }
        runOnUiThread {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
        }
    }
}
