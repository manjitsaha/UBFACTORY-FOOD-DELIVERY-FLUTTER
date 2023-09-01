import 'package:flutter/material.dart';
import '../../widgets/iconTextOrder.dart';
import 'feedback.dart';


class OrderDetailsScreen extends StatefulWidget {
  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  String selectedEmoji = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text('Order Details',style:TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/home2.png',
                    width: 80,
                    height: 80,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dosa',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Order Date: August 28, 2023',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    SizedBox(height: 8,),
                    Image.asset('assets/images/stars.png')
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Divider(thickness: 1,),
              SizedBox(height: 24), 
              Text(
                        'Order #12345',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              SizedBox(height: 30), 
              OrderStatus(
                iconColor: Colors.green,
                statusText: 'Order Placed On 28 August',
              ),
              SizedBox(width: 25,
              height: 40,
              child: VerticalDivider(thickness: 2,color: Colors.green,)),
              
              OrderStatus(
                iconColor: Colors.blue,
                statusText: 'Order Shipped On 29 August',
              ),
              SizedBox(width: 25,
              height: 40,
              child: VerticalDivider(thickness: 2,color: Colors.blue,)),
              
              OrderStatus(
                iconColor: Colors.orange,
                statusText: 'Out for Delivery On 29 August',
              ),
               SizedBox(width: 25,
              height: 40,
              child: VerticalDivider(thickness: 2,color: Colors.orangeAccent,)),
              
              OrderStatus(
                iconColor: Colors.grey,
                statusText: 'Order Completed 30 August',
              ),
            SizedBox(height: 40),
              Text(
                'How was your experience?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   FeedbackEmojiButton(
                  emoji: '😃',
                  isSelected: selectedEmoji == '😃',
                  onTap: () {
                    setState(() {
                      selectedEmoji = '😃';
                    });
                  },
                ),
                  SizedBox(width: 10,),
                  FeedbackEmojiButton(
                  emoji: '😐',
                  isSelected: selectedEmoji == '😐',
                  onTap: () {
                    setState(() {
                      selectedEmoji = '😐';
                    });
                  },
                ),
                 SizedBox(width: 10,),
                FeedbackEmojiButton(
                  emoji: '😔',
                  isSelected: selectedEmoji == '😔',
                  onTap: () {
                    setState(() {
                      selectedEmoji = '😔';
                    });
                  },
                ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Leave a comment:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
               
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your feedback here...',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
