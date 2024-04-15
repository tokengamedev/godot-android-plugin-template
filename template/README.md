# Android Export Plugin Template - Template

This template provides a basic structure about building an android export plugin. If you want more advanced configuration, you can check out the [examples](../examples/README.md) section

### Contents:
  - [plugin-template](./plugin-template/): Plugin part written in Kotlin, which has to be edited and assembled using gradle to create the android archive file (aar file)
  - [godot-scripts](./godot-scripts/): Contains script template that has to be added along with aar file for godot project to register and use the plugin.
  - [godot-project](./godot-project/): Contains a demo godot project using the scripts and aar file.

### Initial Setup

**Pre-requisites:**
- Godot Engine: 4.2.0 or higher
- Android Studio or any other tool for gradle build
> [!NOTE] 
> 1. Works with Android studio - Hedgehog or higher. It may work in previous versions, but not tested
> 2. You can even create the arr using VS Code, but that is also not tested or goal of this exercise.


### Part 1: Building the AAR File

To build the AAR file, we will be using the `godot-android-plugin-template\template\plugin-template` directory only. 

#### Step 1: Renaming Directory

- Rename `plugin-template` directory to name of the plugin library project of your willing in the file manager of OS
  - e.g., `my-plugins`
- Rename `template` directory under `plugin-template` to name of the plugin sub-project of your willing in the file manager of OS
  - e.g., `hello`

> [!NOTE] 
> In gradle build system, there is a root project and one or more sub-projects. Plugin has to be created as part of one of the sub projects.
> If you want to create multiple plugins you can create multiple sub projects under the same root project
>
> Checkout: https://github.com/tokengamedev/godot-android-modules


#### Step 2: Editing project and sub-project name

> [!NOTE]
> You can do this step in a text editor or opening the directory in Android studio.

> [!WARNING]
> The project may not display properly in android studio unless the sub-project names are defined properly

**Project Name:**

In the root folder `settings.gradle.kts` file, Update the project name as given below

```kts
// Name of the Project - "MyPlugins"
rootProject.name = "MyPlugins"
```

**Sub-Project Name:**

In the root folder `settings.gradle.kts` file, Update the sub-project name as given below
```kts
// Name of the Sub-Project - "hello" and path is  "./hello"
include(":hello")

// In case you want to change the directory of plugin
// Name of the Sub-Project - "hello" and path is  "./plugins/hello"
include(":hello").projectDir = file("plugins/hello")
```

#### Step 3: Linking the project to Godot library

Open the `plugin-template` or`my-plugins` directory/gradle project in android studio

To link the Godot library, open the `build.gradle.kts` under the `template` or `hello` directory

add/edit the dependencies as given below

```kts
// Update with the latest stable version of the library in maven repo
dependencies {
    implementation("org.godotengine:godot:4.2.1.stable")
}
```

In case you want to link to the latest version of dev releases

```kts
// Update with the latest snapshot version of the library in the repo
dependencies {
    implementation("org.godotengine:godot:4.2.2.rc-SNAPSHOT")
}
```
Also add the snapshot repository path in the list of repository paths to look for the dependency.

To do that add the following in the `build.gradle.kts` under the root folder

```kts
allprojects {
    repositories {
        //...other repos like mavenCentral()
        maven("https://s01.oss.sonatype.org/content/repositories/snapshots/")
    }
}
```

#### Step 4: Creating Plugin Class and Package

Inside the plugin sub-project:

- create/update the package and its folder structure as per the requirement
e.g., change `package org.godotengine.plugin.android.template` to `org.godotengine.plugin.android.hello` and its folder structure from `src\main\kotlin\org\godotengine\plugin\android\template` to 
`src\main\kotlin\org\godotengine\plugin\android\hello`

- Create/Update the plugin Main class and define as per the need
```kts
class HelloPlugin(godot: Godot): GodotPlugin(godot)  {

    override fun getPluginName() = "Hello"

    @UsedByGodot
    fun sayHello(name: String) = "Hello $name"
}
```

