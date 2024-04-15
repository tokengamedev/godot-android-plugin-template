package org.godotengine.plugin.android.template

import org.godotengine.godot.Godot
import org.godotengine.godot.plugin.GodotPlugin
import org.godotengine.godot.plugin.UsedByGodot

class TemplatePlugin(godot: Godot): GodotPlugin(godot)  {


    override fun getPluginName() = "Template"

    @UsedByGodot
    fun sayHello(name: String) = "Hello $name"

}