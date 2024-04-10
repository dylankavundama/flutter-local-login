import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nom = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: nom,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Saisir le nom de l'utilisateur",
                    label: const Text('Utilisateur'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: pass,
                maxLength: 4,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  hintText: "Saisir le mot le mot de pass",
                  label: const Text('Mot de pass'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Connecter"),
              onPressed: () {
                final user = nom.text;
                final passW = pass.text;

                if (user == 'admin' && passW == '1111') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("mot de pass ou nom utilisateur incorrect"),
                    ),
                  );
                }
              },
            )
          ]),
    );
  }
}
