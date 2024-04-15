package org.godotengine.plugin.android.examples.batterystats

import android.content.Context
import android.content.Context.BATTERY_SERVICE
import android.os.BatteryManager
import android.os.Build
import org.godotengine.godot.Dictionary
import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot


class BatteryStatsPlugin(godot: Godot): GodotPlugin(godot)  {

    override fun getPluginName() = "BatteryStats"

    private val context: Context =
        activity?.applicationContext ?: throw IllegalStateException()

    @UsedByGodot
    fun checkBatteryStatus(): Dictionary {
        // Fetch the Battery Manager service
        val batLevel = context.getSystemService(BATTERY_SERVICE) as BatteryManager

        val dict = Dictionary()

        // Check for capacity
        dict["percent"] = batLevel.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        // Check for status (-1 if not supported)
        dict["status"]= if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            batLevel.getIntProperty(BatteryManager.BATTERY_PROPERTY_STATUS)
        } else {
            -1
        }
        return dict
    }
}