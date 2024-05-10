import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pas_service/router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';
  bool isPressed = false;

  login() async {
    setState(() {
      isPressed = true;
      message = '';
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      router.goNamed(RouterNames.home);
    } on FirebaseAuthException catch (e) {
      print('==================================================');
      print(e.code);
      setState(() {
        if (e.code == 'user-not-found') {
          message = 'Пользователь не найден';
        } else if (e.code == 'wrong-password') {
          message = 'Неверный пароль';
        } else if (e.code == 'invalid-credential') {
          message = 'Неверные данные для входа';
        }
      });
    } catch (e) {
      print(123123123);
    } finally {
      isPressed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Войти'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Пароль'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(message),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: login,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 64),
                  )),
                  child: isPressed
                      ? const CircularProgressIndicator.adaptive()
                      : const Text('Войти'),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => context.goNamed(RouterNames.register),
                  child: const Text(
                    'Нет аккаунта? Зарегистроваться',
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
    );
  }
}
