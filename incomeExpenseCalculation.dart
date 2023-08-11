import 'dart:io';

void main() {
  Map<String, Map<String, double>> incomes = {};

  while (true) {
    stdout.write("Enter income definition (exp. salary, rent): ");
    String? definition = stdin.readLineSync()?.toLowerCase();
    if (definition == null) {
      print("Definition can't be null. Try again....");
      continue;
    }

    stdout.write("Enter income period (daily, weekly, monthly): ");
    String? period = stdin.readLineSync()?.toLowerCase();
    if (period == null ||
        !(period == 'daily' || period == 'weekly' || period == 'monthly')) {
      print(
          "Invalid period. Valid options are: daily, weekly, monthly. Try again....");
      continue;
    }

    stdout.write("Enter income amount: ");
    String? input = stdin.readLineSync();
    double amount = double.parse(input!);
    if (amount == 0) {
      print("Amount can't be zero or invalid");
      continue;
    }

    if (!incomes.containsKey(definition)) {
      incomes[definition] = {};
    }

    incomes[definition]?[period] = amount;

    stdout.write("Do you want to continue adding income? (Y/N): ");
    String? yesOrNo = stdin.readLineSync()?.toLowerCase();
    if (yesOrNo != 'y') {
      break;
    }
  }
  Map<String, Map<String, double>> expenses = {};
  while (true) {
    stdout.write("Enter income definition (exp. bills, food cost, rent): ");
    String? definition2 = stdin.readLineSync()?.toLowerCase();
    if (definition2 == null) {
      print("definition2 can't be null");
      continue;
    }

    stdout.write("Enter expense period (daily, weekly, monthly): ");
    String? period2 = stdin.readLineSync()?.toLowerCase();
    if (period2 == null ||
        !(period2 == 'daily' || period2 == 'weekly' || period2 == 'monthly')) {
      print("Invalid period. Valid options are: daily, weekly, monthly");
      continue;
    }

    stdout.write("Enter income amount: ");
    String? input2 = stdin.readLineSync();
    double amount2 = double.parse(input2!);
    if (amount2 == 0) {
      print("amount can't be zero or invalid");
      continue;
    }
    if (!expenses.containsKey(definition2)) {
      expenses[definition2] = {};
    }

    expenses[definition2]?[period2] = amount2;

    stdout.write("Do you want to continue adding expense? (Y/N): ");
    String? yesOrNo = stdin.readLineSync()?.toLowerCase();
    if (yesOrNo != 'y') {
      break;
    }
  }
  double totalAmount = 0;
  incomes.values.forEach((incomeMap) {
    incomeMap.forEach((period, amount) {
      if (period == "daily") {
        amount *= 30;
      } else if (period == "weekly") {
        amount *= 4;
      } else if (period == "monthly") {
        amount *= 1;
      }
      totalAmount += amount;
    });
  });

  double totalamount2 = 0;
  expenses.values.forEach((expensesMap) {
    expensesMap.forEach((period2, amount2) {
      if (period2 == "daily") {
        amount2 *= 30;
      } else if (period2 == "weekly") {
        amount2 *= 4;
      } else if (period2 == "monthly") {
        amount2 *= 1;
      }
      totalamount2 += amount2;
    });
  });
  double finalresult = 0;
  finalresult = totalAmount - totalamount2;
  print("Your Incomes:");
  incomes.forEach((definition, amount) {
    print("$definition: $amount");
  });
  print("Your expenses:");
  expenses.forEach((definition2, amount2) {
    print("$definition2: $amount2");
  });
  if (finalresult < 0) {
    double positiveResult = finalresult.abs();
    print(
        "Expenses are more than incomes. You are at a loss of $positiveResult");
  } else {
    print(
        "According to the income and expense calculation, the remaining money is $finalresult");
  }
}
