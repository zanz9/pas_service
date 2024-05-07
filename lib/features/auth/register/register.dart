import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        email: emailController.text,
        password: passwordController.text,
      );
      final user = <String, dynamic>{
        "firstName": firstNameController.text,
        "lastName": lastNameController.text
      };
      await db.collection("users").doc(emailController.text).set(user);
      router.go('/');
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
      body: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Регистрация'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                controller: emailController,
                placeholder: 'Email',
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                controller: firstNameController,
                placeholder: 'Имя',
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                controller: lastNameController,
                placeholder: 'Фамилия',
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                controller: passwordController,
                placeholder: 'Пароль',
                obscureText: true,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(message),
              const SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: register,
                    color: CupertinoColors.activeBlue,
                    child: isPressed
                        ? const CircularProgressIndicator.adaptive()
                        : const Text('Зарегистрироваться'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.go('/login');
                    },
                    child: const Text(
                      'Уже есть аккаунт? Войти',
                      style: TextStyle(
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
      ),
    );
  }
}
