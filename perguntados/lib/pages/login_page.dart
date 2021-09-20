import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Color defaultColor = Color.fromRGBO(117, 140, 255, 1);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: defaultColor,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  emailField(),
                  const SizedBox(
                    height: 20,
                  ),
                  passwordField(),
                  SizedBox(
                    height: 350,
                  ),
                  registerButton(),
                  SizedBox(height: 10),
                  loginButton()
                ],
              ))),
    );
  }

  Container registerButton() {
    return Container(
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 0, 0, 0),
              onPrimary: defaultColor,
              shadowColor: Color.fromRGBO(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Cadastrar'),
        ));
  }

  Container loginButton() {
    return Container(
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: defaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Entrar'),
        ));
  }

  TextField passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Senha',
      ),
    );
  }

  TextField emailField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    );
  }
}
