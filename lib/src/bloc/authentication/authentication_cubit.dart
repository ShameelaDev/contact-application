import 'package:bloc/bloc.dart';
import 'package:contact_application/src/bloc/authentication/authentication_repository.dart';
import 'package:contact_application/src/utilities/logger_utilities.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  AuthenticationCubit(this._authenticationRepository)
      : super(AuthenticationInitial());
  loginWithEmailPassword(String email, String password) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await _authenticationRepository
          .loginWithEmailPassword(email, password);
      if (userCredential != null) {
        emit(AuthenticationLoaded(userCredential));
      } else {
        emit(AuthenticationError());
      }
    } catch (ex) {
      showErrorMessage(ex.toString());
      emit(AuthenticationError());
    }
  }

  registerWithEmailPassword(
      String name, String email, String password, String mobno) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await _authenticationRepository
          .registerWithEmailPassword(name, email, password, mobno);
      if (userCredential != null) {
        emit(AuthenticationLoaded(userCredential));
      } else {
        emit(AuthenticationError());
      }
    } catch (ex) {
      showErrorMessage(ex.toString());
      emit(AuthenticationError());
    }
  }
}
