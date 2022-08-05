# loginform

A new Flutter project.

## Getting Started

## Flutter Social Logins with Firebase google, facebook , email and number

## Architecture
![1_mJpDhhE-fOLnPzQhpKin4w](https://user-images.githubusercontent.com/93259715/182357251-af1b7529-8fae-4265-828b-67f99d825166.png)

This is a Social Login Project, in this you can signin through facebook, google & email

Stating with Login Screen
![Screenshot_20220802-155541](https://user-images.githubusercontent.com/93259715/183064417-91017ea0-f03f-44d3-9ac0-05355bfdfbba.png)

if you have an account then you will signin through login button otherwise you need to navigate signup page

![Capture](https://user-images.githubusercontent.com/93259715/183064495-0bd7c308-130f-4e7e-9831-90f3511a7d25.PNG)

after click on signup button you recieve 6 digit code on your Mobile Number after this you will be signin through Mobile

![Capture1](https://user-images.githubusercontent.com/93259715/183064601-f1a9e4c0-0cef-4a0e-8791-6f37a192468e.PNG)

& if you have already sign in then it will directly navigate to the Home Screen (Shared Prefrences pending)

## Forget Password (change password & Email OTP )

![Capture2](https://user-images.githubusercontent.com/93259715/183064710-c171998f-28f7-4238-a4f2-0688670865ab.PNG)

in this TextField enter your email address and click on the Reset password Button, on this click you recieve a link in your email address,
open the link and change your new Password

when you press the (OTP Send), a new TextField added and OTP verification code send on your email address then put the condition on Confirm Button As your choice

![Capture4](https://user-images.githubusercontent.com/93259715/183064787-32d55fe3-7d56-4164-a203-f530171ff6a8.PNG)


after clicking on facebook button Facebook Login Page will open

![Capture6](https://user-images.githubusercontent.com/93259715/183064829-a18c369a-d2e1-4ddd-bb66-8480c58a8115.PNG)

after clicking on Google Button new tab is open like this

![Capture7](https://user-images.githubusercontent.com/93259715/183064912-a0a5e512-cc8e-4b27-b4ed-0eb8835c215d.PNG)


at the last this is our main screen this in we show the user profile,name and email address with the logout button


![Capture8](https://user-images.githubusercontent.com/93259715/183064949-ac83c3b5-b2db-47f2-ad3f-8ed21da19189.PNG)





## Steps
create signin & signup screens
in this screen create facebook & google signin button
set the authentication through firestore database (email & pass)
set the authentication through google & facebook signin
create function for email OTP,OTP validation, change password through email link
at the last store the user information input for signing form in firestore database
