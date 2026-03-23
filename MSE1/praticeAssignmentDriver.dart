/*
===========================================================
ADVANCED DART ASSIGNMENT (MEDIUM - HARD)

Instructions:
- DO NOT change function names
- DO NOT modify driver function
- Implement logic only inside marked sections
===========================================================
*/

/*
-----------------------------------------------------------
DUMMY DATA
-----------------------------------------------------------
*/

List<int?> numbers = [1, 2, null, 4, null, 6];

Map<String, dynamic> userMap = {"name": "Harsh", "age": null};

/*
-----------------------------------------------------------
MIXINS & CLASSES (DO NOT MODIFY)
-----------------------------------------------------------
*/

mixin Logger {
  void log(String msg) {
    print("LOG: $msg");
  }
}

class User {
  String name;
  User({required this.name});
}

class Admin extends User with Logger {
  Admin({required super.name});
}

/*
-----------------------------------------------------------
FUNCTION 1
-----------------------------------------------------------
Purpose:
Find sum ignoring null values

Constraints:
- Use null safety
- Use loop

Test:
[1,2,null,4] → 7
*/

int sumIgnoreNull(List<int?> list) {
  int sum = 0;
  for (var ele in list) {
    if (ele != null) sum += ele;
  }
  return sum;
}

/*
-----------------------------------------------------------
FUNCTION 2
-----------------------------------------------------------
Purpose:
Replace null with default value using ?? operator

Test:
(null, 10) → 10
(5, 10) → 5
*/

int replaceNull(int? value, int defaultVal) {
  // STUDENT CODE
  return value ?? defaultVal;
}

/*
-----------------------------------------------------------
FUNCTION 3
-----------------------------------------------------------
Purpose:
Check even/odd using operators

Constraints:
- Return "Even" or "Odd"
*/

String checkEvenOdd(int n) {
  // STUDENT CODE
  if (n % 2 == 0) return "Even";
  return "Odd";
}

/*
-----------------------------------------------------------
FUNCTION 4
-----------------------------------------------------------
Purpose:
Function with optional parameters

Constraints:
- If no value passed → default greeting

Test:
greet("Harsh") → Hello Harsh
greet("Harsh", "Good Morning") → Good Morning Harsh
*/

String greet(String name, [String? msg]) {
  // STUDENT CODE
  msg ??= "Hello";
  return "$msg $name";
}

/*
-----------------------------------------------------------
FUNCTION 5
-----------------------------------------------------------
Purpose:
Create Function Using named parameters and print

Constraints:
- name required
- age optional (default 18)
*/

String createProfile({required String name, int age = 18}) {
  // STUDENT CODE
  return "name is $name and age is $age";
}

/*
-----------------------------------------------------------
FUNCTION 6
-----------------------------------------------------------
Purpose:
Demonstrate inheritance

Constraints:
- Return name from User
*/

String getUserName(User user) {
  // STUDENT CODE
  return "User name is ${user.name}";
}

/*
-----------------------------------------------------------
FUNCTION 7
-----------------------------------------------------------
Purpose:
Use mixin Logger

Constraints:
- Call log() method
*/

void useLogger(Admin admin) {
  // STUDENT COD
  admin.log("${admin.name}");
}

/*
-----------------------------------------------------------
FUNCTION 8
-----------------------------------------------------------
Purpose:
Future with delay

Constraints:
- Delay 1 second
*/

Future<String> delayedMessage(String msg) {
  // STUDENT CODE
  return Future.delayed(Duration(seconds: 1), () => msg);
}

/*
-----------------------------------------------------------
FUNCTION 9
-----------------------------------------------------------
Purpose:
Chain async calls

Constraints:
- Use await twice

Hint:
Call delayedMessage twice
*/

Future<void> asyncChain() async {
  // STUDENT CODE
  String data1 = await Future.delayed(Duration(seconds: 1), () => "first msg");
  print(data1);
  String data2 = await Future.delayed(Duration(seconds: 2), () => "second msg");
  print(data2);
}

/*
-----------------------------------------------------------
FUNCTION 10
-----------------------------------------------------------
Purpose:
Use ?. operator safely

Constraints:
- Access age from map safely
*/

int getSafeAge(Map<String, dynamic> map) {
  // STUDENT CODE
  return map["age"] ?? 0;
}

/*
-----------------------------------------------------------
DRIVER FUNCTION (DO NOT MODIFY)
-----------------------------------------------------------
*/

void driver() async {
  print("---- ADVANCED DRIVER START ----");

  print("Sum Ignore Null: ${sumIgnoreNull(numbers)}");
  print("Replace Null: ${replaceNull(null, 10)}");
  print("Even/Odd: ${checkEvenOdd(7)}");

  print(greet("Harsh"));
  print(greet("Harsh", "Good Morning"));

  print(createProfile(name: "Harsh"));

  User user = User(name: "Aman");
  Admin admin = Admin(name: "Root");

  print("User Name: ${getUserName(user)}");

  useLogger(admin);

  print(await delayedMessage("Hello Async"));

  await asyncChain();

  print("Safe Age: ${getSafeAge(userMap)}");

  print("---- DRIVER END ----");
}

void main() {
  driver();
}
