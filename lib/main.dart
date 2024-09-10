import 'package:flutter/material.dart';
import 'package:flutter_hiragana_conversion_app/app_notifier_provider.dart';
import 'package:flutter_hiragana_conversion_app/app_state.dart';
import 'package:flutter_hiragana_conversion_app/convert_result.dart';
import 'package:flutter_hiragana_conversion_app/input_form.dart';
import 'package:flutter_hiragana_conversion_app/loading_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiragana Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends ConsumerWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Hiragana Converter')
      ),
      body: switch(appState) {
        Loading() => const LoadingIndicator(),
        Input() => const InputForm(),
        Data(sentence: final sentence) => ConvertResult(sentence: sentence,)
      },
    );
  }
}
