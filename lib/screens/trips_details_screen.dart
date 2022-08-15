

import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';

 class TripsDetailsScreen extends StatelessWidget {
static const screenRouate='trips/details';



  @override
  Widget build(BuildContext context) {
     final tripID=ModalRoute.of(context)?.settings.arguments as String;
     final tripDetails=Trips_data.firstWhere((trip)=>trip.id==tripID);

    return Scaffold(
      appBar: AppBar(title:Center(child: Text('${tripDetails.title}')) ),
      body: SingleChildScrollView(
        child: Column(
         children: [
          Image.network(tripDetails.imageUrl,height: 300,width: double.infinity,fit: BoxFit.cover,),
         _bulidSectionTitle('الأنشطة'),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
            
                  itemCount: tripDetails.activities?.length,
                  itemBuilder: (context,index)=>Card(
                    elevation: 0.3,
                  child:Text(tripDetails.activities![index]),
                  ),
                ),
          ),
          _bulidSectionTitle('البرنامج اليومي'),
            Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border:Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 200,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
            
                  itemCount: tripDetails.program?.length,
                  itemBuilder: (context,index)=>ListTile(
                    leading: CircleAvatar(
                      child: Text('اليوم ${index + 1}',style: TextStyle(fontSize: 10),),
                    ),
                    title: Text(tripDetails.program![index],style: TextStyle(fontSize: 14),),
                  ),
                ),
          ),
            SizedBox(height: 100,),
         ],
           ),
      ),
    );

  }

  _bulidSectionTitle(text){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      alignment: Alignment.centerRight,
      child: Text(
      text,
      style: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      ),
    );
  }
  // _bulidListView(){
  //   return
  // }
}  