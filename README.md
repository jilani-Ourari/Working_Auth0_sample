# teachica

A new Flutter project.
update the .env and android/app/src/main/res/values/strings.xml files with your credentials

in the auth0 dashboard you need to update

Allowed Callback URLs
demo://'domain'/android/com.example.flutter_auth0/callback
or your schema doesn't have to be demo://

allowed logout
demo://'domain'/android/com.example.flutter_auth0/callback

allow cross origin authentication and update allowed origins(cors) with your domain
demo://'domain'/android/com.example.flutter_auth0/callback

thats it you are good to go
```