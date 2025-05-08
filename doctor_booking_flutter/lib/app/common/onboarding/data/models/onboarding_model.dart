import 'package:doctor_booking_flutter/src/constants/assets.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../lib.dart';

class OnboardingModel {
  final String imagePath;
  final String description;

  OnboardingModel({required this.imagePath, required this.description});

  static List<OnboardingModel> getAppOnboarding(BuildContext context) => [
    OnboardingModel(
        imagePath: AppAssets.onboarding2,
        description: AppLocalizations.of(context)!.onBoarding2),
    OnboardingModel(
        imagePath: AppAssets.onboarding4,
        description: AppLocalizations.of(context)!.onBoarding4),
    OnboardingModel(
        imagePath: AppAssets.onboarding3,
        description: AppLocalizations.of(context)!.onBoarding3),
  ];
}
