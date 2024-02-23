import 'package:bexpicking_app/src/data/datasources/local/app_database.dart';
import 'package:bexpicking_app/src/data/datasources/remote/api_service.dart';
import 'package:bexpicking_app/src/data/repositories/api_repository_impl.dart';
import 'package:bexpicking_app/src/data/repositories/database_repository_impl.dart';
import 'package:bexpicking_app/src/domain/repositories/api_repository.dart';
import 'package:bexpicking_app/src/domain/repositories/database_repository.dart';
import 'package:bexpicking_app/src/services/analytics.dart';
import 'package:bexpicking_app/src/services/global_functions.dart';
import 'package:bexpicking_app/src/services/isolate.dart';
import 'package:bexpicking_app/src/services/navigation.dart';
import 'package:bexpicking_app/src/services/storage.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final storage = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(storage!);

  final navigation = NavigationService();
  locator.registerSingleton<NavigationService>(navigation);

  final isolate = IsolateService();
  locator.registerSingleton<IsolateService>(isolate);

  locator.registerLazySingleton(() => FirebaseAnalyticsService());

  final globalFunctions = GlobalFunctions();
  locator.registerSingleton<GlobalFunctions>(globalFunctions);

  final db = AppDatabase.instance;
  locator.registerSingleton<AppDatabase>(db);

  locator.registerSingleton<ApiService>(
    ApiService(),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<ApiService>()),
  );

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );

}