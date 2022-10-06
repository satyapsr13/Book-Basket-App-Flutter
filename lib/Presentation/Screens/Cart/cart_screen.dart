// ignore_for_file: prefer_const_constructors
import 'package:auto_route/auto_route.dart';
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Routes/routes.gr.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const Icon(Icons.card_travel_outlined),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: isEmpty
          ? emptyCartWidget(mq, context)
          : Column(
              children: [CartScreenWidget()],
            ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Column emptyCartWidget(Size mq, BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: mq.height * 0.1),
        Row(
          children: [
            const Spacer(),
            Text(
              'Your Cart is Empty!',
              style: const TextStyle(),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(height: mq.height * 0.5),
        PrimaryButton(
          onPressed: () {
            context.pushRoute(HomeScreen());
          },
          buttonText: "Shop now",
          widthSize: mq.width * 0.5,
        )
      ],
    );
  }
}

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    var colors = Colors.red;
    return Container(
      width: mq.width * 0.85,
      height: mq.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey)),
      child: Row(
        children: [
          Container(
            color: colors,
            width: mq.width * 0.4,
            height: mq.height * 0.2,
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
