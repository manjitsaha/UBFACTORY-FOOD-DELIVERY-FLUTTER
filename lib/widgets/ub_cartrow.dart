import 'package:flutter/material.dart';
import 'package:newfigma/cart/controller/cartControlle.dart';

class UBCartRow extends StatelessWidget {
  String image, name, price, qty;
  String? itemId;
  Function plus, minus;

  UBCartRow({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.qty,
    required this.plus,
    required this.minus,
    this.itemId
  });

  @override
  Widget build(BuildContext context) {
    CartController cc =CartController();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  return Image(image: AssetImage('assets/images/home2.png'));
                },
              )),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs. $price',
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => minus(),
                    child: Container(
                      width: 35,
                      height: 35,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    qty.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => plus(),
                    child: Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.green,
                        )),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
        SizedBox(width:80),
        GestureDetector(
          onTap: (){
          cc.removeFromCart('$itemId');
          },
        child: Icon(Icons.close)
        )
        ],
      ),
    );
  }
  
}
