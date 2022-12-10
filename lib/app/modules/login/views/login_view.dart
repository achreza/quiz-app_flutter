import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/constant.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginController _viewModel = Get.put(LoginController());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController unameCtr = TextEditingController();
  FormType _formType = FormType.menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _formType == FormType.login
          ? AppBar(
              // title: _formType == FormType.login
              //     ? Text('Login')
              //     : _formType == FormType.register
              //         ? Text('Register')
              //         : Text('Admin Login'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formType = FormType.menu;
                    });
                  },
                  child: Text('Kembali', style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: _formType == FormType.menu
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _formType = FormType.login;
                          });
                        },
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFffc300),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text('SISWA',
                                  style: TextStyle(
                                      fontSize: 24,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w800))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _formType = FormType.admin;
                          });
                        },
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFFffc300))),
                          child: Center(
                              child: Text(
                            'ADMIN',
                            style: TextStyle(
                                fontSize: 24,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w800),
                          )),
                        ),
                      ),
                    ]),
              )
            : _formType == FormType.login
                ? loginForm()
                : _formType == FormType.register
                    ? registerForm()
                    : adminForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text('SISWA',
              style: TextStyle(
                  fontSize: 24, letterSpacing: 2, fontWeight: FontWeight.w800)),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: Colors.black),
          controller: unameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Username'
                : null;
          },
          decoration: inputDecoration('Username', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.loginUser(unameCtr.text, passwordCtr.text);
            }
          },
          child: Text('Login'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: Text('Daftar'),
        ),
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text('DAFTAR',
              style: TextStyle(
                  fontSize: 24, letterSpacing: 2, fontWeight: FontWeight.w800)),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: Colors.black),
          controller: unameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Username'
                : null;
          },
          decoration: inputDecoration('Username', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.emailAddress,
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Email'
                : null;
          },
          decoration: inputDecoration('E-mail', Icons.email),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
          obscureText: true,
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Passwords does not match'
                : null;
          },
          decoration: inputDecoration('Retype Password', Icons.lock),
          obscureText: true,
        ),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.registerUser(
                  unameCtr.text, emailCtr.text, passwordCtr.text);
            }
          },
          child: Text('Daftar'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: Text('Login'),
        )
      ]),
    );
  }

  Form adminForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text('ADMIN',
              style: TextStyle(
                  fontSize: 24, letterSpacing: 2, fontWeight: FontWeight.w800)),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: Colors.black),
          controller: unameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Username'
                : null;
          },
          decoration: inputDecoration('Username', Icons.person),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyle(color: Colors.black),
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Password', Icons.lock),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.loginAdmin(unameCtr.text, passwordCtr.text);
            }
          },
          child: Text('Login'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.menu;
            });
          },
          child: Text('Kembali'),
        ),
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
      color: Colors.black,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black)),
  );
}

enum FormType { login, register, admin, menu }
