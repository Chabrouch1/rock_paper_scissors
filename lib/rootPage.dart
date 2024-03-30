import 'dart:math';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int res = 3;
  int scoreP = 0;
  int scoreC = 0;
  String img = "Empty";
  String imgP = "Empty";
  int cpuPlay() {
    //0 is rock 1 is paper 2 scissors
    if (Random().nextInt(3) == 0) {
      img = "rock";
      return 0;
    } else if (Random().nextInt(3) == 1) {
      img = "paper";
      return 1;
    } else {
      img = "scissors";
      return 2;
    }
  }

  int gameResult(String choise, int cpuChoice) {
    if ((choise == "r" && cpuChoice == 2) ||
        (choise == "p" && cpuChoice == 0) ||
        (choise == "s" && cpuChoice == 1)) {
      scoreP++;
      return 1;
    } else if ((choise == "r" && cpuChoice == 1) ||
        (choise == "p" && cpuChoice == 2) ||
        (choise == "s" && cpuChoice == 0)) {
      scoreC++;
      return 0;
    }
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 223, 188, 83)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("CPU Score : $scoreC"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scoreC=0;
                      scoreP=0;
                    });
                  },
                  child: const Icon(Icons.refresh),
                ),
                Text("Player Score : $scoreP"),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  "assets/$img.png",
                ),
              ),
            ),
            Center(
              child: Text("CPU plays $img"),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 200,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  "assets/$imgP.png",
                ),
              ),
            ),
            Center(
              child: Text("you played $imgP"),
            ),
            Row(
              //row of 3 images of the same size
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imgP = "rock";
                          res = gameResult("r", cpuPlay());
                        });
                      },
                      child: Image.asset(
                        "assets/rock.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imgP = "paper";
                          res = gameResult("p", cpuPlay());
                        });
                      },
                      child: Image.asset(
                        "assets/paper.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width / 4,
                  height: 200,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          imgP = "scissors";
                          res = gameResult("r", cpuPlay());
                        });
                      },
                      child: Image.asset(
                        "assets/scissors.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
