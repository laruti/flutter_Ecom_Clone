
import 'package:flutter/material.dart';
import 'package:fu_ecom/components/btnAdd.dart';
import 'package:fu_ecom/models/goods_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    void showPay(BuildContext context) {
      showDialog(
        context: context, 
        builder:(context)=>AlertDialog(
          content:  const Text("user want to pay wait more infor will fix soon"),
          actions: [
            MaterialButton(
              onPressed:()=> Navigator.pop(context),
              child: const Center(child: Text("Ok",style:
               TextStyle(fontSize: 16,color: Colors.grey),
               )),
              )
          ],
       
        ),
      );
    }

    void removeItemFromCart(BuildContext context, GoodsModel product) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("add your item to cart"),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () => {
                Navigator.pop(context),
                context.read<GoodsProvider>().removeFromCart(product)
              },
              child: const Text("Yes"),
            )
          ],
        ),
      );
    }

    final cart = context.watch<GoodsProvider>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
    
        elevation: 0,
        title: const Text("Cart Page"),
      ),
     
      body:cart.isEmpty
          ? const Center(
              child: Text(
                "No items in your cart.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ) :Column(
        children: [
          
          Expanded(
            child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    leading: Image.asset(item.image),
                    title: Text(item.name),
                    subtitle: Text(item.price.toStringAsFixed(2)),
                    trailing: IconButton(
                        onPressed: () => removeItemFromCart(context, item),
                        icon: const Icon(Icons.delete)),
                  );
                }),
          ),
          
          // MyButton(
          //     onTap: () => showPay(context),
          //     child: const Text("Need to pay now "))
        ],
        
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: null, label:SizedBox(
          width: size.width * 0.9,
          child:Btnadd(onTap: ()=>showPay(context), text: "Pay Now", color: Colors.black, colorfn: Colors.white, iconData: null) ,)
        ),
    );
  }
}
