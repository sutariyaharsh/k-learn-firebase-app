
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An Unknown error occured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-passeord':
        return const SignUpWithEmailAndPasswordFailure('Please enter a stonger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formated.');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('An account already exists for the email.');
      case 'opration-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}