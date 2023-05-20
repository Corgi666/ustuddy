import 'package:flutter/material.dart';
// import 'package:masterclass/utils/theme_configs.dart';

class ContentAred extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentAred({super.key, this.addPadding = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        // decoration: BoxDecoration(color: customScaffoldColor(context)),
        padding: addPadding
            ? EdgeInsets.only(top: 25, left: 25, right: 25)
            : EdgeInsets.zero,
      ),
    );
  }
}
