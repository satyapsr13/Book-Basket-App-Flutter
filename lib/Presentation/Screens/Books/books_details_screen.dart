// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_const
import 'package:book_basket/Constants/colors.dart';
import 'package:book_basket/Constants/locations.dart';
import 'package:book_basket/Presentation/Widgets/primary_button.dart';
import 'package:book_basket/Utility/common.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    var bookTitle = 'ALL IN ONE ENGLISH CORE';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Book Details'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              formatDateSlash(DateTime.now()),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      persistentFooterButtons: [
        Center(
            child:
                PrimaryButton(onPressed: () {}, buttonText: 'Contact Seller'))
      ],
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: mq.width * 0.45,
                    height: mq.width * 0.5,
                    child: Image.asset(
                      AppImages.carousel_1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.card_travel,
                      color: Color(0xff3E4A59),
                      size: 25,
                    )),
              ],
            ),
            SizedBox(height: 20),
            _dividerLine(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    bookTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff3E4A59),
                    ),
                  ),
                  Text(
                    "Class 12th",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff3E4A59),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_city,
                          color: AppColors.primaryColor, size: 10),
                      Text(
                        '  CC47+H2,Anand Nagar,Hoshnagabad',
                        style: const TextStyle(),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'view in map',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 10),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              '₹ 190  ',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '  50% off on MRP',
                        style: const TextStyle(
                            color: Color(0xffEC9948), fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _dividerLine(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Description:  ",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff3E4A59),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Description  " * 50,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff3E4A59),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _dividerLine(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Book Information:",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff3E4A59),
                          ),
                        ),
                        aboutBookDetailsWidget("Publisher:", "Arihant"),
                        SizedBox(height: 10),
                        aboutBookDetailsWidget("Edition Year:", "2020-21"),
                        SizedBox(height: 10),
                        aboutBookDetailsWidget("MRP of Book:", "₹ 380"),
                        SizedBox(height: 10),
                        aboutBookDetailsWidget("Class:", "12th"),
                        SizedBox(height: 10),
                        aboutBookDetailsWidget("Author:", "NA"),
                        SizedBox(height: 10),
                        aboutBookDetailsWidget(
                          "Uploaded on:",
                          formatDateSlash(DateTime.now()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }

  Row aboutBookDetailsWidget(String title, String data) {
    return Row(
      children: [
        Text(
          "$title  ",
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff3E4A59),
          ),
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Divider _dividerLine() {
    return Divider(
      color: Colors.grey,
      thickness: 2,
    );
  }
}
