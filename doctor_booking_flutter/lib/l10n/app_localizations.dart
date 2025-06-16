import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @mediSmart.
  ///
  /// In en, this message translates to:
  /// **'MediSmart'**
  String get mediSmart;

  /// No description provided for @onBoarding2.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our Doctor Booking App! Get ready to take control of your healthcare journey'**
  String get onBoarding2;

  /// No description provided for @onBoarding4.
  ///
  /// In en, this message translates to:
  /// **'Easily find and book appointments with trusted doctors in just a few taps. Say goodbye to long waiting times and hello to hassle-free appointments'**
  String get onBoarding4;

  /// No description provided for @onBoarding3.
  ///
  /// In en, this message translates to:
  /// **'Start your journey to better health by finding and booking appointments with top doctors in your area'**
  String get onBoarding3;

  /// No description provided for @continueAsDoctor.
  ///
  /// In en, this message translates to:
  /// **'Continue as Doctor'**
  String get continueAsDoctor;

  /// No description provided for @continueAsPatient.
  ///
  /// In en, this message translates to:
  /// **'Continue as Patient'**
  String get continueAsPatient;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @welcomeHand.
  ///
  /// In en, this message translates to:
  /// **'Welcome!👋'**
  String get welcomeHand;

  /// No description provided for @gladToSeeYou.
  ///
  /// In en, this message translates to:
  /// **'Glad to see you again! 👋'**
  String get gladToSeeYou;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @welcomeDoctor.
  ///
  /// In en, this message translates to:
  /// **'Welcome Doctor!'**
  String get welcomeDoctor;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @enteryouremailaddressheretoresetpassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address here to reset password'**
  String get enteryouremailaddressheretoresetpassword;

  /// No description provided for @provideEmail.
  ///
  /// In en, this message translates to:
  /// **'Provide a valid email address to continue to password reset'**
  String get provideEmail;

  /// No description provided for @resetpassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetpassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveanAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\\\'t have an account?  '**
  String get dontHaveanAccount;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get signup;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @pleaseFill.
  ///
  /// In en, this message translates to:
  /// **'Please fill in the details below to create your account'**
  String get pleaseFill;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses & Privacy Policy'**
  String get licenses;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSure;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @appointmentDetails.
  ///
  /// In en, this message translates to:
  /// **'Appointment Details'**
  String get appointmentDetails;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @typeYourFullNameHere.
  ///
  /// In en, this message translates to:
  /// **'Type your full name here'**
  String get typeYourFullNameHere;

  /// No description provided for @chooseaSpeciality.
  ///
  /// In en, this message translates to:
  /// **'Choose a speciality'**
  String get chooseaSpeciality;

  /// No description provided for @createDoctorAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Doctor Account'**
  String get createDoctorAccount;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload brain_tumor Image'**
  String get uploadImage;

  /// No description provided for @uploadPneumoniaImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Pneumonia Image'**
  String get uploadPneumoniaImage;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @analyzeImage.
  ///
  /// In en, this message translates to:
  /// **'Analyze Image'**
  String get analyzeImage;

  /// No description provided for @appointmentCancelledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Appointment cancelled successfully'**
  String get appointmentCancelledSuccessfully;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @patientNote.
  ///
  /// In en, this message translates to:
  /// **'Patient Note'**
  String get patientNote;

  /// No description provided for @noNoteAdded.
  ///
  /// In en, this message translates to:
  /// **'No note added'**
  String get noNoteAdded;

  /// No description provided for @deleteAppointment.
  ///
  /// In en, this message translates to:
  /// **'Delete Appointment'**
  String get deleteAppointment;

  /// No description provided for @areYouSureYouWantToDeleteThisAppointment.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this appointment?'**
  String get areYouSureYouWantToDeleteThisAppointment;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cancelAppointment.
  ///
  /// In en, this message translates to:
  /// **'Cancel Appointment'**
  String get cancelAppointment;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @youCanOnlyCancel.
  ///
  /// In en, this message translates to:
  /// **'You can only cancel 24 hours before the appointment'**
  String get youCanOnlyCancel;

  /// No description provided for @unableToCancelAppointment.
  ///
  /// In en, this message translates to:
  /// **'Unable to cancel appointment'**
  String get unableToCancelAppointment;

  /// No description provided for @areYouSureYouWantToCancelThisAppointment.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this appointment?'**
  String get areYouSureYouWantToCancelThisAppointment;

  /// No description provided for @addaNoteForYourAppointment.
  ///
  /// In en, this message translates to:
  /// **'Add a note for your appointment'**
  String get addaNoteForYourAppointment;

  /// No description provided for @typeNoteHere.
  ///
  /// In en, this message translates to:
  /// **'Type note here'**
  String get typeNoteHere;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNote;

  /// No description provided for @bookingComplete.
  ///
  /// In en, this message translates to:
  /// **'Booking complete'**
  String get bookingComplete;

  /// No description provided for @yourAppointmentHasBeenBooked.
  ///
  /// In en, this message translates to:
  /// **'Your appointment has been booked successfully, do you want to add this appointment to your Calendar?'**
  String get yourAppointmentHasBeenBooked;

  /// No description provided for @bookAppointment.
  ///
  /// In en, this message translates to:
  /// **'Book appointment'**
  String get bookAppointment;

  /// No description provided for @doctorDetails.
  ///
  /// In en, this message translates to:
  /// **'Doctor details'**
  String get doctorDetails;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @noUpcomingAppointmentFound.
  ///
  /// In en, this message translates to:
  /// **'No upcoming appointment found'**
  String get noUpcomingAppointmentFound;

  /// No description provided for @upcomingAppointments.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointments'**
  String get upcomingAppointments;

  /// No description provided for @letsFindYourDoctor.
  ///
  /// In en, this message translates to:
  /// **'Let\\\'s find your doctor'**
  String get letsFindYourDoctor;

  /// No description provided for @noDoctorFound.
  ///
  /// In en, this message translates to:
  /// **'No doctor found, please check in later'**
  String get noDoctorFound;

  /// No description provided for @upcomingSchedules.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Schedules'**
  String get upcomingSchedules;

  /// No description provided for @searchDoctorHere.
  ///
  /// In en, this message translates to:
  /// **'Search doctor here'**
  String get searchDoctorHere;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
