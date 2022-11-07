import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/custom_input_field.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ahora podemos utilizar las Keys que son por asi los identificadores de nuestros widgets
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Pepe',
      'last_name': 'Diaz',
      'email': 'pepe@google.com',
      'paswword': '123456',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs y Forms"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                CustomInputField(
                  labelText: 'Apellido',
                  helperText: 'Apellido del Usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                CustomInputField(
                  labelText: 'Correo',
                  helperText: 'Email del usuario',
                  textinputtype: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                CustomInputField(
                  labelText: 'Contraseña',
                  helperText: 'Constraseña usuario',
                  passwords: true,
                  formProperty: 'paswword',
                  formValues: formValues,
                ),
                DropdownButtonFormField<String>(
                  value: 'Admin',
                  //los items son los elementos que contendra nuestra lsita
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Super User', child: Text('Super User')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr. Developer', child: Text('Jr. Developer')),
                  ],

                  //en el dropdown necesitamos el onchaged para que pueda mostrar los valores que agregamos en la lista
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());

                      if (!myFormKey.currentState!.validate()) {
                        print('formulario no valido');
                        return;
                      }
                      print(formValues);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text("Guardar"),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
