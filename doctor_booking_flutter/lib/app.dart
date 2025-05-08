import 'package:auto_route/auto_route.dart';
import 'package:doctor_booking_flutter/lib.dart';
import 'package:doctor_booking_flutter/src/observers.dart';
import 'package:doctor_booking_flutter/src/providers.dart';
import 'package:doctor_booking_flutter/src/res/theme/theme.dart';
//arabic language
import 'package:flutter/material.dart';
import 'package:doctor_booking_flutter/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart'; // You'll generate this file later


class DoctorBookingApp extends ConsumerWidget {
  const DoctorBookingApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouter);
    final locale = ref.watch(localeProvider); // 👈 Watch the locale state

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp.router(
              //arabic language
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale, // 👈 Apply the current locale dynamically

                title: 'Doctor booking',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: ref.watch(themeModeProvider),
                debugShowCheckedModeBanner: false,
                routeInformationParser: router.defaultRouteParser(),
                routeInformationProvider: router.routeInfoProvider(),
                routerDelegate: AutoRouterDelegate(
                  router,
                  navigatorObservers: () => [
                    AppRouteObservers(),
                  ],
                ),
                //home: const MyHomePage(title: 'Expense tracker'),
                );
          }),
    );
  }
}
