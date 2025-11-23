import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:istanbulguidetwo/common/bloc/button/button_state_cubit.dart';
import 'package:istanbulguidetwo/common/helper/navigator/app_navigator.dart';
import 'package:istanbulguidetwo/common/widget/button/basic_reactive_button.dart';
import 'package:istanbulguidetwo/core/utils/size_config.dart';
import 'package:istanbulguidetwo/presentation/auth/pages/reset_email_sent_page.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../domain/auth/usecase/reset_password_usecase.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushReplacement(context, const ResetEmailSentPage());
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.background,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipPath(
                  clipper: WaveClipperTwo(reverse: true),
                  child: Container(
                    height: SizeConfig.heightMultiplier(60),
                    width: SizeConfig.screenWidth,
                    color: AppColors.secondBackGround,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.widthMultiplier(10),
                        left: SizeConfig.widthMultiplier(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier(10)),
                          _resetPasswordText(context),
                          SizedBox(height: SizeConfig.heightMultiplier(5)),
                          _emailTextField(context),
                          SizedBox(height: SizeConfig.heightMultiplier(5)),
                          _resetPasswordButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordText(BuildContext context) {
    return Text(
      'Reset Password',
      style: TextStyle(
        fontSize: SizeConfig.textMultiplier(8),
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier(64),
      height: SizeConfig.heightMultiplier(4.8),
      child: TextField(
        controller: _emailCon,
        decoration: InputDecoration(hintText: 'Email'),
        style: TextStyle(fontFamily: 'Roboto', color: AppColors.inputColor),
      ),
    );
  }

  Widget _resetPasswordButton(BuildContext context) {
    return Builder(
      builder: (context) => BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
            usecase: ResetPasswordUseCase(),
            params: _emailCon.text,
          );
        },
        title: 'Reset Password',
      ),
    );
  }
}
