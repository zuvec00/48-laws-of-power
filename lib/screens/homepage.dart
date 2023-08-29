import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../laws/law1.dart';
import '../laws/util.dart/laws.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List laws = Laws().laws;
  List lawsAssets = Laws().lawsAssets;
  List lawsSummary = Laws().lawsSummary;

  int taskDone = 0;
  int totalTask = 48;
  int percentage = 0;

  void finalPercentage() {
    setState(() {
      taskDone++;
      int finalPercentage = ((taskDone / totalTask) * 100).toInt();
      percentage = finalPercentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.brown[300],
        body: Column(children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // N A M E, A V A T A R, S E T T I N G S
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hi Prince!✌🏾',
                            style: TextStyle(fontSize: 26),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.brown[200],
                                ),
                                child: const Text(
                                  '🧑🏾',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.settings,
                                color: Colors.grey[200],
                                size: 35,
                              ),
                            ],
                          ),
                        ]),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                          child: Text(
                              '\"Just one small positive thought in the morning can change your whole day.\"',
                              style: GoogleFonts.raleway(
                                fontSize: 14,
                              ))),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${taskDone}/${totalTask}'),
                        Text('${percentage}%')
                      ],
                    ),
                    const SizedBox(height: 10),

                    Container(
                      height: 10,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.brown.shade200,
                          offset: const Offset(-4, -4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.brown.shade400,
                          offset: const Offset(4, 4),
                          blurRadius: 8,
                          spreadRadius: 1,
                        )
                      ]),
                      child: LinearPercentIndicator(
                        percent: percentage / 100,
                        backgroundColor: Colors.brown[300],
                        progressColor: Colors.grey[200],
                        barRadius: const Radius.circular(5),
                        animation: true,
                        animationDuration: 2000,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    color: Colors.grey[300],
                  ),
                  child: ListView.builder(
                      itemCount: 48,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Law1(
                                            lawsAssets: lawsAssets[index],
                                            lawsSummary: lawsSummary[index],
                                            taskCompletedHandler:
                                                finalPercentage,
                                          )));
                            },
                            child: Container(
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: []),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'L a w #${index + 1}',
                                          style: GoogleFonts.bebasNeue(
                                            color: Colors.grey[200],
                                            fontSize: 16,
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          indent: 12,
                                          endIndent: 12,
                                          color: Colors.grey[100],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                laws[index],
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.bebasNeue(
                                                    color: Colors.brown[400],
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                )),
                          ),
                        );
                      })))
        ]));
  }
}
