# Eyn

> Create the Initialisation Builder

```kotlin
IdentitySession.CHECK_TYPE_BASIC // Default
IdentitySession.CHECK_TYPE_RIGHT_TO_WORK // Needed for Right to Work checks

val builder = IdentitySession.Builder()//
          .withEynApiKey("")
          .withMicroBlinkKey("")
          .withStatusType("")
          .withCheckType("")
```

> Set/update report detination email address

```kotlin
IdentitySession.getInstance().email = "email@address.com";
```

> Start the Eyn flow (handles entire flow)

```kotlin
startActivity(Intent(this, PrivacyActivity::class.java))
```

> Verification - Success / Failure

```kotlin
Success = ApiResults.Codes.SUCCESS
Failure = ApiResults.Codes.FAILURE

if (intent != null && intent.getIntExtra(IntentUtils.EXTRA_VERIFY_COMPLETE,
	ApiResults.Codes.GENERIC) == ApiResults.Codes.SUCCESS) {
	// Verification passed
} else {
	// Verification failed
}
```

You can use Verify to handle the entire Ui flow, in order to complete a verification of the user.

In order to start the flow an email address will need to set into the SDK, this is so that a report can be sent to the user(or yourselves) depending on the Use Case

The happy user flow, is as follows:

1. Tutorial Activity
2. 3X Product Information Screens
3. How To - Scan Identity
4. User actually scans Identity
5. How To - NFC Read from Identity
6. Data is read from Identity
7. Identity Info is show to the user
8. How To - Selfie
9. Camera for selfie
	- Looks for users Face
	- User smiles
	- Waits for 2 seconds of continuous smiling
10. Verification Process
11. Verified screen shown
12. Stops process and returns to previous Activity