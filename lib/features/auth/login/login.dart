import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Вход'),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                placeholder: 'Email',
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoTextFormFieldRow(
                placeholder: 'Password',
                obscureText: true,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.inactiveGray),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 32.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    color: CupertinoColors.activeBlue,
                    child: const Text('Войти'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
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
      ),
    );
  }
}
