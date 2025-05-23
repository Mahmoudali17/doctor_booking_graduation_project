import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;
  Color get secondary => Theme.of(this).colorScheme.secondary;
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get onSecondaryContainer =>
      Theme.of(this).colorScheme.onSecondaryContainer;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;
  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;
  Color get onTertiaryContainer =>
      Theme.of(this).colorScheme.onTertiaryContainer;
  Color get error => Theme.of(this).colorScheme.error;
  Color get onError => Theme.of(this).colorScheme.onError;
  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;
  Color get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;
  Color get background => Theme.of(this).colorScheme.surface;
  Color get onBackground => Theme.of(this).colorScheme.onSurface;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get surfaceVariant =>
      Theme.of(this).colorScheme.surfaceContainerHighest;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get outline => Theme.of(this).colorScheme.outline;
  Color get outlineVariant => Theme.of(this).colorScheme.outlineVariant;
  Color get shadow => Theme.of(this).colorScheme.shadow;
  Color get scrim => Theme.of(this).colorScheme.scrim;
  Color get inverseSurface => Theme.of(this).colorScheme.inverseSurface;
  Color get onInverseSurface => Theme.of(this).colorScheme.onInverseSurface;
  Color get inversePrimary => Theme.of(this).colorScheme.inversePrimary;
  Color get surfaceTint => Theme.of(this).colorScheme.surfaceTint;
}
