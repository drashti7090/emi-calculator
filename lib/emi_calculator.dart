import 'dart:math';

import 'package:flutter/material.dart';

class EmiCalculatorFinal extends StatefulWidget {
  const EmiCalculatorFinal({Key? key}) : super(key: key);

  @override
  State<EmiCalculatorFinal> createState() => _EmiCalculatorFinalState();
}

class _EmiCalculatorFinalState extends State<EmiCalculatorFinal> {
  double sliderValue = 20000;
  double interest = 12;
  double time = 14;
  double monthlyInstallment = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("convert to double ${double.parse("10.20")}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xff2B2C31),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: const BoxDecoration(
                                  color: Color(0xff2B2C31),
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Color(0xff32373B),
                                      Color(0xff272B30),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(color: Colors.white24, blurRadius: 10)
                                  ]),
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Color(0xffBABDC0),
                              ),
                            ),
                            const SizedBox(
                              width: 85,
                            ),
                            const Text(
                              "EMI Calculator",
                              style: TextStyle(
                                  color: Color(0xffE6E7E8),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        width: MediaQuery.of(context).size.width - 2,
                        padding:
                        const EdgeInsets.only(top: 15, left: 30, right: 30),
                        decoration: const BoxDecoration(
                            color: Color(0xff252931),
                            boxShadow: [
                              BoxShadow(color: Colors.white70, blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: Column(
                          children: [
                            Slider(
                              value: sliderValue,
                              activeColor: const Color(0xffBB868F),
                              inactiveColor: const Color(0xffEEEEF1),
                              max: 100000,
                              min: 15000,
                              divisions: 85,
                              label: sliderValue.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  sliderValue = value;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 20,
                                bottom: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Loan Amount",
                                    style: TextStyle(
                                        color: Color(0xff8F9194),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "RS.$sliderValue",
                                    style: const TextStyle(
                                        color: Color(0xffBB868F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Slider(
                              value: interest,
                              activeColor: const Color(0xffBB868F),
                              inactiveColor: const Color(0xffEEEEF1),
                              max: 21,
                              min: 11,
                              divisions: 10,
                              label: interest.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  interest = value;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 20,
                                bottom: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Rate of interest",
                                    style: TextStyle(
                                        color: Color(0xff8F9194),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "% $interest",
                                    style: const TextStyle(
                                        color: Color(0xffBB868F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Slider(
                              value: time,
                              activeColor: const Color(0xffBB868F),
                              inactiveColor: const Color(0xffEEEEF1),
                              max: 24,
                              divisions: 12,
                              min: 12,
                              label: time.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  time = value;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25.0,
                                right: 20,
                                bottom: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Loan tenure",
                                    style: TextStyle(
                                        color: Color(0xff8F9194),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "$time Months",
                                    style: const TextStyle(
                                        color: Color(0xffBB868F),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 160,
                                  width: 160,
                                  margin: const EdgeInsets.only(
                                      top: 10, left: 10, right: 30),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff252931),
                                      border: Border.all(
                                          color: const Color(0xffF3F6FB),
                                          width: 30),
                                      shape: BoxShape.circle),
                                ),
                                Text(
                                  "EMI\nRs.${calculateEmi(sliderValue, interest, time).toStringAsFixed(1)}",
                                  style: const TextStyle(
                                      color: Color(0xffF3F6FB),
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 30, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffBB868F),
                                        shape: BoxShape.circle),
                                  ),
                                  const Text(
                                    "Principal amount",
                                    style: TextStyle(
                                        color: Color(0xffF3F6FB),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),

                                  Text(
                                    "Rs.$sliderValue",
                                    style: const TextStyle(
                                        color: Color(0xffF3F6FB),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 30, top: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.only(right: 15),
                                    decoration: const BoxDecoration(
                                        color: Color(0xffD2D3D3),
                                        shape: BoxShape.circle),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Total interest",
                                        style: TextStyle(
                                            color: Color(0xffF3F6FB),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300),
                                      ),

                                      Text(
                                        "Rs.${calculateInt(sliderValue, interest, time).toStringAsFixed(1)}",
                                        style: const TextStyle(
                                            color: Color(0xffF3F6FB),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                color: Color(0xff393C44),
                                thickness: 4,
                                indent: 50,
                                endIndent: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 15, left: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                        color: Color(0xffA2A4A6),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Rs.${(calculateInt(sliderValue, interest, time) + sliderValue).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                        color: Color(0xffF3F6FB),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  double calculateEmi(double principal, double interest0, double tenure) {
    interest0 = interest0 / 100;
    double monthlyInterest = interest0 / 12;
    double totalMonths = tenure;
    double emi =
        (principal * monthlyInterest * pow(1 + monthlyInterest, totalMonths)) /
            (pow(1 + monthlyInterest, totalMonths) - 1);
    return emi;
  }

  double calculateInt(double principal, double interest0, double tenure) {
    double totalInt =
        (calculateEmi(sliderValue, interest, time) * time) - sliderValue;
    return totalInt;
  }
}
