import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rafeeqa/core/utils/my_bloc_observer.dart';
import 'package:rafeeqa/core/utils/theme.dart';
import 'package:rafeeqa/features/onboarding/pages/views/onboarding_view.dart';
import 'package:rafeeqa/features/settings/model/app_user_pref_model.dart';
import 'package:rafeeqa/features/settings/presentaions/manager/settings_cubit.dart';
import 'package:rafeeqa/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
  storageDirectory: HydratedStorageDirectory(
    (await getApplicationDocumentsDirectory()).path,
  ),
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SettingsCubit())],
      child: BlocBuilder<SettingsCubit, AppUserPref>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(390, 884),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'Rafeeqa',
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                themeMode: ThemeMode.light,
                darkTheme: AppTheme.dark,
                home: OnboardingView(),
              );
            },
          );
        },
      ),
    );
  }
}
