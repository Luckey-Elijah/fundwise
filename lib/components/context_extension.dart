import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

extension ReadBuildContext on BuildContext {
  PocketBase get pb => read<PocketBase>();
}
