import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/button.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
    int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
        onTap: (){Get.back();},
        child: Icon(Icons.arrow_back_ios,color: ColorConstant.black,)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Icon(Icons.logout_outlined,color: ColorConstant.black,)],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:height*0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 232, 232, 232),
              ),
              child:  const Center(child: Image(image: AssetImage('assets/images/dosa.png'),)),
            ),
           const SizedBox(height: 20,),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Masala dosa',style: Style.heading,),
            const Icon(Icons.favorite_outline)
           ],),
          const Text('for 2 people'),
          const SizedBox(height: 10,),
          Row(children: [
            Container(width: 180,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.grey)
                  ),
                   child: Row(
                   children: [
                    GestureDetector(
                      onTap: _decrement,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                    child:Center(child: Text('$_quantity',style: const TextStyle(fontSize: 16),)),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: _increment,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.add),
                      ),
                    ),
                      ],
                   ),
                 ),
               const SizedBox(width: 130,),
               const Image(image: AssetImage('assets/images/bag.png')),
               const Text('50',)
          ],),
          const SizedBox(height: 10,),
          const Divider(thickness: 2,),
          const SizedBox(height: 10,),
          const Text('Product Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
          const SizedBox(height: 10,),
          const Text('Lorem ipsum dolor sit amet consectetur.\nDictum lacus justo malesuada fermentum.'),
          const SizedBox(height: 10,),
          const Divider(thickness: 2,),
          const SizedBox(height: 10,),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Nutritions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
            Icon(Icons.arrow_forward_ios)
          ],),
          const SizedBox(height: 10,),
          const Divider(thickness: 2,),
          const SizedBox(height: 10,),
          const Row(
            children: [
            Text('Review',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
            SizedBox(width: 185,),
            Image(image: AssetImage('assets/images/stars.png')),
            Icon(Icons.arrow_forward_ios)
          ],),
          const SizedBox(height: 18,),
          ButtonWidget(onPressed: (){},
           text: 'Add to Basket',
            backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white)
          ],
        ),
      ),
    );
  }
}