// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

// تطبيق العد التنازلي بسيط جدا
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberOfSeconds = 10; // هنا العد التنازلي
  int originalNumberOfSeconds = 10; // تعريف المتغير وتعيين القيمة الافتراضية
  Timer? repeatedFunction; // يُستخدم لإيقاف العد التنازلي مؤقتًا

// فيعمل بدا لالعد التنازلي Start Timer الخاصه ب ElevatedButton بيستخدم لما اضغط علي
  startTimer() {
    setState(() {
      repeatedFunction = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (numberOfSeconds > 0) {
            numberOfSeconds--;
          } else {
            timer.cancel();
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (numberOfSeconds > 0)
                ? numberOfSeconds.toString().padLeft(2, "0")
                : "👌",
            style: (numberOfSeconds > 0)
                ? const TextStyle(fontSize: 80, color: Colors.white)
                : const TextStyle(fontSize: 70),
          ),
          const SizedBox(height: 22),
          const Text(
            'Seconds',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 33),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startTimer();
                  //  بيستخدم لما القيمه تكون ب 0 واجي اضغط علي زر البدا ميعملشي بدا طول ما القيمه تساوي 0
                  // من غير الشرط ده اول ما العدد يخلص واضغط علي بدا هيرجع يعمل بدا والقيمه اصلا ب 0 فلما اجي ارجع للقيمه الافتراضيه هيبدا تلقائي وانا مش عوز كده
                  // FloatingActionButton هيرجع للقيمه الافتراضيه لما اضغط علي زر
                  if (numberOfSeconds == 0) {
                    repeatedFunction!.cancel();
                  }

                  //  دي علشان لما اضغط علي الزر يرجع القيمه الافتراضيه وكمان يبدا العد تلقائي
                  // if (numberOfSeconds == 0) {
                  //   setState(() {
                  //     numberOfSeconds = originalNumberOfSeconds;
                  //   });
                  // }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                child: const Text(
                  "Start Timer",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(width: 22),
              ElevatedButton(
                onPressed: () {
                  if (repeatedFunction != null) {
                    repeatedFunction!.cancel();
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 197, 25, 97)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                child: const Text(
                  "Stop Timer",
                  style: TextStyle(fontSize: 19),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numberOfSeconds = originalNumberOfSeconds;
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.rotate_right,
          size: 35,
        ),
      ),
    );
  }
}
