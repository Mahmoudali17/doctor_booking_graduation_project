
import 'package:auto_route/auto_route.dart';
import 'package:doctor_booking_flutter/app/common/onboarding/data/models/onboarding_model.dart';
import 'package:doctor_booking_flutter/app/common/onboarding/presentation/ui/widgets/onboarding_item.dart';
import 'package:doctor_booking_flutter/app/common/onboarding/presentation/ui/widgets/page_indicator.dart';
import 'package:doctor_booking_flutter/lib.dart';
import 'package:doctor_booking_flutter/src/extensions/context.dart';
import 'package:doctor_booking_flutter/src/widgets/margin.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../src/widgets/language_switcher.dart';

@RoutePage(name: 'onboarding')
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: isRtl ? Alignment.topRight : Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: isRtl ? 0.0 : 8.0, right: isRtl ? 8.0 : 0.0),
            child: Text(
              AppLocalizations.of(context)!.mediSmart,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20.0, // Adjust the font size as needed
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Align(
            alignment: isRtl ? Alignment.topLeft : Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  left: isRtl ? 16.0 : 0.0, right: isRtl ? 0.0 : 16.0),
              child: LanguageSwitcher(),
            ),
          ),
        ],
        automaticallyImplyLeading: true,
        titleSpacing: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const ColSpacing(10),
                  SizedBox(
                    height: 380.h,
                    child: PageView.builder(
                      itemCount: OnboardingModel.getAppOnboarding(context).length,
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) => AnimatedScale(
                        scale: currentPage == index ? 1.0 : 0.2,
                        duration: const Duration(milliseconds: 400),
                        child: OnboardingItem(
                            model: OnboardingModel.getAppOnboarding(context)[index]),
                      ),
                    ),
                  ),
                  OnBoardingPageIndicator(
                      currentPage: currentPage,
                      totalPages: OnboardingModel.getAppOnboarding(context).length),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: SizedBox(
                      height: 100.h,
                      child: KText(
                        OnboardingModel.getAppOnboarding(context)[currentPage].description,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 216.h,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: context.primary,
                /*borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  )*/
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context.pushRoute(const DoctorLogin());

                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1, color: context.onPrimary),
                          foregroundColor: context.onPrimary),
                      child: Text(AppLocalizations.of(context)!.continueAsDoctor),
                    ),
                  ),
                  ColSpacing(10.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushRoute(const PatientLogin());
                      },
                      child: Text(AppLocalizations.of(context)!.continueAsPatient),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
