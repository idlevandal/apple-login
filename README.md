# au_com_inthecode_applesignin

Apple sign in

** when creating app, make sure has signature com.domainName.appName

Create Firebase project
Authentication => Sign-in-method => Enable apple signin

Setting up iOS app in Firebase - Register app
1.
iOS bundle ID => found in Runner.xcodeproj/project.pbxproj
Eg. PRODUCT_BUNDLE_IDENTIFIER = com.example.appname;
or xCode => Runner => General tab => Bundle identifier
2.
Download config file => add to xCode at same level as info.plist
3.
Skip rest of setup in Firebase

Add
  cloud_firestore:
  firebase_auth:
  Firebase_core:

https://www.filledstacks.com/post/sign-in-with-google-or-apple-sign-in-using-flutter/

In apple developer account
Click ‘Certificates, IDs & Profiles’ tab
Select ‘Identifiers’ => Identifier + (add Identifier)
Select ‘Sign In with Apple’ checkbox.

In Xcode
Signing & Capabilities tab (after general tab)
Select a team (eg. In The Code)
+ Capability => click add capability button, add ‘Sign in with Apple’
