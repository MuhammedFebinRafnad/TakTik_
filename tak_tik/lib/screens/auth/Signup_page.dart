import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/providers/auth/register_pro.dart';
import 'package:tak_tik/screens/auth/login_page.dart';
import 'package:tak_tik/screens/auth/validator/validator.dart';
import 'package:tak_tik/widgets/components/button.dart';
import 'package:tak_tik/widgets/Logo/Logowith_text.dart';
import 'package:tak_tik/widgets/animation/confetti.dart';
import 'package:tak_tik/widgets/animation/loading.dart';
import 'package:tak_tik/widgets/animation/Registration_bg.dart';
import 'package:tak_tik/widgets/Text/text.dart';
import 'package:tak_tik/widgets/Text/text_link.dart';
import 'package:tak_tik/widgets/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> handlesignup() async {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<RegisterProvider>(context, listen: false);
      await provider.register(_nameController.text, _emailController.text,
          _passwordController.text);
      log(provider.messagefromapi.toString());
      if (provider.messagefromapi != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            provider.messagefromapi.toString(),
            style: AppTextStyles.SnackBar,
          ),
          backgroundColor:
              provider.messagefromapi!.toLowerCase().contains("success")
                  ? Colors.green
                  : Colors.red,
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ));
        if (provider.messagefromapi!.toLowerCase().contains("success")) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Stack(
                  children: [Loginpage(), ConfettiAnimation()],
                ),
              ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<RegisterProvider>(builder: (context, Provider, child) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogowithText(),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "New here? Let’s get things done with Taktik.",
                  style: TextStyle(fontSize: 14.h),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RegBg(),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h),
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _nameController,
                        validator: AuthValidator.usernamevalidator,
                        hintText: "Name",
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFF006EE9)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextFormField(
                          controller: _emailController,
                          validator: AuthValidator.emailValidator,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined,
                              color: Color(0xFF006EE9))),
                      SizedBox(
                        height: 20.h,
                      ),
                      AppTextFormField(
                          controller: _passwordController,
                          obscuretext: _obscurePassword,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: _obscurePassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          validator: AuthValidator.passwordvalidator,
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF006EE9),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                AppPrimaryButton(
                  text: "signup",
                  onpressed: Provider.isLoading
                      ? null
                      : () async {
                          await handlesignup();
                        },
                ),
                if (Provider.isLoading) LoadingAnimation(),
                TextWithLink(
                  normaltext: "Already have an account?",
                  linktext: "Login",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(),
                        ));
                  },
                ),
                SizedBox(
                  height: 100.h,
                ),
                CopyRight()
              ],
            ),
          ),
        );
      }),
    ));
  }
}
