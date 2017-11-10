# Setup

> Add Jitpack to your **projects** build.gradle file

```gradle
allprojects {
 repositories {
    jcenter()
    maven { url "https://jitpack.io" }
 }
}
```

We use Jitpack to distribute our SDK, to make updating and versioning easier. 

> Add the SDK to your apps build.gradle dependancy list

```gradle
dependencies {
    compile 'com.github.Ayn-AI.IDVerify:verify:1.0.2'
    compile 'com.github.Ayn-AI.IDVerify:verifyApi:1.0.2'
    compile 'com.github.Ayn-AI.IDVerify:verifyCore:1.0.2'
    compile 'com.github.Ayn-AI.IDVerify:verifyFace:1.0.2'
    compile 'com.github.Ayn-AI.IDVerify:verifyNfc:1.0.2'
    compile 'com.github.Ayn-AI.IDVerify:verifyLive:1.0.2'
}
```

> Gradle dependancy resolution

```shell
gradle app:dependencies

or

./gradlew app:dependencies
```

Currently we have no transistive libraries, but we are using Gradle 3.0 so dependancy issues should be minimal.

If there is a problem with a clashing dependancy then use the Gralde dependancy tree to discover which is clashing and alert Eyn if there is a problem when you remove it.