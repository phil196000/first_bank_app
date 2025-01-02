import 'package:first_bank_app/constants/spacing.dart';
import 'package:flutter/material.dart';

class PrimaryLayout extends StatelessWidget {
  const PrimaryLayout({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(
      Spacing.s16,
    ),
    this.appBar,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
  });
  final PreferredSizeWidget? appBar;
  final Widget child;
  final EdgeInsets padding;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      endDrawer: endDrawer,
      backgroundColor: Colors.white,
      appBar: appBar,
      persistentFooterButtons: persistentFooterButtons,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: double.infinity,
          height: double.infinity,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
