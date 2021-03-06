import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:core_event/domain/repositories/auth.dart';

class PasswordAuth extends GetxController implements AuthInterface {
  @override
  Future<bool> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Usuario no encontrado",
          "No se encontró un usuario que use ese email.",
        );
        return Future.error("Usuario no encontrado con este correo");
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Contraseña equivocada",
          "La contraseña proveida por el usuario no es correcta.",
        );
        return Future.error("Password Incorrecto, verifique");
      }
      return false;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      userCredential.user!.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Contraseña insegura",
          "La seguridad de la contraseña es muy débil",
        );
        return Future.error(
            'La seguridad de la contraseña es muy débil, digite de nuevo.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Email inválido",
          "Ya existe un usuario con este correo electrónico.",
        );
        return Future.error('La cuenta ya existe con este email.');
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  // We throw an error if someone calls SignInWithGoogle, member of AuthInterface
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
