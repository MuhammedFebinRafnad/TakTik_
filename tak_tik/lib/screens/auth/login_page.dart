import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/providers/auth/login_pro.dart';
import 'package:tak_tik/screens/auth/Signup_page.dart';
import 'package:tak_tik/screens/auth/validator/validator.dart';
import 'package:tak_tik/screens/dashboard/home.dart';
import 'package:tak_tik/widgets/components/button.dart';
import 'package:tak_tik/widgets/Logo/Logowith_text.dart';
import 'package:tak_tik/widgets/Text/text.dart';
import 'package:tak_tik/widgets/Text/text_link.dart';
import 'package:tak_tik/widgets/animation/Login_anim.dart';
import 'package:tak_tik/widgets/animation/loading.dart';
import 'package:tak_tik/widgets/textfield.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _focusNodeEmail=FocusNode();
  final FocusNode _focusNodePass=FocusNode();

  
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<LoginProvider>(context, listen: false);
    try {
      await authProvider.login(_emailcontroller.text, _passwordcontroller.text);

      if (authProvider.messagefromapi == "You’ve successfully logged in.") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(authProvider.messagefromapi ?? "Login failed")),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An unexpected error occurred")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<LoginProvider>(builder: (context, authProvider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30.w, right: 30.w, bottom: 20.h, top: 30.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LogowithText(),
                      ],
                    ),
                    Text(
                      "Welcome back! Let's get things done",
                    ),
                    SizedBox(
                      height: 0.03.sh,
                    ),
                    LoginAnim(),
                    SizedBox(
                      height: 0.08.sh,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: Column(
                        children: [
                          AppTextFormField(
                            focusNode: _focusNodeEmail,
                            onSubmitted: (value) {
                              FocusScope.of(context).requestFocus(_focusNodePass);
                            },
                            validator: AuthValidator.emailValidator,
                            controller: _emailcontroller,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xFF006EE9),
                            ),
                            hintText: "Email",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          AppTextFormField(
                            validator: AuthValidator.passwordvalidator,
                            focusNode: _focusNodePass,
                            onSubmitted: (value) async{
                            await _submitForm();
                            },
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                icon: _obscurePassword
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            obscuretext: _obscurePassword,
                            controller: _passwordcontroller,
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFF006EE9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppPrimaryButton(
                      text: authProvider.isLoading?"Loading...":"Login",
                      onpressed: () async {
                        await _submitForm();
                      },
                    ),
                    if(authProvider.isLoading)LoadingAnimation(),
                    TextWithLink(
                        normaltext: "Don’t have an account?",
                        linktext: "Signup",
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ));
                        }),
                    SizedBox(
                      height: 100.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.h),
                      child: Text(
                        "By logging in, you agree to our Terms and Privacy Policy",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w100, // Extra light
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CopyRight()
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
