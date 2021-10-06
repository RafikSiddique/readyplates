

// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readyplates/utils/routes.dart';
import 'package:image_picker/image_picker.dart';



String id = '';
 //final ImagePicker _picker = ImagePicker();
 // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // Capture a photo
   // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // Pick a video
   

/*void pickImage(
      {
    required void Function(String?) imagePath,
    required void Function(String?) imageName}) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      imagePath(file.path);
      imageName(file.name);
    }
  }

void pikImage({
    required void Function(String?) imagePath,
    required void Function(String?) imageName,
    required void Function(File) imageFile,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath(file.path);
      imageName(file.name);
      imageFile(File(file.path));
    }
  }*/




class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {



File? image;

Future pickImage(ImageSource source) async{
try
{
final image = await ImagePicker().pickImage(source:source);
if(image == null)return;


  final imageTemporary = File(image.path);

  setState(() => this.image = imageTemporary);
} on PlatformException catch (e){
  print('object: $e');
}
}






  @override











  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
        toolbarHeight: 44,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Color(0xff000000),
            ),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.LoginotpScreen);
            }),
        centerTitle: true,
        title: Text(
          'Add Profile Pic',
          style: TextStyle(
            fontSize: 17,
            letterSpacing: -0.226667,
            color: Color(0xff393E46),
          ),
        ),
      ),
      
        body: SingleChildScrollView(
      child: Container(
        // color: Color(0xffE5E5E5),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            
            SizedBox(height: 101),
            
            
              
  Container(
      height: 200,
      width: 200,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(230)),
             // color: Colors.black,
            ),
    child: image != null ? 
    
    ClipOval(child: Image.file(image!,height: 160,width: 160,fit:BoxFit.cover))
    
    
    
    :Image.asset("assets/images/imageman.png")),

            


            // Center(
            //   child: Container(
            //     width: 235,
            //     height: 200,
            //     child: Image.asset("assets/images/imageman.png"),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top:7),
              child: Center(
                child: Text("OMAR LEVIN",
                    style: TextStyle(

                       fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Color(  0xff4E5156,),

                       
                       )),
              ),
            ),
            SizedBox(height: 84),
            Container(
              height: 54,
              decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            border: Border.all(
                              width: 1,
                              color: Color(0xff222831),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 16,right: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(
                      0xffFFFFFF,
                    ),
                    
                    
                   
                        
                  ),
                  onPressed: () => pickImage(ImageSource.camera),
                  
                  
                  // {
                  //   //Navigator.pushNamed(context, MyRoutes.SignupPage);
                  // },
                  child: Text('Open Camera',
                      style: TextStyle(
                            fontSize: 17,
                                    fontFamily: 'Inter-Regular',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff222831,),


                       
                      ))),
            ),
            SizedBox(height: 8),
            Container(
              height: 54,
              
            decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          border: Border.all(
                            width: 1,
                            color: Color(0xff222831),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                         width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 16,right: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  
                  ),
                  onPressed: () => 
                  
                   pickImage(ImageSource.gallery),                  
                  
                  
                  //{
                         // print(id);

        //await pikImage(imageFile: (File ) {  }, imagePath: (String? ) {  }
                              
                            
                          
                    //Navigator.pushNamed(context, MyRoutes.MapPage);
                  //},
                  child: Text('Upload Gallery',
                      style: TextStyle(
                        
                        color: Color(
                          0xffFFFFFF,
                        ),
                        fontSize: 17,
                      ))),
            ),
            SizedBox(
              height: 63,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Skip for Now",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff4E5156),
                    )),
                 IconButton(
            iconSize: 14.83,
            icon: FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Color(0xff000000),
            ),
            onPressed: () async{
             
              Navigator.pushNamed(context, MyRoutes.MapPage);
            }),
              ],
            ),
           
          ],
        ),
      ),
    ));
  }
}
