pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

// Name of the Project
rootProject.name = "PluginExamples"

// List of Directories for plugin
include("battery-stats")
project(":battery-stats").projectDir = file("plugins/battery-stats")

include("wallpaper")
project(":wallpaper").projectDir = file("plugins/wallpaper")