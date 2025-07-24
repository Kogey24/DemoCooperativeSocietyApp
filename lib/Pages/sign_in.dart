import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? _gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 45, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Register Here",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),

                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your password',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your Phone Number',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 10, 15, 0),
                padding: const EdgeInsets.symmetric(vertical: 10),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Gender", style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Radio<String>(
                          value: "Male",
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text("Male"),
                        Radio<String>(
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          value: "Female",
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        const Text("Female"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {},
                  child: const Text("Register"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Already have an account? Log in ",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
