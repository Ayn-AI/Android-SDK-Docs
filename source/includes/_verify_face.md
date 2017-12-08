# EynFace

> Take a Selfie

```kotlin
```

```java
startActivityForResult(new Intent(this, FaceDetectionActivity.class), REQUEST_CODE);
```

> Selfie Result

```kotlin
```

```java
if (requestCode == REQUEST_CODE && resultCode == RESULT_FACE_SCAN_SUCCESS) {
	// Selfie was captured successfully
}
```

Captures the users face (selfie).

Face detection, is used to make sure that the users face is fully visible and that all landmarks on the users face is visible.

The following results are as follows:

1. RESULT_FACE_SCAN_SUCCESS
2. RESULT_FACE_SCAN_FAILED