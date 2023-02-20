import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'first_screen.dart';
import '../security/authetication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String enteredUsername;
  late String enteredPassword;
  Authenticator auth = Authenticator();
  bool _authenticating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: _authenticating,
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator())),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
                onChanged: (v) {
                  enteredUsername = v;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your pass word',
                ),
                onChanged: (v) {
                  enteredPassword = v;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          _authenticating = true;
                        });
                        var _isAuthorized = await auth.authenticate(
                            enteredUsername, enteredPassword);
                        setState(() {
                          _authenticating = false;
                        });
                        _isAuthorized
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FirstPage()))
                            : null;
                      },
                      child: const Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
