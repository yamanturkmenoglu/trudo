import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/core/constens/appimages.dart';
import 'package:trudo/core/constens/textstyle.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/cubit/signup_cubit/signup_cubit_cubit.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/cubit/signup_cubit/signup_cubit_state.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/presentation/widget/verify_your_email_function_failure.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/presentation/widget/verify_your_email_function_sucsses.dart';
import 'package:trudo/widget/login_button.dart';
import 'package:trudo/widget/social_button.dart';
import 'package:trudo/widget/textfild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _isPasswordVisible = false;
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
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: Text('Create Account',
                      style: poppinsSemiBoldExtraLarge.copyWith(
                          color: AppColor.purple))),
              const SizedBox(height: 5),
              Text('To create a new Please enter your details',
                  style:
                      poppinsMediumSmall.copyWith(color: AppColor.grifortext)),
              const SizedBox(height: 50),
              AuthField(
                iconColor: AppColor.purple,
                controller: _userNameController,
                keyboardType: TextInputType.name,
                onChange: (String name) {
                  context.read<SignupCubit>().setName(name);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                hintText: 'Name',
                iconData: Icons.person,
              ),
              const SizedBox(height: 16),
              AuthField(
                iconColor: AppColor.purple,
                controller: _companyNameController,
                keyboardType: TextInputType.name,
                onChange: (lastname) {
                  context.read<SignupCubit>().setLastName(lastname);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
                hintText: 'Last Name',
                iconData: FontAwesomeIcons.clipboardUser,
              ),
              const SizedBox(height: 16),
              AuthField(
                iconColor: AppColor.purple,
                controller: _mailController,
                keyboardType: TextInputType.emailAddress,
                onChange: (email) {
                  context.read<SignupCubit>().setEmail(email);
                },
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
              ),
              const SizedBox(height: 16),
              AuthField(
                iconColor: AppColor.purple,
                controller: _phoneNumberController,
                keyboardType: TextInputType.name,
                onChange: (phone) {
                  context.read<SignupCubit>().setPhoneNumber(phone);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone address';
                  }
                  return null;
                },
                hintText: 'Phone Number',
                iconData: Icons.phone,
              ),
              const SizedBox(height: 16),
              AuthField(
                iconColor: AppColor.purple,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                onChange: (password) {
                  context.read<SignupCubit>().setPassword(password);
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
                suffixIcon: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColor.purple,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              BlocListener<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state.status == Status.success) {
                    verifyYourEmailFunction(context);
                  } else if (state.status == Status.error) {
                    verifyYourEmailFunctionFailure(context);
                  }
                },
                child: BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    if (state.status == Status.loading ||
                        state.status == Status.submitting) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: AppColor.primarycolor));
                    }
                    if (state.status == Status.initial ||
                        state.status == Status.error) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<SignupCubit>()
                                .signupWithCredentials(context: context);
                          }
                        },
                        child: const PrimaryButton(text: 'Sign Up'),
                      );
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
                    Text("I already have an account ",
                        style: poppinsMediumSmall.copyWith(
                            color: AppColor.grifortext)),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.go(AppRoutes.login);
                      },
                      child: Text('Login ',
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
