




import 'package:bexpicking_app/src/data/datasources/local/app_database.dart';
import 'package:bexpicking_app/src/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;
  DatabaseRepositoryImpl(this._appDatabase);
  

    
  // @override
  // Future init() async {
  //   await _appDatabase.database;
  //   return Future.value();
  // }

  // @override
  // void close() {
  //   _appDatabase.close();
  // }


}