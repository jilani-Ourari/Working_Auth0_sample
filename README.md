# Teachica

A new Flutter project.

## Setup Instructions

### 1. Update Configuration Files
- **`.env` file**: Add your credentials.
- **`android/app/src/main/res/values/strings.xml` file**: Update with your credentials.

### 2. Auth0 Dashboard Configuration

- **Allowed Callback URLs**:
`demo://your-domain/android/com.example.flutter_auth0/callback`
(Note: Your schema doesn't have to be `demo://`)

- **Allowed Logout URLs**:
`demo://your-domain/android/com.example.flutter_auth0/callback`

- **Cross-Origin Authentication**:
- Allow cross-origin authentication.
- Update Allowed Origins (CORS) with your domain:
  ```
  demo://your-domain/android/com.example.flutter_auth0/callback
  ```

### That's it! You are good to go.




