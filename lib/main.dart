import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),


    );
  }
}


class HomeActivity extends StatelessWidget{


  var MyPicsList=[
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 1","bio":"beautiful nature 1"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 2","bio":"beautiful nature 2"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 3","bio":"beautiful nature 3"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 4","bio":"beautiful nature 4"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 5","bio":"beautiful nature 5"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 6","bio":"beautiful nature 6"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 7","bio":"beautiful nature 7"},
    {"img":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOz7Spg5pcR36fBNcVpzpZI9aqifV8Es1deCsbzY_srd7BQVuUIF8jch_5YSpFl5-3cpw&usqp=CAU","title":"nature 8","bio":"beautiful nature 8"},
    ];


  // snackbar
  MySnackbar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Photo Gallery'),
        titleSpacing: 14,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child:Center(
                child: Text("Welcome to My Photo Gallery!",style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              )
            ),

            //search box
            Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),prefixIcon: Icon(Icons.search),labelText: "Search"))),


            //grid view builder
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                childAspectRatio: 1.2
              ),
              itemCount: MyPicsList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){MySnackbar("Clicked on  ${MyPicsList[index]['title']}", context);},
                  child: Stack(
                    children: [
                       Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        height: 220,
                        child: Image.network(MyPicsList[index]['img']! , fit: BoxFit.fill,),
                      ),
                      Positioned(
                        bottom:10,
                        top:70,
                        right:10,
                        left:10,
                        child: Container(
                          child: ElevatedButton(onPressed: (){MySnackbar("Clicked on  ${MyPicsList[index]['title']}", context);},child: Text(MyPicsList[index]['title']!),),
                        )
                      )
                    ],
                  )

                );
              },
            ),


            //list view for list tile

            ListView.builder(
              itemCount: MyPicsList.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context,index){

                return Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 35,
                  child: ListTile(
                    leading:Icon(Icons.photo) ,
                    title: Text(MyPicsList[index]['title']!),
                    subtitle: Text(MyPicsList[index]['bio']!),
                  ),
                );
              },
            ),




          ],

        ),
      ),

      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.cloud_upload),
        onPressed: (){MySnackbar('Photos Uploaded Successfully!', context);},
      ),

    );
  }
}