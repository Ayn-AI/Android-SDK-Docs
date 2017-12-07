# Initialisation

> Initialise SDK

```kotlin
Verify.init("your-api-key")
```

```java
Verify.Companion.init("your-api-key");
```

> Initialise SDK with debug

```kotlin
Verify.init("your-api-key", object : LicenceListener {
        override fun started() {

        }

        override fun failed(throwable: Throwable) {

        }

        override fun success() {

        }
      }
```

```java
Verify.Companion.init("your-api-key", new LicenceListener() {
        @Override public void started() {
          
        }

        @Override public void failed(@NonNull Throwable throwable) {

        }

        @Override public void success() {

        }
      });
```

You must initialise the SD with your API Key provided by Eyn before you can use the SDK, otherwise it **will** throw an Exception.

This process, does have a callback to make sure the process has completed before you're able to proceed. It should be a very quick process, but a network call is required.