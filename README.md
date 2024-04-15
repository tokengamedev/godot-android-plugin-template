# Android Export Plugin Template
This repository serves as container for template for developing `android export plugins` for Godot.

Android export plugins are editor plugins that offer custom functionality specifically designed for Android devices. Common examples of such plugins include integrating Google Play Billing or Google Play services.

This template/examples are designed to be used with Godot Plugin framework V2, which is available in Godot 4.2.0 or later versions of Godot.


### Usage:

To create an android export plugin there are two parts:
1. Build a Android archive library (.aar)
2. Create script files for registering the library with godot project


![Image](assets\plugin.png)


> [!NOTE]
> In V1 of framework it used to be declarative syntax using a .gdap file but in V2 of framework it is imperative and uses code.


### Contents:

This repository consists of:

- **[template (directory):](./template/README.md)** Simple template which is beginner friendly. It serves as quick-start for developing a android export plugin, which contains no bells and whistles.

- **[examples (directory):](./examples/README.md)** Real world simple plugins  implementation with advanced configurations to ease the development of plugins, which can be used for your requirement.
  - BatteryStats - Provides stats about the Battery of the android devices
  - Wallpaper - Provides a way to change the wallpaper of the HOME screen

> [!IMPORTANT]
> For more prebuilt android plugins for your project, you may look into [Godot Android Modules](https://github.com/tokengamedev/godot-android-modules)


### Support:

If you have any questions, feedbacks or challenges, please shoot an email to [Token GameDev](token.gamedev@gmail.com). I am happy to help or improve.

Should this aid in your development and prove beneficial, feel free to spread the word. Your support through a modest donation on [Buying a coffee](https://www.buymeacoffee.com/tokengamedev) would be greatly valued and appreciated.