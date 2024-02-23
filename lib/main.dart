import 'package:bexpicking_app/src/config/theme.dart';
import 'package:bexpicking_app/src/locator.dart';
import 'package:bexpicking_app/src/presentation/providers/initial/initial_provider.dart';
import 'package:bexpicking_app/src/presentation/views/global/undefined_view.dart';
import 'package:bexpicking_app/src/presentation/widgets/custom_error_widget.dart';
import 'package:bexpicking_app/src/services/navigation.dart';
import 'package:bexpicking_app/src/utils/constants/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/config/router.dart' as router;

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details){
    FlutterError.dumpErrorToConsole(details);
    runApp(ErrorWidgetClass(details));
  };
  PlatformDispatcher.instance.onError = (error, stack){
    return true;
  };
  runApp(const MyApp());
}

class ErrorWidgetClass extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const ErrorWidgetClass(this.errorDetails, {super.key});
  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget(
      errorMessage: errorDetails.exceptionAsString()
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => InitialProvider()
        )
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            // GlobalMaterialLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            // GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es', 'CO')
          ],
          title: appTitle,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
            builder: (BuildContext context) => UndefinedView(
              name: settings.name,
            )),
            initialRoute: '/splash',
            onGenerateRoute: router.generateRoute,
        ),
      ),
    );
  }
}