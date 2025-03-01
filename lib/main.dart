import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/data/models/bond_hive_model.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_list_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bookmark_cubit.dart';
import 'package:hella_infra_app/presentation/pages/home.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core/constants/app_theme.dart';
import 'core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Hive
  final dir = kIsWeb ? await getTemporaryDirectory() : await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(BondHiveModelAdapter());

  // Configure dependencies
  await configureDependencies();

  // Initialize haptic feedback
  try {
    await getIt<HapticFeedbackHelper>().initialize();
  } catch (e) {
    debugPrint('Failed to initialize haptic feedback: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BondListCubit>(
          create: (_) => getIt<BondListCubit>(),
        ),
        BlocProvider<BondDetailCubit>(
          create: (_) => getIt<BondDetailCubit>(),
        ),
        BlocProvider<BookmarkCubit>(
          create: (_) => getIt<BookmarkCubit>()..loadBookmarks(),
        ),
      ],
      child: MaterialApp(
        title: 'Hella Infra Market',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        home: const HomePage(),
      ),
    );
  }
}
