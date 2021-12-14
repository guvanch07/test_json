import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_skleton/src/features/list_of_users/presentation/cubit/listofitem_cubit.dart';
import 'package:test_skleton/src/features/post/presentation/cubit/user_post_cubit.dart';

import 'features/list_of_users/domain/entities/list_entities.dart';

import 'features/list_of_users/presentation/pages/sample_item_details_view.dart';

import 'features/list_of_users/presentation/pages/sample_item_list_view.dart';

import 'features/post_alboms/presentation/cubit/album_user_cubit.dart';
import 'features/post_alboms/presentation/pages/album_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ListofitemCubit()..getdata()),
            BlocProvider(create: (_) => AlbumUserCubit()..getalbum()),
            BlocProvider(create: (_) => UserPostCubit()..getpost())
          ],
          child: MaterialApp(
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case AlbumView.routeName:
                      //final args = routeSettings.arguments as ListOfEntities;
                      return const AlbumView();
                    case SampleItemListView.routeName:
                    default:
                      return const SampleItemListView();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
