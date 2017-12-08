# VerifyApi

> Verifying with Ui

```kotlin
```

```java
IdentitySession.REQUEST_VERIFY_IDENTITY
IdentitySession.REQUEST_RIGHT_TO_WORK

IdentitySession.getInstance().setStatus(IdentitySession.REQUEST_VERIFY_IDENTITY);

startActivity(new Intent(this, VerifyActivity.class));
```

> Retrieve Result

```kotlin
```

```java
if (getIntent().getIntExtra(IntentUtils.EXTRA_VERIFY_COMPLETE,
	ApiResults.Codes.GENERIC) == ApiResults.Codes.SUCCESS))
	{
		// Verify was successful
	}
```

> Setting Verification Type

```kotlin
```

```java
IdentitySession.REQUEST_VERI_IDENTITY
IdentitySession.REQUEST_RIGHT_TO_WORK

private void verification() {
	startVerification(
    	new UploadVerification(identitySession, identityClient));
}

private void verification(@IdentitySession.StatusTypes @NonNull String status) {
	startVerification(
    	new UploadVerification(identitySession, status, identityClient));
}
```

> Start custom Verification

```kotlin
```

```java
private void startVerification(@NonNull UploadVerification uploadVerification) {
	FaceBiometry faceBiometry = identitySession.getUserIdentity().getFaceBio();
	IdentityDocument document = identitySession.getUserIdentity().getIdDoc();
	String sessionJson = identitySession.getIdentityCheckSessionJSON();

	if (faceBiometry == null || document == null || TextUtils.isEmpty(sessionJson)) {
		// Something is wrong, show your error state
	}

	/*
	verifyUser returns a Disposable, highly recommended that you use with one appropriatly
	*/
	faceBiometry.verifyUser(
		getApplicationContext(),//
		uploadVerification,//
		document.getIdentityImage(),
		document.getScanOfMRZ(),
		sessionJson,
		observer // Observer for the result
		);
}
```

> Observer Result

```kotlin
```

```java
return new VerifyResponse() {
	@Override protected void onStart() {
	super.onStart();
		// Process has begun
	}

	@Override public void verifySuccess() {
		// User was verified
	}

	@Override public void verifyFailure() {
		// The user isn't verified
	}

	@Override public void verifyError(Throwable e) {
		// Likely in the form of a VerifyException
	}

	@Override public void verifyComplete() {
		// Process has completed
	}
```

In order to verify a user, currently we need to connect to our API to run the facial matching.

To do this you can do either of the following:

1. Use our supplied verification process
2. Implement your own, using the SDK

When using our process, it's as simple as calling the VerifyActivity. This will handle all of the process, by calling the relevant identity information. All the data must be present otherwise the SDK will fail with an exception.

There are different types of request that you need to specify, which depends on your use case. These are either:

1. Verify Identity
2. Right To Work

If you would like to manage the process yourself, we have provided some useful functionality that relies on Reactive principles.

The process is as follows:

1. Set the type of Verification
2. Create an UploadVerification object. This creates an OkHttp3 client
3. Check that the relevant information has been submitted to the IdentitySession, showing an error if it hasn't
4. Start a request to verify the user, that can be observed and reacted on when a result is returned
