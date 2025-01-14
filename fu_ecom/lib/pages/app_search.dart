import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fu_ecom/components/my_type.dart';
import 'package:fu_ecom/models/category_models.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({super.key});

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
    void signOutUser(BuildContext context){
    FirebaseAuth.instance.signOut();
     Navigator.pushReplacementNamed(context, '/auth_page');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:()=>signOutUser(context), icon:Icon(Icons.login))
        ],
      ),
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              TextField(
                
                decoration: InputDecoration(
                    hintText: "search product",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),  
                    )),        
              ),
              SizedBox(height: 25,),
           

               SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                mainItem.length,
                (index) => InkWell(
                  onTap: () {
                    // Handle tap event here
                    print('Tapped on ${mainItem[index].name}');
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            mainItem[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Space between avatar and name
                      Text(
                        mainItem[index].name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
            ],
          ),
          
          
          ),
          
        
          
    ),
    
    );
  }
}
