import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/gender_enum.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/ui_utils/validators.dart';
import '../controllers/signup_controller.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailETController;
  late final TextEditingController _passwordETController;
  late final TextEditingController _nameETController;

  GenderEnum _selectedGender = GenderEnum.male;

  @override
  void initState() {
    super.initState();
    _emailETController = TextEditingController();
    _passwordETController = TextEditingController();
    _nameETController = TextEditingController();
  }

  @override
  void dispose() {
    _emailETController.dispose();
    _passwordETController.dispose();
    _nameETController.dispose();
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
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome To NotePad.Ex',
                    textAlign: TextAlign.center,
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
                    hint: "Name",
                    controller: _nameETController,
                    iconData: Icons.person,
                    inputType: TextInputType.name,
                    validator: (value) =>
                        Validators.notEmptyValidator(value, "Name"),
                  ),
                  const SizedBox(height: 20.0),
                  AuthInputField(
                    hint: "Email",
                    controller: _emailETController,
                    iconData: Icons.alternate_email_outlined,
                    inputType: TextInputType.emailAddress,
                    validator: Validators.emailValidator,
                  ),
                  const SizedBox(height: 20.0),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Select your gender',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _GenderButton(
                    gender: GenderEnum.male,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      _selectedGender = value ?? GenderEnum.male;
                      setState(() {});
                    },
                  ),
                  _GenderButton(
                    gender: GenderEnum.female,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      _selectedGender = value ?? GenderEnum.female;
                      setState(() {});
                    },
                  ),
                  _GenderButton(
                    gender: GenderEnum.other,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      _selectedGender = value ?? GenderEnum.other;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 20.0),
                  AuthInputField(
                    hint: "Password",
                    controller: _passwordETController,
                    iconData: Icons.lock_outline,
                    obscureText: true,
                    validator: Validators.passwordValidator,
                  ),
                  const SizedBox(height: 30.0),
                  AuthInputField(
                    hint: "Confirm Password",
                    iconData: Icons.lock_outline,
                    obscureText: true,
                    validator: (value) {
                      return Validators.matchValidator(
                          value, _passwordETController.text);
                    },
                  ),
                  const SizedBox(height: 30.0),
                  GetBuilder<SignupController>(builder: (controller) {
                    return ElevatedButton(
                      onPressed: () {
                        log("Signup Pressed");
                        if (!controller.isLoading &&
                            (_signUpFormKey.currentState?.validate() ??
                                false)) {
                          log("Validate Conditions");
                          controller.signup(
                            context,
                            _nameETController.text,
                            _emailETController.text.trim(),
                            _passwordETController.text,
                            _selectedGender,
                          );
                        }
                      },
                      child: Visibility(
                        visible: !controller.isLoading,
                        replacement: const SizedBox.square(
                          dimension: 28,
                          child: CircularProgressIndicator(),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(color: AppColors.blue),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      context.go(RouteName.kLogin);
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

class _GenderButton extends StatelessWidget {
  const _GenderButton({
    required this.gender,
    required this.onChanged,
    required this.groupValue,
  });

  final GenderEnum gender;
  final GenderEnum groupValue;
  final Function(GenderEnum?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            gender.toName(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 12),
          Icon(
            gender.getIcon(),
            size: 12,
            color: AppColors.white,
          ),
        ],
      ),
      fillColor: WidgetStateColor.resolveWith(
        (_) => AppColors.white,
      ),
      value: gender,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
