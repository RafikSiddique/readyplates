import 'package:flutter/material.dart';
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 

    body:SingleChildScrollView(
      child: Container(
       // color: Color(0xffE5E5E5),
        child: Column(
          children: [
            SizedBox(height: 20,),
             Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_left,
                              ),
                              color: Color(0xff393E46),
                              onPressed: () {
                                //Navigator.pushNamed(
                                    //context, MyRoutes.OnbordingPage);
                              },
                            ),
                            SizedBox(width: 95),
                            Text("Add Profile Pic",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xff393E46),
                                )),
                          ],
                        ),
                        SizedBox(height:100),
                  Center(
                    child: Container(
                              width: 235,
                              height: 200,
                              child: Image.asset("assets/images/imageman.png"),
                              
                              
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("OMAR LEVIN", style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff4E5156,)
                                    )),
                    ),
                  ),  
                   SizedBox(height:84),
                    Padding(
                          padding: const EdgeInsets.only(left:16,right: 16),
                          child: SizedBox(
                            height: 54,
                            width: 343,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffFFFFFF,),
                                  side: BorderSide(
                                      width: 1.5,
                                      color: Color.fromRGBO(255, 255, 255, 0.5)),
                                ),
                                onPressed: () {
                                   //Navigator.pushNamed(context, MyRoutes.SignupPage);
                                },
                                child: Text('Open Camera',
                                    style: TextStyle( color: Color(0xff222831,),
                                      fontSize: 17,
                                    ))),
                          ),
                        ),
                         SizedBox(height:8),
                    Padding(
                          padding: const EdgeInsets.only(left:16,right: 16),
                          child: SizedBox(
                            height: 54,
                            width: 343,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  side: BorderSide(
                                      width: 1.5,
                                      color: Color.fromRGBO(255, 255, 255, 0.5)),
                                ),
                                onPressed: () {
                                   //Navigator.pushNamed(context, MyRoutes.SignupPage);
                                },
                                child: Text('Open Camera',
                                    style: TextStyle( color: Color(0xffFFFFFF,),
                                      fontSize: 17,
                                    ))),
                          ),
                        ),
                        SizedBox(height: 64,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                 
                                    Text("Skip for Now", style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff4E5156),
                                    )),
                        
                                      IconButton(
                              icon: const Icon(
                                Icons.arrow_right,
                              ),
                              color: Color(0xff4E5156),
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, MyRoutes.OnbordingPage);
                              },
                            ),
                        
                                  ],
                                ),
                                SizedBox(height:83),
                                 Divider(
                          indent: 120,
                          endIndent: 120,
                          thickness: 5,
                          color: Color(0xff000000),
                        )
                        
    
    
    
              
          ],
        ),
        
      ),
    ));
  }
}