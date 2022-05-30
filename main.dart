import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int first = 0, second = 0; // Два значення для розрахунку
  String opp = ""; // Значення для операцій + - x /
  String result = "", text = ""; // Значення для розрахунку результату і виводу

  void btnClicked(String btnText) {
    if (btnText == "C") {
      // Скидання всіх значень
      result = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      // Зберігання першого значення
      first = int.parse(text);
      result = "";
      opp = btnText;
    } else if (btnText == "=") {
      // Обчислення першого та другого значення
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      } else if (opp == "-") {
        result = (first - second).toString();
      } else if (opp == "x") {
        result = (first * second).toString();
      } else if (opp == "/") {
        result = (first ~/ second).toString();
      }
    } else {
      // При натисканні чисел (Приклад: натисніть 9 та 8 => результат 98)
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlinedButton(String value) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () => btnClicked(value),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              ),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(25),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
            )),
            Row(
              children: [
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+")
              ],
            ),
            Row(
              children: [
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-")
              ],
            ),
            Row(
              children: [
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("x")
              ],
            ),
            Row(
              children: [
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/")
              ],
            )
          ],
        ),
      ),
    );
  }
}
