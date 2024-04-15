import org.jetbrains.kotlin.gradle.plugin.mpp.pm20.util.archivesName

// Plugin level gradle file
plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

// Change according to the Plugin you are implementing
//-->

// Name of the plugin it will be accessed by Godot
val pluginName = "Wallpaper"
// Name of the package, where the plugin class exists.
val pluginPackage = "org.godotengine.plugin.android.examples.wallpaper"
// Version of the plugin
val pluginVersion = "1.0.0"
// Target android SDK
val pluginCompileSdk = 34
// The minimum Android version supported
val pluginMinSdk = 24

// <--

version = pluginVersion

android {
    namespace = pluginPackage
    compileSdk = pluginCompileSdk

    defaultConfig {
        minSdk = pluginMinSdk
        manifestPlaceholders["pluginName"] = pluginName
        manifestPlaceholders["pluginPackageName"] = pluginPackage
        archivesName = "$pluginName.$version"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    implementation("org.godotengine:godot:4.2.2.rc-SNAPSHOT")
}