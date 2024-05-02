import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoLoginPage();
  }
}

class CupertinoLoginPage extends StatelessWidget {
  const CupertinoLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
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
                  color: CupertinoColors.activeBlue,
                  child: const Text('Login'),
                  onPressed: () {
                    // Handle login button press
                  },
                ),
                GestureDetector(
                  child: const Text(
                    'Register',
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
