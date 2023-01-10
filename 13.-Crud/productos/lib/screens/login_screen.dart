import 'package:flutter/material.dart';
import 'package:productos/providers/login_formprovider.dart';
import 'package:productos/ui/inputs_decorations.dart';
import 'package:productos/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _LoginForm())
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Crear una nueva cuenta",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginform = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
          key: loginform.formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                  hinttext: "John@gmail.com",
                  labeltext: "Correo electronico",
                  prefixicon: Icons.alternate_email_outlined,
                ),
                onChanged: (value) => loginform.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El correo no es correcto';
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hinttext: "******",
                    labeltext: "Contraseña",
                    prefixicon: Icons.password),
                onChanged: (value) => loginform.Password = value,
                validator: (value) {
                  if (value != null && value.length >= 6) return null;

                  return 'la contraseña debe de ser 6 caracteres';
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Text(
                  loginform.isloading ? 'espere' : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: loginform.isloading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        if (!loginform.isValidForm()) return;
                        loginform.isloading = true;
                        await Future.delayed(Duration(seconds: 2));

                        loginform.isloading = false;

                        Navigator.pushReplacementNamed(context, 'home');
                      },
              )
            ],
          )),
    );
  }
}
