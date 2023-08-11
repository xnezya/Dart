import 'dart:io';

void main() {
  double result = 0;

  while (true) {
    if (result == 0) {
      stdout.write("Enter the first number: ");
      String? input = stdin.readLineSync();
      result = double.parse(input!);
    }

    stdout.write(
        """Enter an operation (+, -, x, /) or \n 'q' to quit or \n '0' to reset operation : """);
    String? operation = stdin.readLineSync();

    if (operation == "q") {
      print("Calcutor ending..");
      break;
    } else if (operation == "0") {
      result = 0;
      continue;
    }

    stdout.write("Enter the next number: ");
    String? input = stdin.readLineSync();
    double num = double.parse(input!);

    if (operation == "+") {
      result += num;
    } else if (operation == "-") {
      result -= num;
    } else if (operation == "x") {
      result *= num;
    } else if (operation == "/") {
      if (num != 0) {
        result /= num;
      } else {
        print("Error: Division by zero is not allowed.");
      }
    }

    print("Current result: $result");
  }
}
