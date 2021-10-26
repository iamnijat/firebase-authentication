![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/iamnijat/firebase-authentication/Flutter%20CI/master)
![GitHub forks](https://img.shields.io/github/forks/iamnijat/firebase-authentication)
![GitHub stars](https://img.shields.io/github/stars/iamnijat/firebase-authentication)
![GitHub watchers](https://img.shields.io/github/watchers/iamnijat/firebase-authentication)
![GitHub contributors](https://img.shields.io/github/contributors/iamnijat/firebase-authentication)
![GitHub last commit](https://img.shields.io/github/last-commit/iamnijat/firebase-authentication)
![GitHub top language](https://img.shields.io/github/languages/top/iamnijat/firebase-authentication)

# Flutter Firebase Authentication App

![loginbehance](https://user-images.githubusercontent.com/42466886/138568644-bdc7d7ef-fe22-45a5-a54b-621c35d5d186.png)

-------

## Configuration for this application

This project contains `google-services.json` file of my own. You can connect your own firebase project using the following configurations:

> Please, follow the configurations correctly!

**Step 1:** Clone the repository to your device.

**Step 2:** Open `android/app/build.gradle` and change `applicationId` as you want

**Step 3:** Create firebase project and add new android project to firebase.

**Step 4:** Write the `same applicationId` to the `android package name` field:

**Step 5:** Open the `android` directory of `This project` using Android Studio or Visual Studio (Any IDE)

**Step 6:** Tap to `Gradle` from the right side and select `android/app/Tasks/android/signingReport` and wait a bit to get `SHA1` key

**Step 7:** Copy `SHA1` from terminal

**Step 8:** Paste to `Debug signing certificate SHA-1` field in `Firebase` and click to `Register` button

**Step 9:** Download `google-services.json` and click to next button

**Step 10:** Replace file of `This Project` that is stored in `android/app/` called `google-services.json` with your own `google-services.json` file that you downloaded in the previous step

**Step 11:** Click `Next` and `Skip` button in the next steps

**Step 12:** Go to `Authentication` screen in Firebase and enable `Email/Password` and `Google` authentication

**Finally:** You've done entire steps correctly and I make sure that this project will have paramount effect on your progress learning `Flutter`
