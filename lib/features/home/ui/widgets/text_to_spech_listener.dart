import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_to_spech/core/constant/app_images.dart';
import 'package:text_to_spech/core/global_widgets/app_loading.dart';
import 'package:text_to_spech/core/helpers/spacing.dart';
import 'package:text_to_spech/core/theming/colors.dart';
import 'package:text_to_spech/features/home/logic/cubit/text_to_spach_cubit.dart';
import 'package:voice_message_package/voice_message_package.dart';
import 'package:url_launcher/url_launcher.dart';

class TextToSpechListener extends StatelessWidget {
  const TextToSpechListener({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpachCubit, TextToSpachState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.when(initial: () {
          return const SizedBox.shrink();
        }, loading: () {
          return Column(
            children: [
              verticalSpace(50),
              const AppLoading(),
            ],
          );
        }, success: (textToSpechResponse) {
          return Row(
            children: [
              Expanded(
                flex: 5,
                child: VoiceMessageView(
                  activeSliderColor: ColorsManager.secondBlueColor,
                  circlesColor: ColorsManager.secondBlueColor,
                  controller: VoiceController(
                    isFile: false,
                    audioSrc: textToSpechResponse!.audioContent!,
                    maxDuration: const Duration(seconds: 10),
                    onComplete: () {},
                    onPause: () {
                      /// do something on pause
                    },
                    onPlaying: () {
                      /// do something on playing
                    },
                    onError: (err) {
                      /// do something on error
                    },
                  ),
                  innerPadding: 12,
                  cornerRadius: 20,
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () async {
                    await launchUrl(
                        Uri.parse(textToSpechResponse.audioContent!));
                  },
                  child: SvgPicture.asset(
                    AppImages.downToLine,
                    color: ColorsManager.secondBlueColor,
                  ),
                ),
              ),
            ],
          );
        }, error: (error) {
          return SvgPicture.asset(
            AppImages.errorGatewayTimeoutCuate,
          );
        });
      },
    );
  }
}
