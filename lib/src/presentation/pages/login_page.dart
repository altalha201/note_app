import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/ui_utils/validators.dart';
import '../controllers/login_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginValidationKey = GlobalKey<FormState>();

  late final TextEditingController _emailETController;
  late final TextEditingController _passwordETController;

  @override
  void initState() {
    super.initState();
    _emailETController = TextEditingController();
    _passwordETController = TextEditingController();
  }

  @override
  void dispose() {
    _emailETController.dispose();
    _passwordETController.dispose();
    super.dispose();
  }

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
              key: _loginValidationKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Login to your account',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  AuthInputField(
                    hint: "Email",
                    iconData: Icons.alternate_email_outlined,
                    controller: _emailETController,
                    inputType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),
                  const SizedBox(height: 20.0),
                  AuthInputField(
                    hint: "Password",
                    iconData: Icons.lock_outline,
                    obscureText: true,
                    controller: _passwordETController,
                    validator: Validators.passwordValidator,
                  ),
                  const SizedBox(height: 30.0),
                  GetBuilder<LoginController>(builder: (controller) {
                    return ElevatedButton(
                      onPressed: () {
                        if (!controller.isLoading && (_loginValidationKey.currentState?.validate() ?? false)) {
                          controller.login(context, _emailETController.text.trim(), _passwordETController.text);
                        }
                      },
                      child: Visibility(
                        visible: !controller.isLoading,
                        replacement: const SizedBox.square(
                          dimension: 28,
                          child: CircularProgressIndicator(),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: AppColors.blue),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      context.go(RouteName.kSignup);
                    },
                    child: const Text(
                      'Don\'t have an account? Sign up',
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
