# VerifyNfc

> Start NFC Scan

```kotlin
```

```java
startActivityForResult(new Intent(this, DetectingNFCDataActivity.class), REQUEST_CODE);
```

> Scan Result

```kotlin
```

```java
if (requestCode == REQUEST_ID_READ) {
	if (resultCode == ApiResults.Codes.RESULT_ID_READ_COMPLETE) {
		// Result successful
	} else {
		// Result unsuccessful
    }
}
```

> Show User Info (using Verify Ui)

```kotlin
```

```java
startActivity(new Intent(this, DisplayReadDataActivity.class));
```

> Show User Info

```kotlin
```

```java
IdentityDocument identityDocument =
	IdentitySession.getInstance().getUserIdentity().getIdDoc();

userName.setText(identityDocument.getName());
userGender.setText(identityDocument.getGender());
userNationality.setText(identityDocument.getNationality());
userBirthPlace.setText(identityDocument.getIssuingState());

// We provide a formatter, or you can use the original value
userDoB.setText(
	IdentityDocument.getFormattedDate(identityDocument.getDateOfBirth()));
userCardExpiry.setText(
	IdentityDocument.getFormattedDate(identityDocument.getExpirationDate()));

// Required to use the image utilities, to display the image from the chip
userImage.setImageBitmap(
	ImageUtils.identityFaceImageToBitmap(identityDocument));
```

Captures the users face (selfie).

Face detection, is used to make sure that the users face is fully visible and that all landmarks on the users face is visible.

The following results are as follows:

1. RESULT_FACE_SCAN_SUCCESS
2. RESULT_FACE_SCAN_FAILED

Once the information has been retrived there are two ways to display the data:

1. Using the provided Verify UI
2. Implementing the Ui, by accessing `IdentityDocument` directly