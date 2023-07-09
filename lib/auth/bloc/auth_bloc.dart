import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/user_repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository? userRepository;
  AuthBloc({this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded) {
      try {
        var isLogIn = await userRepository?.isLogIn();

        if (isLogIn!) {
          var user = await userRepository?.getCurrentUser();

          yield AuthenticateState(user: user!);
        } else {
          yield UnAuthenticateState();
        }
      } catch (e) {
        yield UnAuthenticateState();
      }
    }
  }
  // AuthBloc() : super(AuthInitial()) {
  //   on<AuthEvent>((event, emit) {
  //     // TODO: implement event handler
  //   });
  // }
}
