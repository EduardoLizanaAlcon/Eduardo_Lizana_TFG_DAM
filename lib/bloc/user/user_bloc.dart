import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tfg_ginyote/domain/user/Register.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/PerfilEnviar.dart';
import '../../domain/user/PerfilResponse.dart';
import '../../domain/user/User.dart';
import '../../use-cases/user/LoginUserCase.dart';
import '../../use-cases/user/PerfilUserCase.dart';
import '../../use-cases/user/RegistroUserCase.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  LoginUseCase? loginUseCase;
  RegistroUserCase? registroUserCase;
  PerfilUserCase? perfilUserCase;

  UserBloc(this.loginUseCase, this.registroUserCase, this.perfilUserCase) : super(UserInitial()) {
    on<LoginEvent>((event, emit) async{
      emit(LoadingLoginState());
      final response = await loginUseCase!.postLogin(event.login);
      if (response!.success) {
        emit(LoginState(response));
      }else{
        emit(ErrorLoginState(response));
      }
    });
    on<RegisterEvent>((event, emit) async{
      emit(LoadingLoginState());
      final response = await registroUserCase!.postRegistro(event.registro);
      if (response!.success) {
        emit(RegisterState(response));
      }else{
        emit(ErrorRegistroState(response));
      }
    });

    on<UpdateProfileEvent>((event, emit) async{
      emit(LoadingUpdateProfileState());
      final response = await perfilUserCase!.postEditarPerfil(event.perfilEnviar);
      if (response!.success) {
        emit(ProfileUpdatedState(response));
      }else{
        emit(ProfileErrorUpdatedState(response));
      }
    });
  }
}

