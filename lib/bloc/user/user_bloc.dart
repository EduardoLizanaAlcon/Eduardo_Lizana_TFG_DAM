import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';
import '../../use-cases/user/LoginUserCase.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  LoginUseCase? loginUseCase;

  UserBloc(this.loginUseCase) : super(UserInitial()) {
    on<LoginEvent>((event, emit) async{
      final response = await loginUseCase!.postLogin(event.login);
      if (response!.success) {
        emit(LoginState(response));
      }else{
        emit(ErrorLoginState(response));
      }
    });
  }
}

