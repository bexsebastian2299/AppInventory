import 'package:bexpicking_app/src/utils/constants/strings.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration/sqflite_migration.dart';




class AppDatabase {
  // static BriteDatabase? _streamDatabase;

  AppDatabase._privateConstructor();
  static final AppDatabase instance = AppDatabase._privateConstructor();
  static var lock = Lock();

  static Database? _database;

  //aqui van a ir los scripts de las tablas SQL
  final initialScript = [
    '''
    '''
  ];

  final migrations = [
    '''
    '''
  ];

  Future<Database> _initDatabase(databaseName) async{
    final documentsDirectory = await getApplicationDocumentsDirectory();

    final config = MigrationConfig(
        initializationScript: initialScript, migrationScripts: migrations);

    final path = join(documentsDirectory.path, databaseName);
    return await openDatabaseWithMigration(path, config);
  }

  // Future<Database?> get database async {
  //   var dbName = databaseName;

  //   if(_database != null) return _database;
  //   print(_database);
  //   await lock.synchronized(() async {
  //     if (_database == null){
  //       if(dbName == ''){
  //         dbName = 'default';
  //       }
  //       _database = await _initDatabase('$dbName.db');
  //       _streamDatabase = BriteDatabase(_database!);
  //     }
  //   });
  //   return _database;
  // }

  // Future<BriteDatabase?> get streamDatabase async {
  //   await database;
  //   return _streamDatabase;
  // }

  //INSERT METHODS
  // Future<int> insert(String table, Map<String, dynamic> row) async {
  //   final db = await instance.streamDatabase;
  //   return db!.insert(table, row);
  // }

  // Future<List<int>?> insertAll(String table, List<dynamic> objects) async{
  //   final db = await instance.database;
  //   var results = <int>[];
  //   try {
  //     await db?.transaction((db) async {
  //       for (var object in objects) {
  //         var id = await db.insert(table, object.toJson());
  //         results.add(id);
  //       }
  //     });
  //     return results;
  //   } catch (er) {
  //     return null;
  //   }
  // }

  //UPDATE METHODS
  // Future<int> update(
  //   String table, Map<String, dynamic> value, String columnId, int id) async {
  //     final db = await instance.streamDatabase;
  //     return db!.update(table, value, where: '$columnId =  ?', whereArgs: [id]);
  //   }

  //DELETE METHODS
  // Future<int> delete(String table, String columnId, int id) async {
  //   final db = await instance.streamDatabase;
  //   return db!.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }

  //AQUI VAN LOS LLAMADOS A LOS DAOS


  // void close() {
  //   _database = null;
  //   _streamDatabase!.close();
  // }
}