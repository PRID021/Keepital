import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepital/app/core/values/app_colors.dart';
import 'package:keepital/app/core/values/app_strings.dart';
import 'package:keepital/app/core/values/asset_strings.dart';
import 'package:get/get.dart';
import 'package:keepital/app/enums/app_enums.dart';
import 'package:keepital/app/global_widgets/default_loading.dart';
import 'package:keepital/app/modules/auth/auth_controller.dart';
import 'package:keepital/app/modules/auth/widgets/button_with_lead_icon.dart';

class AuthenticationScreen extends StatelessWidget {
  final _controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Image.asset(AssetStringsPng.logo),
                width: 100,
                height: 100,
              ),
            ),
            Text(
              AppStrings.appName,
              style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            AnimatedTextKit(totalRepeatCount: 10, animatedTexts: [
              TyperAnimatedText(AppStrings.appSlogan, textStyle: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.normal)),
            ]),
            Container(
              child: SvgPicture.asset(AssetStringsSvg.financialGoal),
              width: 400,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("inspirational".tr, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.normal)),
            ),
            const SizedBox(height: 10),
            Obx(() => _controller.isLoading.value ? const Center(child: DefaultLoading(size: 40)) : _buildSignInButton()),
          ],
        ),
      ),
    );
  }

  Column _buildSignInButton() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: ButtonWithLeadIcon(onPressed: () => _controller.handleSignIn(SignInType.withGoogle), text: 'login_google'.tr, path: AssetStringsPng.gooogleLogo),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ButtonWithLeadIcon(onPressed: () => _controller.handleSignIn(SignInType.withFacebook), text: 'login_facebook'.tr, path: AssetStringsPng.facebookLogo),
        )
      ],
    );
  }
}
