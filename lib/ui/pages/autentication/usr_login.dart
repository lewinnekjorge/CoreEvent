// ignore_for_file: dead_code
// import 'package:core_event/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  // ignore: unused_field
  late String _email;
  // ignore: unused_field
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
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
                labelText: 'Digita tu email',
                hintText: 'Digita tu email',
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
                labelText: 'Digita tu password',
                hintText: 'Digita tu password',
              ),
              maxLength: 25,
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
                  'Acceder',
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
