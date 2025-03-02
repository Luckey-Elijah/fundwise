import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@immutable
class FundwiseColorScheme extends ShadColorScheme {
  const FundwiseColorScheme.light({
    super.background = const Color(0xffffffff),
    super.foreground = const Color(0xff020817),
    super.card = const Color(0xffffffff),
    super.cardForeground = const Color(0xff020817),
    super.popover = const Color(0xffffffff),
    super.popoverForeground = const Color(0xff020817),
    super.primary = const Color(0xff1e3a8a),
    super.primaryForeground = const Color(0xfff8fafc),
    super.secondary = const Color(0xffdee8fc),
    super.secondaryForeground = const Color(0xff0f172a),
    super.muted = const Color(0xffdee8fc),
    super.mutedForeground = const Color(0xff64748b),
    super.accent = const Color(0xffdee8fc),
    super.accentForeground = const Color(0xff0f172a),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xfff8fafc),
    super.border = const Color(0xffe2e8f0),
    super.input = const Color(0xffe2e8f0),
    super.ring = const Color(0xff1e3a8a),
    super.selection = const Color(0xFFB4D7FF),
  });

  const FundwiseColorScheme.dark({
    super.background = const Color(0xff020817),
    super.foreground = const Color(0xffdee8fc),
    super.card = const Color(0xff020817),
    super.cardForeground = const Color(0xffdee8fc),
    super.popover = const Color(0xff020817),
    super.popoverForeground = const Color(0xffdee8fc),
    super.primary = const Color(0xffbdd0f9),
    super.primaryForeground = const Color(0xff0f172a),
    super.secondary = const Color(0xff1e293b),
    super.secondaryForeground = const Color(0xffdee8fc),
    super.muted = const Color(0xff1e293b),
    super.mutedForeground = const Color(0xff94a3b8),
    super.accent = const Color(0xff1e293b),
    super.accentForeground = const Color(0xffdee8fc),
    super.destructive = const Color(0xffef4444),
    super.destructiveForeground = const Color(0xffdee8fc),
    super.border = const Color(0xff1e293b),
    super.input = const Color(0xff1e293b),
    super.ring = const Color(0xffbdd0f9),
    super.selection = const Color(0xFF355172),
  });
}
