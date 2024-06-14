import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension ReadBuildContext on BuildContext {
  SupabaseClient get supabase => read<SupabaseClient>();
}
