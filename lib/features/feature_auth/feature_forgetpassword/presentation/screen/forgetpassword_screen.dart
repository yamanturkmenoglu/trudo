import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trudo/core/constens/appcolors.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/cubit/forget_password_cubit/forget_password_cubit_cubit.dart';
import 'package:trudo/features/feature_auth/feature_forgetpassword/cubit/forget_password_cubit/forget_password_cubit_state.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/presentation/widget/verify_your_email_function_failure.dart';
import 'package:trudo/features/feature_auth/feature_sign_up/presentation/widget/verify_your_email_function_sucsses.dart';
import 'package:trudo/widget/login_button.dart';
import 'package:trudo/widget/textfild.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController mailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        iconTheme: const IconThemeData(color: AppColor.primarycolor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text('Forget\nPassword',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.purple, fontSize: 40)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    'To reset your password, write your e-mail below and a mail will be sent to your e-mail to reset your password.',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.grifortext)),
                const SizedBox(
                  height: 80,
                ),
                AuthField(
                  iconColor: AppColor.purple,
                  controller: mailController,
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
                  onChange: (value) {
                    context.read<ForgetPasswordCubit>().setEmail(value);
                  },
                ),
                const SizedBox(
                  height: 120,
                ),
                BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state.status == Status.success) {
                      verifyYourEmailFunction(context);
                    } else if (state.status == Status.error) {
                      verifyYourEmailFunctionFailure(context);
                    }
                  },
                  child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    builder: (context, state) {
                      if (state.status == Status.loading ||
                          state.status == Status.submitting) {
                        return const Center(
                            child: CircularProgressIndicator(
                                color: AppColor.primarycolor));
                      }
                      if (state.status == Status.initial ||
                          state.status == Status.error) {
                        return Center(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<ForgetPasswordCubit>()
                                    .forgetPassword(context);
                              }
                            },
                            child: const PrimaryButton(text: 'Send reset link'),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
