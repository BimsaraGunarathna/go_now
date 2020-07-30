import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Pages
import './pages/root_page.dart';
import './navigation/bottom-nav-bar-controller.dart';
import 'pages/home_page.dart';
import './pages/vehicle_detail_page.dart';
import './pages/wishlist_page.dart';
import './pages/order_page.dart';
import './pages/user_vehicle_host_page.dart';
import './pages/edit_vehicle_page.dart';
import './pages/signup_page.dart';
import './pages/auth_page.dart';
import './pages/login_page.dart';
import './pages/signup_confirmation_page.dart';
import './pages/forgot_password_page.dart';
import './pages/create_new_password.dart';
import './pages/host_page.dart';
import './pages/profile_page.dart';
import './pages/favourite_page.dart';
import './pages/offers_page.dart';
import './pages/trip_page.dart';

//Providers
import './providers/vehicles.dart';
import './providers/wishlist.dart';
import './providers/orders.dart';
import './providers/auth.dart';

//test
//import 'package:web_socket_channel/io.dart';
//import './testing/websocket.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*
  bool _sessionRetrieved = false;

  @override
  void initState() {
    
    super.initState();
  }

  didChangeDependencies() {
    //_getCognitoCredential();
    setState(() {
      _sessionRetrieved = false;
    });

    _initiateSession();
    super.didChangeDependencies();
  }

  Future<void> _initiateSession() async {
    bool hasSession = await Provider.of<Auth>(context, listen: false).init();
    //print('HAS SESSION IS $hasSession');
    if (hasSession) {
      setState(() {
        _sessionRetrieved = true;
      });
    }
  }
  */
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Vehicles(),
        ),
        /*
        ChangeNotifierProxyProvider<Auth, Vehicles>(
          create: (context) => Vehicles('Fuck Me', []),
          update: (context, auth, vehi) =>
              Vehicles((vehi.idToken = auth.idToken), []),
        ),
        ChangeNotifierProxyProvider<Auth, Vehicles>(
          //update: (_, foo, myNotifier) => Vehicles('foo', []),
          builder: (context, auth, previousVehicle) => Vehicles('FUCK YOU', previousVehicle == null ? [] : previousVehicle.items),
          //builder: (context, auth, previcousVehicle) Vehicles(auth.idToken),
          //value: Vehicles(),
        ),
        */
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: Wishlist(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, _) => MaterialApp(
          title: 'Go Now',
          theme: ThemeData(
            // Define the default font family.
            textTheme: TextTheme(
              headline1: TextStyle(),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText1: TextStyle(fontFamily: 'defualt'),
              //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'fm'),
            ),
          ),
          home: RootPage(),
          /*
          home: WebSocket(
            title: 'Hello World',
            channel: IOWebSocketChannel.connect(
                'wss://3bpxptbbj1.execute-api.ap-south-1.amazonaws.com/dev'),
          ),
          */

          routes: {
            //Pages
            RootPage.routeName: (ctx) => RootPage(),
            AuthPage.routeName: (ctx) => AuthPage(),
            HomePage.routeName: (ctx) => HomePage(),
            VehicleDetailPage.routeName: (ctx) => VehicleDetailPage(),
            WishlistPage.routeName: (ctx) => WishlistPage(),
            OrderPage.routeName: (ctx) => OrderPage(),
            UserVehicleHostPage.routeName: (ctx) => UserVehicleHostPage(),
            EditVehiclePage.routeName: (ctx) => EditVehiclePage(),
            LoginPage.routeName: (ctx) => LoginPage(),
            SignupPage.routeName: (ctx) => SignupPage(),
            SignupConfirmationPage.routeName: (ctx) => SignupConfirmationPage(),
            ForgotPasswordPage.routeName: (ctx) => ForgotPasswordPage(),
            CreateNewPasswordPage.routeName: (ctx) => CreateNewPasswordPage(),
            HostPage.routeName: (ctx) => HostPage(),
            ProfilePage.routeName: (ctx) => ProfilePage(),
            FavouritePage.routeName: (ctx) => FavouritePage(),
            TripPage.routeName: (ctx) => TripPage(),
            OffersPage.routeName: (ctx) => OffersPage(),
            //Bottom Navigator
            BottomNavigationBarController.routeName: (ctx) =>
                BottomNavigationBarController(),
          },
        ),
      ),
      //),
    );
  }
}
