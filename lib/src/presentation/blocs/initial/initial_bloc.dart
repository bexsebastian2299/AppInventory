

import 'package:bexpicking_app/src/domain/repositories/api_repository.dart';
import 'package:bexpicking_app/src/locator.dart';
import 'package:bexpicking_app/src/presentation/blocs/initial/initial_event.dart';
import 'package:bexpicking_app/src/presentation/blocs/initial/initial_state.dart';
import 'package:bexpicking_app/src/services/navigation.dart';
import 'package:bloc/bloc.dart';

final NavigationService _navigationService = locator<NavigationService>();

class InitialBloc extends Bloc<InitialEvent, InitialState>{
  final ApiRepository _apiRepository;

  InitialBloc(this._apiRepository) : super (InitialState()){
    
  }
}