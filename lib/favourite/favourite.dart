import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/button.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Text('Favourite',style: Style.heading,)),
                const SizedBox(height: 10,),
                const Divider(thickness: 2,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5,10,5),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('assets/images/b2.png'),width:40),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          Text('Sprite Can',style: Style.smallHead,),
                          const SizedBox(height: 5,),
                          const Text('325ml,Price')
                        ],
                      ),
                      const SizedBox(width: 100,),
                      const Image(image: AssetImage('assets/images/bag.png'),width:40),
                      const Text('50'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5,10,5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage('assets/images/b1.png'),width:40),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          Text('Diet Coke',style: Style.smallHead,),
                          const SizedBox(height: 5,),
                          const Text('325ml,Price')
                        ],
                      ),
                      const SizedBox(width: 100,),
                      const Image(image: AssetImage('assets/images/bag.png'),width:40),
                      const Text('50'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
               const Divider(thickness: 2,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5,10,5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage('assets/images/b3.png'),width: 70,),
                      const SizedBox(width: 8,),
                      Column(
                        children: [
                          Text('Diet Coke',style: Style.smallHead,),
                          const SizedBox(height: 5,),
                          const Text('325ml,Price')
                        ],
                      ),
                      const SizedBox(width: 100,),
                      const Image(image: AssetImage('assets/images/bag.png'),width:40),
                      const Text('50'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
               const Divider(thickness: 2,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5,10,5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage('assets/images/b5.png'),width:40),
                      const SizedBox(width: 37,),
                      Column(
                        children: [
                          Text('Diet Coke',style: Style.smallHead,),
                          const SizedBox(height: 5,),
                          const Text('325ml,Price')
                        ],
                      ),
                      const SizedBox(width: 100,),
                      const Image(image: AssetImage('assets/images/bag.png'),width:40),
                      const Text('50'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                 Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage('assets/images/b6.png'),width:40),
                      const SizedBox(width: 30,),
                      Column(
                        children: [
                          Text('Diet Coke',style: Style.smallHead,),
                          const SizedBox(height: 5,),
                          const Text('325ml,Price')
                        ],
                      ),
                      const SizedBox(width: 100,),
                      const Image(image: AssetImage('assets/images/bag.png'),width:40),
                      const Text('50'),
                      const Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
               const Divider(thickness: 2,),
               const SizedBox(height: 20,),
               ButtonWidget(onPressed: (){},
                text: 'Add All to Cart',
                 backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}