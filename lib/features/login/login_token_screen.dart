import 'package:flutter/material.dart';
import 'package:sticky_sessions/features/login/blocs/login_bloc.dart';
import 'package:sticky_sessions/features/login/model/login_model.dart';
import 'package:sticky_sessions/utils/constants.dart';

class LoginTokenScreen extends StatefulWidget {
  const LoginTokenScreen({Key? key}) : super(key: key);

  @override
  State<LoginTokenScreen> createState() => _LoginTokenScreenState();
}

class _LoginTokenScreenState extends State<LoginTokenScreen> {
  var textControllerToken = TextEditingController();
  var textControllerUsername = TextEditingController();

  var isButtonEnabled = false;

  late LoginBloc loginBloc;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerToken.text.isNotEmpty && textControllerUsername.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    loginBloc = LoginBloc();

    textControllerToken.addListener(() => updateButtonStatus());
    textControllerUsername.addListener(() => updateButtonStatus());

    loginBloc.stream.listen((event) {
      if (event.isLogged) {
        Navigator.pushNamedAndRemoveUntil(context, routerHome, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginModel>(
        stream: loginBloc.stream,
        builder: (context, state) => state.data?.isLoading == true
            ? Container(
                width: 50,
                color: Colors.white,
                child: const Center(
                    child: CircularProgressIndicator(
                  strokeWidth: 2,
                )))
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  shadowColor: Colors.transparent,
                  title: const Text(
                    'Log In with the Token',
                  ),
                ),
                body: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    const Text(
                      "If you do not have a token, ask for meeting admin",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black, decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Token',
                      ),
                      controller: textControllerToken,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      controller: textControllerUsername,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              loginBloc.logInWithToken(
                                token: textControllerToken.text,
                                username: textControllerUsername.text,
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        onSurface: isButtonEnabled ? Colors.white : Colors.grey,
                      ),
                      child: const Text("Log In"),
                    )
                  ]),
                )));
  }
}
