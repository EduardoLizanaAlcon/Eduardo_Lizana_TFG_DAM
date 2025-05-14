import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/historial/EnviarAHIstorial.dart';
import '../../domain/historial/HistorialResponse.dart';
import '../../use-cases/historico/ObtenerHistoricoUserCase.dart';
import '../../use-cases/user/LoginUserCase.dart';
part 'historial_event.dart';
part 'historial_state.dart';

class HistorialBloc extends Bloc<HistorialEvent, HistorialState> {
  ObtenerHistoricoUserCase? _obtenerHistoricoUserCase;

  HistorialBloc(this._obtenerHistoricoUserCase) : super(UserInitial()) {
    on<getHistorialEvent>((event, emit) async{
      final response = await _obtenerHistoricoUserCase!.postObtenerHistorico(event.historico);
      if (response!.success) {
        emit(HistorialLoadedState(response));
      }else{
        emit(ErrorHistorialState(response));
      }
    });
  }
}

