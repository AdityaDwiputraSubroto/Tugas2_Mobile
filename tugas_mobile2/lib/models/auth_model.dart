import 'package:tugas_mobile2/data/account_data.dart';
import 'package:tugas_mobile2/models/account_model.dart';

// class Account {
//   String id;
//   String username;
//   String password;
//   List<String> favorites;

//   Account({
//     required this.id,
//     required this.username,
//     required this.password,
//     required this.favorites,
//   });

//   Future<Account?> login(String username, String password) async {
//     // Check if the entered username and password match any account
//     for (var account in accounts) {
//       if (account.username == username && account.password == password) {
//         print('success');
//         // Navigate to the next screen after successful login
//         return account;
//       }
//     }
//     return null;
//   }
// }

class AuthModel {
  Future<Account?> login(String username, String password) async {
    // Check if the entered username and password match any account
    for (var account in accounts) {
      if (account.username == username && account.password == password) {
        print('success');
        // Navigate to the next screen after successful login
        return account;
      }
    }
    return null;
  }
}
