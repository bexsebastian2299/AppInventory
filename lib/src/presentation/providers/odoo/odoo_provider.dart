


// import 'package:odoo_rpc/odoo_rpc.dart';

// class OdooProvider {
//   final OdooClient _client;
  

//   OdooProvider(this._client);

//   Future<void> ConnectToOdoo() async {
//     await _client.connect();
//     print('Conectado a Odoo');
//   }

//   Future<List<dynamic>> fetchOdooRecords(String modelName) async {
//     final records = await _client.searchRead(modelName, []);
//     return records;
//   }
// }