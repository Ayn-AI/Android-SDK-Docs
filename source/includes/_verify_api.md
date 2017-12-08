# VerifyApi

> Verifying with Ui

```kotlin
```

```java
startActivity(new Intent(this, VerifyActivity.class));
```

> Retrieve Result

```kotlin
```

```java
if(getIntent().getIntExtra(IntentUtils.EXTRA_VERIFY_COMPLETE, ApiResults.Codes.GENERIC)
	== ApiResults.Codes.SUCCESS))
	{
		// Verify was successful
	}
```

> Start a Verification

```kotlin
```

```java

private void initialVerification() {
	startVerification(new UploadVerification(
		IdentitySession.getInstance(),
		new IdentityClient()));
}


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

In order to verify a user, currently we need to connect to our API to run the complex facial matching.

To do this you can do either of the following:

1. Use our supplied verification process
2. Implement your own, using the SDK

When using our process, it's as simple as calling the VerifyActivity. This will handle all of the process, by calling the relevant identity information. All the data must be present otherwise the SDK will fail with an exception.

If you would like to manage the process yourself, we have provided some useful functionality that relies on Reactive principles.

The process is as follows:

1. Create an UploadVerification object. This creates an OkHttp3 client
2. Check that the relevant information has been submitted to the IdentitySession, showing an error if it hasn't
3. Start a request to verify the user, that can be observed and reacted on when a result is returned
