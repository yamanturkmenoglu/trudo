import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_auth/feature_login/cubit/login_cubit/login_cubit_cubit.dart';
import 'package:trudo/features/feature_auth/feature_login/cubit/login_cubit/login_cubit_state.dart';
import 'package:trudo/widget/checkbox.dart';
import 'package:trudo/widget/login_button.dart';
import 'package:trudo/widget/social_button.dart';
import 'package:trudo/widget/textfild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                constraints:
                    const BoxConstraints(maxWidth: 280, maxHeight: 280),
                child: Image.asset(
                  AppImageasset.applogo,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                  child: Text('Log In',
                      style: poppinsSemiBoldExtraLarge.copyWith(
                          color: AppColor.purple))),
              const SizedBox(height: 8),
              Text('Welcome back! Please enter your details',
                  style:
                      poppinsMediumSmall.copyWith(color: AppColor.grifortext)),
              const SizedBox(height: 50),
              AuthField(
                iconColor: AppColor.purple,
                controller: _mailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                hintText: 'Email address',
                iconData: Icons.email,
                onChange: (String email) {
                  context.read<LoginCubit>().setEmail(email);
                },
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<bool>(
                valueListenable: _isPasswordVisible,
                builder: (context, bool pass, Widget? widget) {
                  return AuthField(
                    iconColor: AppColor.purple,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    onChange: (String password) {
                      context.read<LoginCubit>().setPassword(password);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      // if (!isPasswordStrong(value)) {
                      //   return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
                      // }
                      return null;
                    },
                    hintText: 'Password',
                    iconData: Icons.lock,
                    obscureText: pass,
                    suffixIcon: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isPasswordVisible.value = !_isPasswordVisible.value;
                        });
                      },
                      child: Icon(
                        pass ? Icons.visibility : Icons.visibility_off,
                        color: AppColor.purple,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  RememberMeCheckbox(
                    onRememberChanged: (value) {
                      setState(() {
                        isRemember = value;
                      });
                    },
                  ),
                  const Spacer(),
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.push(AppRoutes.forgetPasswordScreen);
                      },
                      child: Text('Forgot Password ?',
                          style: poppinsMediumSmall.copyWith(
                              color: AppColor.purple)))
                ],
              ),
              const SizedBox(height: 25),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.success) {
                    context.go(AppRoutes.home);
                  }
                },
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state.status == LoginStatus.loading ||
                        state.status == LoginStatus.submitting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primarycolor,
                      ));
                    }
                    if (state.status == LoginStatus.initial ||
                        state.status == LoginStatus.error) {
                      return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<LoginCubit>()
                                  .loginWithCredentials(context: context);
                            }
                          },
                          child: PrimaryButton(
                            text: state.status == LoginStatus.error
                                ? "${state.error}"
                                : 'Log In',
                          ));
                    }
                    return const SizedBox();
                  },
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onTap: () {}, icon: AppImageasset.kGoogle),
                  const SizedBox(width: 31),
                  SocialButton(onTap: () {}, icon: AppImageasset.kFacebook),
                  const SizedBox(width: 31),
                  SocialButton(onTap: () {}, icon: AppImageasset.kApple),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                        style: poppinsMediumSmall.copyWith(
                            color: AppColor.grifortext)),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.go(AppRoutes.signUp);
                      },
                      child: Text('Sign Up',
                          style: poppinsMediumNormal.copyWith(
                              color: AppColor.primarycolor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