>[!TIP]
> The name of the plugin in `getPluginName` is the Plugin Name to be used for accessing the plugin from godot


#### Step 5: Updating Gradle file for build

Open the `template` or `hello` Plugin build file and edit the following as per need:

```kts
// Name of the plugin it will be accessed by Godot. It is same as specified in class getPluginName
val pluginName = "Hello"
// Name of the package, where the plugin class exists.
val pluginPackage = "org.godotengine.plugin.android.template"
// Version of the plugin
val pluginVersion = "1.0.0"
// Target android SDK
val pluginCompileSdk = 34
// The minimum Android version supported
val pluginMinSdk = 24
```

#### Step 6: Updating manifest

To bind the Class name with the PluginName add/update the following in the manifest file

```xml
 <meta-data android:name="org.godotengine.plugin.v2.Hello"
            android:value="org.godotengine.plugin.android.template.HelloPlugin"/>
```


#### Step 7: Assemble/Make

To make the project (create aar file) first sync the gradle build and then using the Make Project option, build the aar file

The output will be available at `hello/build/outputs/aar`

The file name will be `hello-debug.aar`

The name is the format of `<sub-project-name>-<build-variant-name>.aar`

To change the build variant Goto `Build > Change Build Variant...` and change the variant for the sub-project



### Part 2: Creating the Scripts

To create scripts, we will be using the `godot-scripts` directory only. 

#### Step 1: Create/Update plugin.cfg

Create\Update the `plugin.cfg` as per your need. It will display in the Project Settings of the Godot Project.

> [!NOTE]
> The script file used here is to create a singleton to be accessible inside Godot project. 
```ini
[plugin]

# Name it will display in settings
name="Hello Plugin" 
description="A plugin Template" 
author="Token Gamedev"
version="1.0.0"
# Script file which creates the singleton
script="hello_plugin.gd" 
```

#### Step 2: Create/ Update the plugin script

To create the script file, copy the template_plugin.gd and rename it according to the script file name mentioned in plugin.cfg i.e., `hello_plugin.gd`

The script file should be tool script and extending `EditorPlugin` class, which will register/unregister a class extending from `EditorExportPlugin` on enter and exit tree respectively

Update the script file to ensure the Plugin Name is correctly specified

```gdscript
# Name of the plugin it should be same name as defined in the plugin class in aar file
const PLUGIN_NAME = "Template"
# Name of the file in the directory
const PLUGIN_FILE_NAME = "template-release.aar"
```


### Part 3: Building the Project.

#### Step 1: Creating the addon in the project

- Create a Godot project or use an existing project for test purpose
- Create an `addons` folder in the root if it does not exist.
- Create a directory under addons with the plugin name (To easily identify and avoid conflict)
- Copy the aar file into it
- Copy the script files into
  
At the end it somewhat will look like this.
> [!NOTE] 
> This is just an example and can be changed as per your needs

```
<Project Dir>
|-- addons
    |-- <Plugin Directory>
        |-- <myplugin-script>.gd
        |-- plugin.cfg
        |-- <my-plugin>.aar

```

#### Step 2: Exporting the project

- Install build templates for android if it is not installed already
  `> Project > Install Android Build Template..`

> [!NOTE] 
> if you do not have the android built template for the current version of godot, you may have to download first. 

- Add an android export preset if it is not there
  `> Project > Export..` then `Add`

- Check the `Use Gradle build` flag for custom builds in the properties.

- Export according to the needs and deploy into a simulator or device for testing/use


### Engineering 

| --                    | --                                        |
| --------------------- | ----------------------------------------- |
| Godot Engine Version  | (4.2.+) V2 plugin architecture            |
| Android SDK (Minimum) | 24 (Build.VERSION_CODES.N)                |
| Android SDK (Target)  | 34 (Build.VERSION_CODES.UPSIDE_DOWN_CAKE) |
| Java Version(jdk)     | 17                                        |
| Kotlin version(JVM)   | 1.9.10                                    |
| Android Gradle Plugin | 8.2.0                                     |
| Gradle                | 8.2                                       |


