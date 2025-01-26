
sealed class AuthState {}

final class RegisterInitial extends AuthState {}

final class RegisterLoad extends AuthState {}

final class RegisterSuccess extends AuthState {
  final dynamic userData;
  RegisterSuccess({required this.userData});
}

final class RegisterFail extends AuthState {
  final String errorMessage;
  RegisterFail({required this.errorMessage});
}

final class ChooseImage extends AuthState {}

// Login States
final class LoginInitial extends AuthState {}

final class LoginLoad extends AuthState {}

final class LoginSuccess extends AuthState {
  final dynamic userData;
  LoginSuccess({required this.userData});
}

final class LoginFail extends AuthState {
  final String errorMessage;
  LoginFail({required this.errorMessage});
}

