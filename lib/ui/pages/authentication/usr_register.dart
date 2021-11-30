// ignore import 'package:core_event/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  // ignore: unused_field
  late String _email;
  // ignore: unused_field
  late String _password;
  // ignore: unused_field
  late String _name;
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Información de registro",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nombre del usuario',
                  hintText: 'Nombre',
                ),
                maxLength: 25,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite su Nombre";
                  }
                },
                onChanged: (value) {
                  _name = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controllerEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email del Usuario',
                  hintText: 'Email',
                ),
                maxLength: 25,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite su email";
                  } else if (!value.contains('@')) {
                    return "Digite una direccion valida de email";
                  }
                },
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controllerPassword,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Clave de Acceso',
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite el password";
                  } else if (value.length < 6) {
                    return "El password debe tener minimo 6 caracteres";
                  }
                  return null;
                },
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Material(
                elevation: 5,
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
                child: MaterialButton(
                  onPressed: () {
                    bool isValid = true;
                    if (isValid) {
                      //Navigator.pushNamed(context, '/feed_screen');
                      final form = _formKey.currentState;
                      form!.save();
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (_formKey.currentState!.validate()) {
                        Get.offNamed('/feed_screen');
                      }
                    }
                  },
                  minWidth: 320,
                  height: 60,
                  child: const Text(
                    'Crear Cuenta',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}