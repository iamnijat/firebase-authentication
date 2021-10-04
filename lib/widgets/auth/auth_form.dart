import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {Key key}) : super(key: key);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.only(
        top: 35,
        left: 25,
      ),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                    child: const Text('Hi',
                        style: TextStyle(
                            color: Color.fromRGBO(253, 111, 150, 1),
                            fontSize: 80.0,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 125.0, 0.0, 0.0),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(111, 105, 172, 1),
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText("There"),
                          WavyAnimatedText('Again'),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(235.0, 125.0, 0.0, 0.0),
                    child: const Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(111, 105, 172, 1))),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.only(
                          top: 54.0, left: 20.0, right: 30.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            key: const ValueKey('email'),
                            decoration: const InputDecoration(
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                )),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableSuggestions: false,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userEmail = value;
                            },
                          ),
                          if (!_isLogin) const SizedBox(height: 20.0),
                          if (!_isLogin)
                            TextFormField(
                              key: const ValueKey('username'),
                              decoration: const InputDecoration(
                                  labelText: 'USERNAME',
                                  labelStyle: TextStyle(
                                      fontFamily: 'RobotoCondensed',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                              autocorrect: true,
                              textCapitalization: TextCapitalization.words,
                              enableSuggestions: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userName = value;
                              },
                              // ignore: missing_return
                            ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            key: const ValueKey('password'),
                            decoration: const InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                            ),
                            obscureText: true,

                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty || value.length < 7) {
                                return 'Please enter a long password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userPassword = value;
                            },
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          if (widget.isLoading)
                            const CircularProgressIndicator(),
                          if (!widget.isLoading)
                            Container(
                              height: 57.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.black,
                                color: const Color.fromRGBO(111, 105, 172, 1),
                                elevation: 10.0,
                                child: TextButton(
                                  onPressed: _trySubmit,
                                  child: Center(
                                    child: Text(
                                      _isLogin ? "Login" : "Sign up",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Raleway'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 25,
                          ),
                          if (!widget.isLoading)
                            Container(
                              height: 57.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.white,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      _isLogin
                                          ? "Create new account"
                                          : "I already have an account",
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(253, 111, 150, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Raleway'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom)),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
