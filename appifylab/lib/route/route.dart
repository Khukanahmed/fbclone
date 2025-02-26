
import 'package:appifylab/feature/news_feed/view/news_feed_screen.dart';
import 'package:get/get.dart';
import '../feature/auth/screen/login_screen.dart';
import '../feature/splash_screen/screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  
  static String newsFeedScreen = "/newsFeedScreen";
  static String otpScreen = "/otpScreen";
  static String signupScreen = "/signupScreen";
  

 

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
 

  
  static String getNewsFeedScreen() => newsFeedScreen;
  
  

  ///user
  

  static List<GetPage> routes = [
    //users
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),

   GetPage(name: newsFeedScreen, page: () => NewsFeedPage()),

    // GetPage(name: otpScreen, page: () => OtpScreen()),
    // GetPage(name: signupScreen, page: () => SignupScreen()),
   

    
    // //users
    // GetPage(name: createProjectScreen, page: () => UserCreateProjectScreen()),

    // GetPage(name: createProjectScreen, page: () => UserCreateProjectScreen()),

    
  ];
}
