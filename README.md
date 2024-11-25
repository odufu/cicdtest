To make this GitHub Actions workflow a reusable template for deploying Flutter apps to Firebase App Distribution, follow these instructions. This guide will walk you through setting up the required Firebase and GitHub configurations, as well as modifications to use this workflow for different projects.

---

### Steps to Set Up and Use the Workflow Template

#### 1. **Set Up GitHub Repository**

   - Create a new repository on GitHub for your project if you haven't already.
   - In your repository, go to **Settings > Secrets and variables > Actions**.
   - Add the following secrets:
     - **FIREBASE_SERVICE_ACCOUNT**: This should contain the JSON credentials of your Firebase service account.
     - **FIREBASE_TOKEN**: This token will be used by Firebase CLI for authentication.

#### 2. **Set Up Firebase Project**

   - **Create a Firebase Project**: Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project if needed.
   - **Enable App Distribution**: Go to the App Distribution section within Firebase to enable it for your app.
   - **Get Your Service Account JSON**:
     - In the Firebase Console, go to **Project Settings > Service accounts**.
     - Click on **Generate new private key** to download the JSON credentials file.
     - Copy the contents of the JSON file and add it as a GitHub secret (as **FIREBASE_SERVICE_ACCOUNT**) in your repository.
   - **Get Your App ID**:
     - In Firebase Console, go to the settings of your app under **Project Settings > General > Your apps**.
     - Copy the **App ID** (e.g., `1:1234567890:android:abcdef12345`) to use it in the workflow.

#### 3. **Set Up Your Flutter Project Locally**

   - **Install Flutter**: Make sure Flutter is installed on your development machine. You can follow the installation instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
   - **Link to Firebase**: In your Flutter project, set up Firebase SDKs as necessary. You can follow [Firebase's Flutter setup guide](https://firebase.flutter.dev/docs/overview/) to integrate Firebase services.
   - **Prepare Your APK Build**: Ensure your app is configured to build for Android by setting up `build.gradle` files and configuring any necessary Firebase plugins.

#### 4. **Set Up Google Cloud SDK**

   - **Create a Google Cloud Project** (or use your Firebase project, as they share the same GCP project by default).
   - **Enable the Firebase API**: Make sure the Firebase Management API is enabled in the Google Cloud Console for your project.
   - **Install Google Cloud SDK Locally (optional)**: If you need to debug or test Google Cloud operations locally, install the Google Cloud SDK by following the instructions [here](https://cloud.google.com/sdk/docs/install).

---

### Using the Workflow Template

Below is the workflow template that can be customized for each project. Replace placeholders with your Firebase project ID and App ID.

```yaml
name: Firebase App Distribution

on:
  push:
    branches: [main]

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Check out code
        uses: actions/checkout@v3

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'

      - name: Install dependencies
        run: flutter pub get

      - name: Build APK
        run: flutter build apk --release

      - name: Set up Google Cloud SDK
        run: |
          sudo apt-get update
          sudo apt-get install -y apt-transport-https ca-certificates gnupg
          echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
          curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/cloud.google.gpg > /dev/null
          sudo apt-get update && sudo apt-get install -y google-cloud-sdk

      - name: Install Firebase CLI
        run: curl -sL https://firebase.tools | bash

      - name: Authenticate with Firebase using Service Account
        env:
          FIREBASE_SERVICE_ACCOUNT: ${{ secrets.FIREBASE_SERVICE_ACCOUNT }}
        run: |
          echo "${FIREBASE_SERVICE_ACCOUNT}" > firebase_service_account.json
          gcloud auth activate-service-account --key-file=firebase_service_account.json
          gcloud --quiet config set project <YOUR_FIREBASE_PROJECT_ID>

      - name: Upload to Firebase App Distribution
        env:
          GOOGLE_APPLICATION_CREDENTIALS: firebase_service_account.json
          FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        run: |
          firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk \
            --app <YOUR_FIREBASE_APP_ID> \
            --release-notes "Automated release from GitHub Actions" \
            --groups "testers" \
            --project <YOUR_FIREBASE_PROJECT_ID>

      - name: Clean up
        run: rm firebase_service_account.json
```

#### 5. **Customizing the Template**

Replace the following placeholders with your project-specific details:
   - `<YOUR_FIREBASE_PROJECT_ID>`: Your Firebase project ID (e.g., `buga-21825`).
   - `<YOUR_FIREBASE_APP_ID>`: The App ID of your Firebase app (e.g., `1:345769754556:android:b138bbd53bfaca235435b9`).

#### 6. **Push Changes and Trigger Workflow**

   - Commit and push the workflow file (`.github/workflows/firebase-distribution.yml`) to your repository's main branch.
   - Each time you push changes to the `main` branch, this workflow will trigger automatically, building the APK and uploading it to Firebase App Distribution.

---

### Notes

- Make sure the Google Cloud API quotas are sufficient for the deployments you need.
- For any additional Firebase App Distribution testers, add them to your Firebase project under "App Distribution" > "Testers & Groups."
- If you’re working with iOS, additional steps to build an iOS app would be required, as this template only handles Android APKs.
  
This setup should now be ready to use for any other Flutter projects you’re working on!