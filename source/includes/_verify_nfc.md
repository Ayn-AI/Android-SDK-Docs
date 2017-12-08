# EynIdDocument

> Capture ID Document Info

```kotlin
```

```java
startActivityForResult(new Intent(this, CaptureIdDocumentActivity.class), REQUEST_CODE);
```

> Capture ID Result

```kotlin
```

```java
if (requestCode == REQUEST_CODE) {
	if (resultCode == ApiResults.Codes.RESULT_ID_SCAN_COMPLETE) {
		// Result successful
	} else {
		// Result unsuccessful
    }
}
```

> Start Id Document Chip Data

```kotlin
```

```java
startActivityForResult(new Intent(this, ReadIdDocumentChip.class), REQUEST_CODE);
```

> Scan Result

```kotlin
```

```java
if (requestCode == REQUEST_CODE) {
	if (resultCode == ApiResults.Codes.RESULT_ID_READ_COMPLETE) {
		// Result successful
	} else {
		// Result unsuccessful
    }
}
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

This module interacts with the ID Document. With two main purposes:

1. Capture ID Document (Image and MRZ)
2. Scan ID Document Chip