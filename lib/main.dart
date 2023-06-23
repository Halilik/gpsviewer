import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const RcCarPosition());
}

class RcCarPosition extends StatefulWidget {
  const RcCarPosition({Key? key}) : super(key: key);

  @override
  State<RcCarPosition> createState() => _RcCarPositionState();
}

class _RcCarPositionState extends State<RcCarPosition> {
  //variables
  static int numberInRow = 10;
  int numberOfSquares = numberInRow * 12;
  int playerPosition = 64;
  var usedTileList = [];
  String direction = "right";
  Color color = const Color.fromARGB(0, 250, 250, 250);

  void changePosition() {
    switch (direction) {
      case "up":
        usedTileList.add(playerPosition);
        moveUp();
        break;
      case "down":
        usedTileList.add(playerPosition);
        moveDown();
        break;
      case "left":
        usedTileList.add(playerPosition);
        moveLeft();
        break;
      case "right":
        usedTileList.add(playerPosition);
        moveRight();
        break;
    }
  }

  void moveUp() {
    setState(() {
      playerPosition -= numberInRow;
    });
  }

  void moveDown() {
    setState(() {
      playerPosition += numberInRow;
    });
  }

  void moveLeft() {
    setState(() {
      playerPosition--;
    });
  }

  void moveRight() {
    setState(() {
      playerPosition++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/black.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow,
                  ),
                  itemBuilder: (context, index) {
                    if (playerPosition == index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(Icons.electric_car_outlined),
                      );
                    }else if (usedTileList.contains(index)) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                      );
                    }
                    else {
                      return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)));
                    }
                  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () {
                            direction = "up";
                            changePosition();
                          },
                          label: Text(''),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: () {
                            direction = "down";
                            changePosition();
                          },
                          label: Text(''),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            direction = "left";
                            changePosition();
                          },
                          label: Text(''),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            direction = "right";
                            changePosition();
                          },
                          label: Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
