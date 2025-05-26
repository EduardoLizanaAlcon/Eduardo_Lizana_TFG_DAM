
import 'package:http/http.dart' as http;
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/bloc/historial/historial_bloc.dart';
import 'package:tfg_ginyote/bloc/partida/partida_bloc.dart';
import 'package:tfg_ginyote/domain/partida/ComprobarRonda.dart';
import 'package:tfg_ginyote/use-cases/partida/BuscarPartidaUserCase.dart';
import 'package:tfg_ginyote/use-cases/partida/CartaJugadaRivalUseCase.dart';
import 'package:tfg_ginyote/use-cases/partida/SiguienteJugadorUseCase.dart';
import 'package:tfg_ginyote/use-cases/partida/VerGlobalUserCase.dart';
import 'package:tfg_ginyote/use-cases/partida/VerManoUserCase.dart';
import '../bloc/user/user_bloc.dart';
import '../data/api-client-http.dart';
import '../data/api-client-interfaz.dart';
import '../data/historial/HistoricoRepository.dart';
import '../data/historial/HistoricoService.dart';
import '../data/partida/PartidaRepository.dart';
import '../data/partida/PartidaService.dart';
import '../data/user/LoginRepository.dart';
import '../data/user/LoginService.dart';
import '../use-cases/historico/ObtenerHistoricoUserCase.dart';
import '../use-cases/partida/Cantar20UseCase.dart';
import '../use-cases/partida/Cantar40UseCase.dart';
import '../use-cases/partida/ComprobarGanadorUseCase.dart';
import '../use-cases/partida/JugarManoUseCase.dart';
import '../use-cases/partida/VerTriunfoUserCase.dart';
import '../use-cases/user/LoginUserCase.dart';


void setupDI() {
  final injector = Injector.appInstance;

  // Registrar dependencias
  injector.registerSingleton<ApiClient>(() => HttpApiClient(http.Client()));
  injector.registerDependency<UserBloc>(() => UserBloc(injector.get<LoginUseCase>()));
  injector.registerDependency<HistorialBloc>(() => HistorialBloc(injector.get<ObtenerHistoricoUserCase>()));
  injector.registerDependency<PartidaBloc>(() => PartidaBloc(
      injector.get<BuscarPartidaUserCase>(),
      injector.get<VerManoUserCase>(),
      injector.get<VerTriunfoUserCase>(),
      injector.get<VerGlobalUserCase>(),
      injector.get<SiguienteJugadorUseCase>(),
      injector.get<JugarManoUseCase>(),
      injector.get<Cantar20UseCase>(),
      injector.get<Cantar40UseCase>(),
      injector.get<CartaJugadaRivalUseCase>(),
      injector.get<ComprobarGanadorUseCase>(),
  ));

  //inyeccion de login
  injector.registerSingleton<LoginService>(() => LoginService(injector.get<ApiClient>()));
  injector.registerSingleton<LoginRepository>(() => LoginRepository(injector.get<LoginService>()));
  injector.registerSingleton<LoginUseCase>(() => LoginUseCase(injector.get<LoginRepository>()));

  //inyeccion de historial
  injector.registerSingleton<HistoricoService>(() => HistoricoService(injector.get<ApiClient>()));
  injector.registerSingleton<Historicorepository>(() => Historicorepository(injector.get<HistoricoService>()));
  injector.registerSingleton<ObtenerHistoricoUserCase>(() => ObtenerHistoricoUserCase(injector.get<Historicorepository>()));

  //inyeccion de Partida
  injector.registerSingleton<PartidaService>(() => PartidaService(injector.get<ApiClient>()));
  injector.registerSingleton<PartidaRepository>(() => PartidaRepository(injector.get<PartidaService>()));

  injector.registerSingleton<BuscarPartidaUserCase>(() => BuscarPartidaUserCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<VerTriunfoUserCase>(() => VerTriunfoUserCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<VerManoUserCase>(() => VerManoUserCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<VerGlobalUserCase>(() => VerGlobalUserCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<SiguienteJugadorUseCase>(() => SiguienteJugadorUseCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<JugarManoUseCase>(() => JugarManoUseCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<Cantar20UseCase>(() => Cantar20UseCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<Cantar40UseCase>(() => Cantar40UseCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<CartaJugadaRivalUseCase>(() => CartaJugadaRivalUseCase(injector.get<PartidaRepository>()));
  injector.registerSingleton<ComprobarGanadorUseCase>(() => ComprobarGanadorUseCase(injector.get<PartidaRepository>()));

}