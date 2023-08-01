import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/beverages/beverages.dart';
import 'package:newfigma/cart/cart.dart';
import 'package:newfigma/cart/placeOrder.dart';
import 'package:newfigma/explore/explore.dart';
import 'package:newfigma/favourite/favourite.dart';
import 'package:newfigma/filters/filter.dart';
import 'package:newfigma/home/home.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/location/location.dart';
import 'package:newfigma/login/login.dart';
import 'package:newfigma/onboarding/onboarding.dart';
import 'package:newfigma/otp/otp.dart';
import 'package:newfigma/phone_number/number.dart';
import 'package:newfigma/profile/profile.dart';
import 'package:newfigma/search/search.dart';
import 'package:newfigma/signIn/SignIn.dart';
import 'package:newfigma/signup/signup.dart';
import 'package:newfigma/splashScreen.dart';

class AppRoutes{
  static String splashScreen='/SplashScreen';
  static String beverages='/Beverages';
  static String cart='/Cart';
 static String orderplaced='/OrderPlaced';
 static String explore='/Explore';
 static String favourite='/Favourite';
 static String filter='/Filters';
 static String home='/home';
 static String tabhome='/TabHome';
 static String location='/location';
 static String login='/Login';
 static String onboard='/OnBoarding';
 static String otp='/Otp';
 static String phonenumber='/phone Number';
 static String product='/Product';
 static String profile='/Profile';
 static String search='/Search';
 static String signIn='/SignIn';
 static String signup='/SignUp';

  static List<GetPage> pages=[
    GetPage(name: splashScreen, page: ()=>const SplashScreen()),
    GetPage(name: beverages, page: ()=>const Beverages()),
    GetPage(name: cart, page: ()=>const Cart()),
    GetPage(name: orderplaced, page: ()=>const OrderPlace()),
    GetPage(name: explore, page: ()=>const Explore()),
    GetPage(name: favourite, page: ()=>const Favourite()),
    GetPage(name: filter, page: ()=>const Filters()),
    GetPage(name: home, page: ()=>const HomeScreen()),
    GetPage(name: tabhome, page: ()=>const TabHome()),
    GetPage(name: location, page: ()=>const Location()),
    GetPage(name: login, page: ()=>const LogIn()),
    GetPage(name: onboard, page: ()=>const OnBoarding()),
    GetPage(name: otp, page: ()=>const OTPScreen()),
    GetPage(name: phonenumber, page: ()=>const Phone()),
    GetPage(name: product, page: ()=>const Product()),
    GetPage(name: profile, page: ()=>const Profile()),
    GetPage(name: search, page: ()=>const Search()),
    GetPage(name: signIn, page: ()=>const SignIn()),
    GetPage(name: signup, page: ()=>const SignUp()), 
       
  ];
}