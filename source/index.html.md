---
title: Android SDK API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - java
  - kotlin
  - gradle
  - shell

toc_footers:
  - <a href='mailto:hasan@eyn.vision'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - setup
  - initialisation
  - verify
  - verify_api
  - verify_core
  - verify_nfc
  - verify_face
  - verify_live

search: true
---

# Introduction

Welcome to the Eyn Android SDK!

These API docs contain all of the relevant information to get you started with the SDK.

In an effort to make the SDK as extensible and flexible as possible, it's split into the following 6 layers:

* **verify** - UI layer that handles the verification process for you with out own UI
* **verifyApi** - Handles the communication between an app and our API
* **verifyCore** - Ui elements that are common across the components
* **verifyNfc** - All NFC related tasks
* **verifyFace** - Facial recongition aspects
* **verifyLive** - TBC

You will need to discuss internally and with stakeholders, to determine which components you will need to use. We foresee the following two uses:

1. **verify** - Let Eyn handle the entire verification process with our Ui, in this case just use
2. **verify{module}** - Implement the verification process yourself, this will require different degress of the other components. Depending on your level of verification

