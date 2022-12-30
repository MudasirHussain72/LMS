// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
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

  Future<dynamic> coinMinus(Image image) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width / 1.1,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        child: Text(
                          "REDEEM CONFIRMATION",
                        ),
                      ),
                    ),
                    const Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        child: Text(
                          "Are you sure you want to redeem your points for this coupon? Please remember code before press redeem",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    image,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              userCoins = userCoins - 200;
                              var uid = FirebaseAuth.instance.currentUser!.uid;
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({'coins': userCoins}).then((value) {
                                setState(() {});
                                Navigator.pop(context);
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.yellow),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10)),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))),
                            child: const Text("REDEEM")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(10)),
                              // textStyle: MaterialStateProperty.all()
                            ),
                            child: const Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ))
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Reward"),
        titleTextStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)))),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text("Your Coins = $userCoins",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 10),
            if (userCoins < 200) ...[
              const Center(
                  child: Text("You Have Not Enough Points To Get A Voucher"))
            ] else if (userCoins >= 200 && userCoins < 400) ...[
              InkWell(
                onTap: () => coinMinus(Image.asset("assets/ui_images/mc.png")),
                child: Image.asset("assets/ui_images/mc.png"),
              )
            ] else if (userCoins >= 400 && userCoins < 600) ...[
              InkWell(
                onTap: () {
                  coinMinus(Image.asset("assets/ui_images/pizza.png"));
                },
                child: Image.asset("assets/ui_images/pizza.png"),
              ),
              InkWell(
                onTap: () => coinMinus(Image.asset("assets/ui_images/mc.png")),
                child: Image.asset("assets/ui_images/mc.png"),
              )
            ] else if (userCoins >= 600 && userCoins < 800) ...[
              InkWell(
                  onTap: () => (Image.asset("assets/ui_images/pizza.png")),
                  child: Image.asset("assets/ui_images/pizza.png")),
              InkWell(
                  onTap: () => (Image.asset("assets/ui_images/mc.png")),
                  child: Image.asset("assets/ui_images/mc.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/foodPanda.png")),
                  child: Image.asset("assets/ui_images/foodPanda.png"))
            ] else if (userCoins >= 800 && userCoins < 1000) ...[
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/pizza.png")),
                  child: Image.asset("assets/ui_images/pizza.png")),
              InkWell(
                  onTap: () => (Image.asset("assets/ui_images/mc.png")),
                  child: Image.asset("assets/ui_images/mc.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/foodPanda.png")),
                  child: Image.asset("assets/ui_images/foodPanda.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/udemy.png")),
                  child: Image.asset("assets/ui_images/udemy.png"))
            ] else if (userCoins >= 1000 && userCoins < 2000) ...[
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/pizza.png")),
                  child: Image.asset("assets/ui_images/pizza.png")),
              InkWell(
                  onTap: () => (Image.asset("assets/ui_images/mc.png")),
                  child: Image.asset("assets/ui_images/mc.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/foodPanda.png")),
                  child: Image.asset("assets/ui_images/foodPanda.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/udemy.png")),
                  child: Image.asset("assets/ui_images/udemy.png")),
              InkWell(
                  onTap: () =>
                      coinMinus(Image.asset("assets/ui_images/mc.png")),
                  child: Image.asset("assets/ui_images/mc.png")),
            ]
          ],
        ),
      ),
    );
  }
}
