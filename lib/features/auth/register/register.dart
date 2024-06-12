import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/generated/l10n.dart';
import 'package:pas_service/router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  String message = '';
  bool isPressed = false;

  register() async {
    setState(() {
      isPressed = true;
      message = '';
    });
    try {
      var db = FirebaseFirestore.instance;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final user = <String, dynamic>{
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "isAdmin": false,
        "state": true,
        "firstTime": true,
      };
      await db.collection("users").doc(emailController.text).set(user);
      router.goNamed(RouterNames.home);
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'weak-password') {
          message = 'Пароль слишком лёгкий.';
        } else if (e.code == 'email-already-in-use') {
          message = 'Такой аккаунт уже сууществует';
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isPressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).registerTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 128.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text(S.of(context).email),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                label: Text(S.of(context).firstName),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                label: Text(S.of(context).lastName),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(S.of(context).password),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(message),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: register,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 64),
                  )),
                  child: isPressed
                      ? const CircularProgressIndicator.adaptive()
                      : Text(S.of(context).onRegister),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => context.goNamed(RouterNames.login),
                  child: Text(
                    S.of(context).haveAccount,
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
