// ignore: file_names
import 'package:demo_cooperative_society/Home.dart';
import 'package:demo_cooperative_society/Pages/sign_in.dart';
import 'package:demo_cooperative_society/providers/login_provider.dart'; // your loginProvider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignupPagestate();
}

class _SignupPagestate extends ConsumerState<SignUpPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey();
  final RegExp phonePattern = RegExp(r'^(?:\+254|0)?7\d{8}$');

  Future<void> _login() async {
    if (_signUpKey.currentState!.validate()) {
      final username = _phoneController.text.trim();
      final password = _passwordController.text.trim();

      debugPrint("Login request: { cmusername: $username, pass: $password }");

      try {
        final response = await ref
            .read(loginProvider.notifier)
            .loginUser(username, password);

        debugPrint("Login response: ${response?.toJson() ?? response}");

        if (response != null && response.message == "Successful login!") {
          GFToast.showToast(
            "Welcome ${response.name} 🎉",
            context,
            toastDuration: 3,
            toastPosition: GFToastPosition.BOTTOM,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(color: Colors.white),
          );
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (response != null && response.message == "Not authorized") {
          GFToast.showToast(
            response.message,
            context,
            toastDuration: 3,
            toastPosition: GFToastPosition.BOTTOM,
            backgroundColor: Colors.red,
            textStyle: const TextStyle(color: Colors.white),
          );
        }
      } catch (e) {
        debugPrint("Login error: $e");
        GFToast.showToast(
          e.toString(),
          context,
          toastDuration: 3,
          toastPosition: GFToastPosition.BOTTOM,
          backgroundColor: Colors.red,
          textStyle: const TextStyle(color: Colors.white),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF87CEEB), Color(0xFF000080)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(5, 150, 5, 0),
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: const Text(
                  "Welcome to CoopX",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(5, 50, 5, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF000080), Color(0xFF001F4D)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Form(
                  key: _signUpKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an phone number";
                            } else if (!phonePattern.hasMatch(value)) {
                              return "Please enter a valid phone number";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            hintText: 'Enter your phone',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Colors.blue,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: _login, // 🔥 Calls login now
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
