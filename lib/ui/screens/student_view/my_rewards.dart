// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/screens/student_view/coupons.dart';

class MyRewards extends StatefulWidget {
  const MyRewards({super.key});

  @override
  State<MyRewards> createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {
  var userCoins = 0000;
  Future getCoins() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((event) {
      // you can access the values by
      userCoins = event['coins'];
    });
    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(children: [
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                // color: Colors.yellow
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.yellow,
                    Colors.orange,
                  ],
                )),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                text: const TextSpan(
                  text: 'Wellcome to\n',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'My Rewards',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 170, right: 20, left: 20),
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.star_rate_rounded,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            Text("My Points")
                          ],
                        ),
                        Text(
                          userCoins.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 120,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff6D88E7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.align_vertical_bottom_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text("Tasks",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Reward()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 120,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.orange[300]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.wallet_giftcard_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Text("Redeem",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[300]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.card_membership_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              "My Coupons",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 20,
                        )
                      ]),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
