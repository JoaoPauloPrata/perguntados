import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perguntados/pages/pages.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cadastrar'),
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
                  const SizedBox(
                    height: 20,
                  ),
                  repeatPasswordField(),
                  SizedBox(
                    height: 350,
                  ),
                  SizedBox(height: 10),
                  registerButton()
                ],
              ))),
    );
  }

  Container registerButton() {
    return Container(
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: defaultColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              textStyle: TextStyle(fontSize: 20)),
          onPressed: () {},
          child: const Text('Cadastrar'),
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

  TextField repeatPasswordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Repetir Senha',
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
