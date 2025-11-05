import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/utils/size_config.dart';
import '../../bloc/button/button_state.dart';
import '../../bloc/button/button_state_cubit.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? width;
  final double? height;
  const BasicReactiveButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state){
          if(state is ButtonLoadingState){
            return _loading(context);
          }
          return _initial(context);
        }
    );
  }

  Widget _loading(BuildContext context){
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? SizeConfig.widthMultiplier(50),height ?? SizeConfig.heightMultiplier(6))
        ),
        child: Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        )
    );
  }

  Widget _initial(BuildContext context){
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? SizeConfig.widthMultiplier(50), height ?? SizeConfig.heightMultiplier(6))
        ),
        child: Text(title,
        style: const TextStyle(
          color: AppColors.buttonTextColor
        ),)
    );
  }
}
