import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:url_launcher/url_launcher.dart';

class FundwiseVersionDocLink extends StatelessWidget {
  const FundwiseVersionDocLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse('https://github.com/Luckey-Elijah/fundwise');

    return Tooltip(
      waitDuration: Durations.long1,
      message: 'Open docs: $url',
      child: PressableBox(
        onPress: () async {
          if (!await launchUrl(url)) {
            log('Could not launch $url');
          }
        },
        style: Style(
          $on.hover($box.color.lighten(10), $text.style.color.darken(10)),
          $box.borderRadius.all(4),
          $box.padding.all(4),
          $box.margin.horizontal(4),
          $box.color.ref($material.colorScheme.primary),
          $text.style.fontFamily('monospace'),
          $text.style.color.ref($material.colorScheme.onPrimary),
        ),
        child: const StyledText('v0.0.1'),
      ),
    );
  }
}
