import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/theme/app_colors.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 20,
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome To NotePad.Ex',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  AuthInputField(
                    hint: "Email",
                    iconData: Icons.alternate_email_outlined,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Email";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value ?? "")) {
                        return "Enter a valid Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  AuthInputField(
                    hint: "Password",
                    iconData: Icons.lock_outline,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Password";
                      }
                      if (value!.length < 6) {
                        return "Password must be 6 character or more";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Create',
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text(
                      'Have an account? Login',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
