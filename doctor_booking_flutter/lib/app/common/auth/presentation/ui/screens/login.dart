import 'package:auto_route/auto_route.dart';
import 'package:doctor_booking_flutter/app/common/auth/domain/params/user_credentials.dart';
import 'package:doctor_booking_flutter/app/common/auth/providers.dart';
import 'package:doctor_booking_flutter/core/service_exceptions/service_exception.dart';
import 'package:doctor_booking_flutter/core/validators/text_field_validators.dart';
import 'package:doctor_booking_flutter/lib.dart';
import 'package:doctor_booking_flutter/src/constants/constants.dart';
import 'package:doctor_booking_flutter/src/router/navigator.dart';
import 'package:doctor_booking_flutter/src/widgets/alert_dialog.dart';
import 'package:doctor_booking_flutter/src/widgets/loader/loader.dart';
import 'package:flutter/gestures.dart';

import '../../../../../../l10n/app_localizations.dart';


@RoutePage(name: 'login')
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //text controllers
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final forgotPasswordEmailController = useTextEditingController();
    //remember me checkbox
    final rememberMe = useState(false);

    // auth provider
    final auth = ref.read(authRepoProvider);
    //formKey
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            KText(
              AppLocalizations.of(context)!.welcome,
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
            ),
            KText(
              AppLocalizations.of(context)!.gladToSeeYou,
              fontSize: 18.sp,
            ),
            SizedBox(
              height: 56.h,
            ),

            ///Textfield for email address
            DefaultTextFormField(
                label: AppLocalizations.of(context)!.emailAddress,
                hint: 'user@example.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Email address is required';
                  } else if (value.isNotEmpty &&
                      !TextFieldValidator.emailExp.hasMatch(value)) {
                    return 'Email address not valid';
                  }
                  return null;
                }),

            ///Textfield for password
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: PasswordTextField(
                label: AppLocalizations.of(context)!.password,
                controller: passwordController,
                emptyTextError: 'Password is required',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Checkbox(
                          value: rememberMe.value,
                          onChanged: (value) {
                            rememberMe.value = value!;
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child:  KText(AppLocalizations.of(context)!.rememberMe),
                    )
                  ],
                ),

                ///FORGOT PASSWORD
                InkWell(
                  onTap: () async {
                    ///Open BOTTOM SHEET and CONTACT FIREBASE HERE
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: SingleChildScrollView(
                            child: SizedBox(
                              height: 450.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 24.h),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.cancel,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: KText(
                                        AppLocalizations.of(context)!.enteryouremailaddressheretoresetpassword,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 24.h,
                                      ),
                                      child: DefaultTextFormField(
                                        label: AppLocalizations.of(context)!.emailAddress,
                                        hint: 'user@example.com',
                                        controller:
                                            forgotPasswordEmailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: FilledButton(
                                        onPressed: () async {
                                          //get email in plain text
                                          String email =
                                              forgotPasswordEmailController.text
                                                  .trim();
                                          //check if email is valid, then send 'forget password' request to server
                                          if (TextFieldValidator.emailExp
                                              .hasMatch(email)) {
                                            Loader.show(context);

                                            final result = await auth
                                                .forgotPassword(email);
                                            result.when(success: (_) {
                                              Loader.hide(context);
                                              AutoRouter.of(context)
                                                  .popUntilRoot();
                                            }, apiFailure: (e, _) {
                                              Loader.hide(context);
                                              AppNavigator.of(context).pop();
                                              showMessageAlertDialog(context,
                                                  text: e.message);
                                            });

                                            /*await auth
                                                .forgotPassword(email)
                                                .then(
                                              (value) {
                                                  AutoRouter.of(context).popUntilRoot();
                                                */ /*Navigator.pop(context);
                                                Navigator.pop(context);*/ /*
                                                showMessageAlertDialog(context,
                                                    text:
                                                        'Password reset link has been successfully 1sent to your email address');
                                              },
                                            );*/
                                          } else {
                                            //if email is no valid, prompt user to input valid mail
                                            showMessageAlertDialog(context,
                                                text:
                                                    AppLocalizations.of(context)!.provideEmail);
                                          }
                                        },
                                        child: Text(AppLocalizations.of(context)!.resetpassword),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: KText(AppLocalizations.of(context)!.forgotPassword,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),

            ///LOGIN BUTTON
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: FilledButton(
                  onPressed: () async {
                    //if form is valid, try to login
                    if (formKey.currentState!.validate()) {
                      Loader.show(context);
                      UserCred user = UserCred(
                          email: emailController.text.trim(),
                          password: passwordController.text);
                      final result = await auth.patientLogin(user);
                      Loader.hide(context);
                      result.when(success: (data) {
                        //if the login was successful, navigate to home screen
                      }, apiFailure: (e, _) {
                        showMessageAlertDialog(context, text: e.message);
                      });
                    }
                  },
                  child:  KText(AppLocalizations.of(context)!.login)),
            ),

            const Row(
              children: [
                Expanded(child: Divider()),
                KText('  Or Login with  '),
                Expanded(child: Divider())
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: OutlinedButton(
                  onPressed: () async {
                    Loader.show(context);
                    final result = await auth.googleSignIn();
                    Loader.hide(context);
                    result.when(
                        success: (data) {},
                        apiFailure: (e, _) {
                          showMessageAlertDialog(context, text: e.message);
                        });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(AppAssets.googleIcon),
                      ),
                      const KText('Login with Google'),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {},
              child: Text.rich(
                TextSpan(children: [
                   TextSpan(text: AppLocalizations.of(context)!.dontHaveanAccount),
                  TextSpan(
                      text: AppLocalizations.of(context)!.signup,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {

                        },
                      style: AppStyle.textStyle
                          .copyWith(fontWeight: FontWeight.w500))
                ]),
                textAlign: TextAlign.center,
                style: AppStyle.textStyle.copyWith(fontSize: 16.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
