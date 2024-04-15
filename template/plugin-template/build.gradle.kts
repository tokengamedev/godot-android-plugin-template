// Project Level Gradle File
plugins {
    id("com.android.library") version "8.2.0" apply false
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
        //maven("https://plugins.gradle.org/m2/")

        // Uncomment the below line if you are building on snapshot versions
        //maven("https://s01.oss.sonatype.org/content/repositories/snapshots/")
    }
}
