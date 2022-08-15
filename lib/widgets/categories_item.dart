import 'package:flutter/material.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
class CategoryItem extends StatelessWidget {

  final String? id;
  final String? title;
  final String? imageUrl;

  const CategoryItem(
    { Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>  selectCategory(context),
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        
        children: [
          FadeInImage.assetNetwork(
                          image: "$imageUrl",
                          height: 250, 
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/laoding.jpg',
                          imageErrorBuilder:
                              (BuildContext, Object, StackTrace) {
                            return Center(
                              child: Image(
                                  height: 100,
                                  width: 100,
                                image:  AssetImage('assets/images/laoding.jpg')
                                  ),
                            );
                          },
                        ),
                       
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "$imageUrl",
              height: 250, 
              fit: BoxFit.cover,  
              ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
    
            ),
          ),
    
        ],
      ),
    );
  }
  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRout,
      arguments: {
        'id':id,
        'title':title,
      }
      );
      // Navigator.of(ctx).push(MaterialPageRoute(
      //   builder: ((context) =>CategoryTripsScreen(
      //      categoryID: id,
      //      categoryTitle: title,
      //   )
        // ),
      // ),
    // );
  }
}