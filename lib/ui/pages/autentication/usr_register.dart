// ignore import 'package:core_event/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre del usuario',
                hintText: 'Nombre',
              ),
              maxLength: 25,
              onChanged: (value) {
                _name = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email del Usuario',
                hintText: 'Email',
              ),
              maxLength: 25,
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Clave de Acceso',
                hintText: 'Password',
              ),
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
                    Navigator.pushNamed(context, '/feed_screen');
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
    );
  }
}
