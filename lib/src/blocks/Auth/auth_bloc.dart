import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/User.dart';
import '../../services/auth_service.dart';

// AuthState
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}

// AuthEvent
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

// AuthBloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await authService.login(event.email, event.password);
      if (user != null) {
        emit(AuthSuccess(user));
      } else {
        emit(const AuthFailure('Invalid email or password'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
