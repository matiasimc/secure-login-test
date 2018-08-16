import 'dart:html';
import 'package:TRNIdart/TRNIdart.dart';
import 'database.dart';

class Home {
  void render() {
    Login login = new Login();
    querySelector('#button').onClick.listen((MouseEvent e) {
      InputElement emailField = querySelector('#email');
      InputElement passwordField = querySelector('#password');
      String username = emailField.value;
      @S("Hash") String guess = passwordField.value;
      if (login.login(username, guess)) {
        querySelector('#title').text = "Welcome";
      }
      else {
        querySelector('#title').text = "Bad credentials";
      }
    });
  }
}

class Login {
  Database db = new Database();

  bool login(String username, @S("Hash") String guess) {
    if (db.data.containsKey(username)) {
      if (db.data[username] == guess.hashCode) return true;
    }
    return false;
  }
}

void main() {
  new Home().render();
}