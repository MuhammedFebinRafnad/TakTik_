  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/core/styles/app_dec.dart';
import 'package:tak_tik/providers/main/profile_prov.dart';
  import 'package:tak_tik/widgets/components/button.dart';
  import 'package:tak_tik/widgets/Text/text.dart';
  import 'package:tak_tik/widgets/components/textfield_read.dart';

  class ProfileScreen extends StatefulWidget {

    const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController namecontrl;
  late final TextEditingController profcontrl;
  late final TextEditingController emailcontrl;
  @override
  void initState() {
    super.initState();
      namecontrl = TextEditingController();
    profcontrl = TextEditingController();
    emailcontrl = TextEditingController();
    _loadProfession();
  }
  Future<void>_loadProfession()async{
    final profileprov=Provider.of<ProfileProv>(context,listen: false);
    await profileprov.loadProfession();
  }

    @override
    Widget build(BuildContext context) {
      final profileProv = Provider.of<ProfileProv>(context);
      namecontrl.text=profileProv.profile?.name.toUpperCase()??"";
      emailcontrl.text=profileProv.profile?.email??"";
      profcontrl.text=profileProv.profession;
  
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppDec.maincolor,
          title: Text(
            "My Profile",
            style: GoogleFonts.poppins(textStyle: AppTextStyles.AppBartitle),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppDec.maincolor,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 40.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: AppDec.topRoundedWhite,
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[200],
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/Images/prf.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                namecontrl.text,
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(profcontrl.text)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        LabeledTextField(
                          readonly: true,
                          label: "Name",
                          controller: namecontrl,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        LabeledTextField(
                          hintText: "Add your Profession",
                            label: "Profession", controller: profcontrl),
                        SizedBox(
                          height: 20.h,
                        ),  
                        LabeledTextField(
                          readonly: true,
                          label: "Email",
                         controller: emailcontrl),
                        SizedBox(
                          height: 20.h,
                        ),  
                        AppPrimaryButton(text: "save", onpressed: ()async{
                        await  profileProv.saveprofession(profcontrl.text);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profession saved")));
                        }),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
}
