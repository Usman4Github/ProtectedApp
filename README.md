# ProtectedApp
Protect application from OS, to take screenshot of your sensitive data while going to inactive state

In the application switcher mode, those preview screens are not live though, they’re simple screenshots that iOS takes before sending an app into the background. 
In some of application you might need to hide confidential information on those preview screens, like banking application. By knowing this, first thing that come in mind, is to stop os from taking screenshot. Well there is no such option provided by iOS, but don't worry, I have a simply way for you to prevent it.
As a being iOS developer, you might already know that it’s easy to detect that when an application state is changed from active to inactive and vise versa, by the delegate method provided for application state in AppDelegate class of any project.

//delegate that called whenever application goes to inactive state
func applicationWillResignActive(_ application: UIApplication)

//delegate that called whenever application goes back to active state
func applicationDidBecomeActive(_ application: UIApplication)

Now to secure our application from screenshot, we have to change our display on application inactive state. Off course OS will take a screenshot of our application but from the screen only we want it to.

There are three different option to change view before on application inactive state of application

1) Simplest One: Hide / Show Window

Simplest an easiest one, is to hide the window. It will blackout the application screen and in that case on application switcher mode, your application screen will be displayed as black screen.

While application becomeActive, to remove the black screen, simply set value isHidden of window to false. You will see you application screen again.
            
There is a problem with this option, that the transition between the black screen and application content is not smooth like other iOS transitions, like fades and slides. So the blink from blank to application content feels a little out of place.

To overcome this issue, we can use other two options mentioned bellow

2) Display view according to application theme

Our next option is to create a UIView and overlay it over the window. UIViews can be faded in and out by using its alpha value along with its animation option. Also you can assign a theme color to the view, to have a look and feel for the overlay view a part of application. In the example code, however I will assign a white color to view. you can change it to your desire.

Do not get confused with the code. It's a simple one: on resignactive, we will create a UIView, can named anything like in example it's securityView. Assign it a background color of your application theme. Now instead of a simple addsubview, which will behave like a blink, to have a fade in animation, set Aplha to 0 to make it transparent. Assign a tag value for identification of the view, as we will need it in becomeActive to hide/remove view. In example, we assign 1122.  After adding and bringing it above all, change its alpha to 1 with animateWithDuration, that will fade it in over the assigned seconds period.

Now on becomeActive, pick the added overlay view from window by the tag assigned above.. and change its alpha with animation to 0 to have a feeling of fadeout, and in completion block of animation, remove the view by removeFromSuperview.

3) Display some image related to security or application theme

The third option is same like second, except using some image to display in applications switcher. If you want to display some meaning full or proper visual to users, then you can also do it by bellow code. 

Its same code just a difference is using UIImageView instead of UIView.


Check code for all there options working.

That's all for this topic. Hope you will find it helpful.

Happy Coding :)
