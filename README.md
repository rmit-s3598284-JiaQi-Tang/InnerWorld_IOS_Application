# Inner-World-IOS-Diary-App
This is a Diary Application by Swift

prototype:

![image](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/InnerWorldPrototype_gif.gif)


The picture below is the workflow diagram of the screens for visual explaining the flow between the screens:
![workflow](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/Blank%20Diagram.jpeg)

1.Password Screen

![1](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/1.jpeg)

The first time when user start the app, this screen will ask the user to set their password & hint, after the first time, every time when the user start the app, ​this screen shows first​ and it will ask the user to enter the right password. If the user forget his/her password , the user can tap ‘Forget your password?’ , the hint will appear on the screen

There is no account registration required in our app, only the password will be saved in local database, this is a single user app

2.Welcome Screen(splash screen)

![2](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/2.jpeg)

This is just a splash screen, only appear a few seconds ​after the user entered the correct password​. It will show different massage like ‘good morning + username(set in setting screen)’ in the morning or ‘happy birthday + username’ when that day is the user’s birthday.

3.Home Screen

![3](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/3.jpeg)

This is the default screen shows every time ​after the welcome screen​. There is a navigator below the screen towards ​home screen, create screen, setting screen. There is a filter icon on the top right corner towards ​filter screen​. If the user tap any of the diarys they will go to the ​read screen​.

4.Filter Screen

![4](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/4.jpeg)

This is the filter screen which allows the user to change the way our app list all the diaries. Users can ​go to other screen by tapping the navigator​ or ​go back to the home screen​ by tapping the top left button “←”

5.Create Screen-date

![5](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/5.jpeg)

This is the create screen-date which ​appears after the user tap the “+” icon​, the user can also​ cancel it by tapping the “X” icon​ in the left top corner. When the user tap “Let’s Do It!” they will ​go to the next screen which is create screen-mood.

If the user wants to ​go to other screen by tapping the navigator ​there will be a pop up window asking the user “are you sure to leave the creating?”

6.Create Screen-mood

![6](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/6.jpeg)

This is the create screen-mood which allows the user to set the mood of the diary. The user can ​go back to create screen-date​ or​ go to the next screen: create screen-content​ by tapping the right arrow and the left arrow on the top.
If the user wants to ​go to other screen by tapping the navigator ​there will be a pop up window asking the user “are you sure to leave the creating?”

7.Create Screen-content

![7](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/7.jpeg)

This is the create screen-content which allows the user to enter the content of the diary. The user can ​go back to create screen-mood​ or​ go to the next screen: create screen-theme​ by tapping the right arrow and the left arrow on the top.
If the user wants to ​go to other screen by tapping the navigator ​there will be a pop up window asking the user “are you sure to leave the creating?”

8.Create Screen-theme

![8](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/8.jpeg)

This is the create screen-theme which allows the choose the theme of the diary. The user can ​go back to create screen-content​ or​ finish to go back to the home screen​ by tapping the right arrow and the tick icon on the top.

If the user wants to ​go to other screen by tapping the navigator ​there will be a pop up window asking the user “are you sure to leave the creating?”

9.Read Screen

![9](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/9.jpeg)

This is the read screen which allows the user to read the selected diray. Users can
go to other screen by tapping the navigator​ or ​go back to the home screen​ by tapping the top left button “←”

10.Setting screen

![10](https://github.com/rmit-s3598284-JiaQi-Tang/InnerWorld_IOS_Application/blob/master/Prototype_GIF/10.jpeg)

This is the setting screen which allows the user to set personal details. The User can
tap ‘done’ icon to go back to the previous screen.

If the user wants to ​go to other screen by tapping the navigator ​there will be a pop up window asking the user “are you sure to leave the unsaved setting?”

#Adaptive Layout


This is the read screen appears after user tap a diary on the home screen.
Items have been re-positioned to make everything looks better in a horizontal screen. For example showing the image in the left side and the contents in the right side.
