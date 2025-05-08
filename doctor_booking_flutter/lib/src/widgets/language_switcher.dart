import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctor_booking_flutter/src/providers.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ref.read(localeProvider.notifier).state = const Locale('en');
          },
          child: const Text('English'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            ref.read(localeProvider.notifier).state = const Locale('ar');
          },
          child: const Text('العربية'),
        ),
      ],
    );
  }
}
