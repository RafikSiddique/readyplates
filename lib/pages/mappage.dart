import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SingleChildScrollView(
        child: Container(
         decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/map.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
      
          child: Column(
            
            children: [
          
              SizedBox(
              height: 524,
              width: 375,
              
            ),
          
              Container(
                height: 300,
                width: 375,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,top: 13),
                      child: Text("Hello Omar !", style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff4E535A),
                                )),
                    ),
                      
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:4,left: 16),
                                    child: Text("Confirm your Location", style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xff222831),
                                    )),
                                  ),
                      
                                    IconButton(
                            icon: const Icon(
                              Icons.location_on
                            ),
                            color: Color(0xff393E46),
                            onPressed: () {
                              // Navigator.pushNamed(
                              //     context, MyRoutes.OnbordingPage);
                            },
                          ),
                      
                                ],
                              ),
                      
                      Padding(
                      padding: const EdgeInsets.only(left: 16,top: 13),
                      child: Text("NEARBY", style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff4E535A),
                                )),
                    ),
                    Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:4,left: 16),
                                    child: Text("Talab Masgid Kondhwa budruk", style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff393E46),
                                    )),
                                  ),
                      
                                    IconButton(
                            icon: const Icon(
                              Icons.done
                            ),
                            color: Color(0xff300ADB5),
                            onPressed: () {
                              // Navigator.pushNamed(
                              //     context, MyRoutes.OnbordingPage);
                            },
                          ),
                      
                                ],
                              ),
                              
                        TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: const Text('Change Location',
                                  style: TextStyle(
                                      color: Color(0xff00ADB5), fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      
                      
                      
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
                              child: Text('NEXT',
                                  style: TextStyle( color: Colors.white,
                                    fontSize: 17,
                                  ))),
                        ),
                      ),
                      SizedBox(height: 16,),
                
                      Divider(
                        indent: 120,
                        endIndent: 120,
                        thickness: 5,
                        color: Color(0xff000000),
                      )
                      
                      
                  ],
                ),
          
          
              )
          
            ],
          ),
      
          ),
      ));
  }
}