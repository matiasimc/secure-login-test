import 'dart:html';
import 'package:TRNIdart/TRNIdart.dart';
import 'database.dart';

abstract class Value {
  @S("Hash") int get value;
}

abstract class Hash {
  int get hashCode;
}

class Home {
  void render() {
    Login login = new Login();
    querySelector('#button').onClick.listen((MouseEvent e) {
      InputElement emailField = querySelector('#email');
      @S("Value") InputElement passwordField = querySelector('#password');
      if (login.login(emailField.value, passwordField.value)) {
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