import 'dart:io';

void main() {
  List<List<String>> seats=[
    ['E','E','E','E','E'],
    ['E','E','E','E','E'],
    ['E','E','E','E','E'],
    ['E','E','E','E','E'],
    ['E','E','E','E','E'],
  ];

  Map<String, String> users={};
  while (true) {
    print("\n1.Book new seat");
    print("2. Show seats");
    print("3. Show users");
    print("4. Exit");

    String choice =stdin.readLineSync()!;
    if (choice=="1") {
      print("Enter row:");
      String rowInput =stdin.readLineSync()!;
      int row =int.tryParse(rowInput) ?? 0;

      print("Enter column:");
      String columnInput =stdin.readLineSync()!;
      int column =int.tryParse(columnInput) ?? 0;

      if (seats[row-1][column-1]=='E') {
        print("Enter your name:");
        String name=stdin.readLineSync()!;

        print("Enter your phone:");
        String phone =stdin.readLineSync()!;

        seats[row-1][column-1]='B';

        users["$row,$column"]="$name-$phone";

        print("Seat booked successfully!");
      } else {
        print("Seat is already booked!");
      }
    }

    else if (choice =="2") {
      print("Theater Seats:");

      for (int i=0; i< 5; i++) {
        print(seats[i].join(" "));
      }
    }

    else if (choice =="3") {
      print("Users Booking Details:");

      users.forEach((seat,user) {
        print("Seat $seat:$user");
      });
    }

    else if (choice =="4") {
      print("See You Back");
      break;
    }
  }
}