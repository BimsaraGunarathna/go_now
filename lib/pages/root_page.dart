import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Providers
import '../providers/auth.dart';

//Pages
import './login_page.dart';
import '../navigation/bottom-nav-bar-controller.dart';

class RootPage extends StatefulWidget {
  static const routeName = '/root-page';
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool _sessionRetrieved = false;

  @override
  void initState() {
    //_getCognitoCredential();
    setState(() {
      _sessionRetrieved = false;
    });

    _initiateSession();
    super.initState(); 
  }
  /*
  Future<void> _getCognitoCredential() async {
    await Provider.of<Auth>(context, listen: false)
        .getCredentials()
        .then((response) {
      print('Credential Response is : $response');
      Provider.of<Vehicles>(context, listen: false).haveCredentials(response);

    });
  }
  */

  Future<void> _initiateSession() async {
    Auth auth = Provider.of<Auth>(context, listen: false);
    bool hasSession = await auth.init();
    bool isAuthenticad = auth.isAuthenticated;
    print('isAuthenticated : ');
    print(isAuthenticad);
    //bool hasSession = await Provider.of<Auth>(context, listen: false).init();
    //print('HAS SESSION IS $hasSession');
    if (hasSession) {
      setState(() {
        _sessionRetrieved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //return _sessionRetrieved ?  BottomNavigationBarController() : LoginPage();
    return BottomNavigationBarController();
  }
}
