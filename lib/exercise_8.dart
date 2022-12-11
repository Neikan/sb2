// Класс User с полями email и login
class User {
  String login, email;

  User(this.login, this.email);
}

// Миксин (добавление свойства - домен почтового сервиса)
mixin getMailSystem on User {
  String get domain => email.split('@')[1];
}

// Класс-потомок от User с миксином
class AdminUser extends User with getMailSystem {
  AdminUser(super.login, super.email);
}

// Класс-потомок от User без миксина
class GeneralUser extends User {
  GeneralUser(super.login, super.email);
}

// Класс для управления Users
class UserManager<T extends User> {
  // Список пользователей
  List<T> users = [];

  // Добавление пользователя
  void addUser(T user) => users.add(user);

  // Удаление пользователя
  void removeUser(T user) => users.remove(user);

  // Вывод списка почтовых адресов пользователей
  void getUserMailList() {
    for (var user in users) {
      // Если пользователь является администртором, то
      if (user is AdminUser) {
        // - вывод домена
        print('${(user.login)} - ${user.domain}');
      } else {
        // А иначе:
        // - вывод адреса его почты
        print('${user.login} - ${user.email}');
      }
    }
  }

  // Количество пользователей в списке
  int lenght() => users.length;
}

// Вспомогательные утилиты
// - работа со списком пользователей
void executeExercise8() {
  // Администраторы
  AdminUser admin1 = AdminUser('Hastur', 'hastur@lovecraft.com');
  AdminUser admin2 = AdminUser('Batman', 'batman@gotem.com');

  // Важные пользователи
  GeneralUser general1 = GeneralUser('Azathot', 'azathot@lovecraft.com');
  GeneralUser general2 =
      GeneralUser('Ghatanothoa', 'ghatanothoa@lovecraft.com');
  GeneralUser general3 = GeneralUser('Joker', 'joker@gotem.com');

  // Обычные пользователи
  User user1 = User('Nyoghta', 'nyoghta@lovecraft.com');
  User user2 = User('Deadshot', 'Deadshot@gotem.com');
  User user3 = User('Riddler', 'riddler@gotem.com');

  UserManager userManager = UserManager();

  // Вывод списка до добавления пользователей
  print('');
  print('Пользователей до добавления: ${userManager.lenght()}');

  // Добавление пользователей в список
  userManager.addUser(admin1);
  userManager.addUser(general1);
  userManager.addUser(general2);
  userManager.addUser(user1);

  userManager.addUser(admin2);
  userManager.addUser(general3);
  userManager.addUser(user2);
  userManager.addUser(user3);

  // Вывод списка после добавления
  print('');
  print('Пользователей после добавления: ${userManager.lenght()}');
  userManager.getUserMailList();

  // Удаление пользователей
  userManager.removeUser(admin1);
  userManager.removeUser(general1);
  userManager.removeUser(general2);
  userManager.removeUser(user1);

  print('');
  print('Пользователей после удаления: ${userManager.lenght()}');
  userManager.getUserMailList();
}
