import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:ifeirinha_rafael/models/email_sender/password_recovery_code_generator.dart';

class EmailSender {
  static void sendEmailTo(String email) async {
    final emailToSend = Email(
        subject: 'Recuperação de Senha - IFeirinha',
        recipients: <String>[email],
        body:
            'Seu código de recuperação de senha é: ${PasswordRecoveryCodeGenerator.generateUniqueSequence()}');
    await FlutterEmailSender.send(emailToSend);
  }
}
