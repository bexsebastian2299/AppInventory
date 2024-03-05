




import 'package:bexpicking_app/src/data/datasources/remote/api_service.dart';
import 'package:bexpicking_app/src/data/repositories/base/base_api_repository.dart';
import 'package:bexpicking_app/src/domain/repositories/api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository{
  final ApiService _apiService;

  ApiRepositoryImpl(this._apiService);

  //aqui van las funciones
  
}