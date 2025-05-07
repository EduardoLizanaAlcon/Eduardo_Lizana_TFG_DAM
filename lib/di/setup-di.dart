
import 'package:http/http.dart' as http;
import 'package:injector/injector.dart';
import '../bloc/user/user_bloc.dart';
import '../data/api-client-http.dart';
import '../data/api-client-interfaz.dart';
import '../data/user/LoginRepository.dart';
import '../data/user/LoginService.dart';
import '../use-cases/user/LoginUserCase.dart';


void setupDI() {
  final injector = Injector.appInstance;

  // Registrar dependencias
  injector.registerSingleton<ApiClient>(() => HttpApiClient(http.Client()));
  injector.registerDependency<UserBloc>(() => UserBloc(injector.get<LoginUseCase>()));

  //inyeccion de login
  injector.registerSingleton<LoginService>(() => LoginService(injector.get<ApiClient>()));
  injector.registerSingleton<LoginRepository>(() => LoginRepository(injector.get<LoginService>()));
  injector.registerSingleton<LoginUseCase>(() => LoginUseCase(injector.get<LoginRepository>()));

}