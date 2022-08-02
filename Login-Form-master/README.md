# loginform

A new Flutter project.

## Getting Started

## Flutter Social Logins with Firebase google, facebook , email and number

## Architecture
![1_mJpDhhE-fOLnPzQhpKin4w](https://user-images.githubusercontent.com/93259715/182357251-af1b7529-8fae-4265-828b-67f99d825166.png)

This is a Social Login Project, in this you can signin through facebook, google & email

Stating with Login Screen
![Screenshot_20220802-155445](https://user-images.githubusercontent.com/93259715/182359076-ceceebbb-a9ad-4c1e-9b1d-11123262ca3e.png)

if you have an account then you will signin through login button otherwise you need to navigate signup page

![Screenshot_20220802-155432](https://user-images.githubusercontent.com/93259715/182359642-3533c18c-43d9-4538-be93-521105e575f2.png)

after click on signup button you recieve 6 digit code on your Mobile Number after this you will be signin through Mobile

![Screenshot_20220802-162440](https://user-images.githubusercontent.com/93259715/182364001-56ce4a9e-d047-4bec-a980-ebaaec8654df.png)

& if you have already sign in then it will directly navigate to the Home Screen (Shared Prefrences pending)

## Forget Password (change password & Email OTP )

![Screenshot_20220802-155457](https://user-images.githubusercontent.com/93259715/182360132-3cd4acac-da81-4b41-89fe-0c53f7a7df00.png)


in this TextField enter your email address and click on the Reset password Button, on this click you recieve a link in your email address,
open the link and change your new Password


![Screenshot_20220802-155513](https://user-images.githubusercontent.com/93259715/182361625-7a8d26a8-1122-484a-9799-7277977cab18.png)


when you press the (OTP Send), a new TextField added and OTP verification code send on your email address then put the condition on Confirm Button As your choice

![Screenshot_20220802-155541](https://user-images.githubusercontent.com/93259715/182362355-d8ce747e-fd0f-4f9d-8caf-60c9e41bcb5f.png)


after clicking on facebook button Facebook Login Page will open

![Screenshot_20220802-155534](https://user-images.githubusercontent.com/93259715/182362822-8d6d1cfb-0cde-42db-93ae-c9e191217c83.png)


after clicking on Google Button new tab is open like this

at the last this is our main screen this in we show the user profile,name and email address with the logout button


![Screenshot_20220802-155603](https://user-images.githubusercontent.com/93259715/182362983-187d41cd-be90-4948-9105-8fdd6ea9f66d.png)





## Steps
create signin & signup screens
in this screen create facebook & google signin button
set the authentication through firestore database (email & pass)
set the authentication through google & facebook signin
create function for email OTP,OTP validation, change password through email link
at the last store the user information input for signing form in firestore database
