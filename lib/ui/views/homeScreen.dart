
import 'package:ask_before_project1/const/app_color.dart';
import 'package:ask_before_project1/const/app_sizes.dart';
import 'package:ask_before_project1/const/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var myText = AppString();

  var mySize = AppSizes();

  var text = "Loading";
  int i = 0;
  List myList = AppString.qList;


  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(var msg){
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF0EB49E),Color(0xFF93C73F)
        ])
      ),
      child: Text(msg,style: TextStyle(color: Colors.white),),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6F6),
      body: LayoutBuilder(builder: (_,constrains){
        if(constrains.maxWidth < 716){
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/logo2.png",height: 70,),
                        Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse("https://www.timewell.io/"),
                            builder: (context,followlink)=>OutlinedButton(style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    width: 2.0,
                                    color: AppColor.headerText
                                )
                            ),onPressed: followlink, child: Text("Record their answer"))
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text(myText.headerText,
                    style: TextStyle(
                        fontSize: mySize.headerTextSize,
                        color: AppColor.headerText
                    ),
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: mySize.containerWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 25,left: 5,right: 5),
                        child: Text(text,style: GoogleFonts.raleway(
                          color: AppColor.headerText,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  ElevatedButton.icon(style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),onPressed: (){
                    _showToast("Copied Successfully");
                    showDialog(context: (context), builder: (context){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                        ),
                        content: Container(
                          height: 425,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Align(alignment: Alignment.topRight,child: InkWell(onTap: (){
                                  Navigator.pop(context);
                                },child: Icon(Icons.close))),
                                Image.asset("assets/images/books.jpg"),
                                SizedBox(height: 10,),
                                Align(alignment: Alignment.centerLeft,child: Text("Download the best\n100 questions",style: TextStyle(color: AppColor.headerText,fontSize: 25,fontWeight: FontWeight.bold),)),
                                SizedBox(height: 5,),
                                Text("We'd love to send you an E-Book of the 100 top questions you can ask your loved ones to get to know them better",style: TextStyle(fontSize: 14,color: AppColor.headerText),),
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEFEEED),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8,right: 8,),
                                    child: TextField(
                                      style: TextStyle(
                                        color: AppColor.headerText,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: AppColor.headerText,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold
                                          ),
                                          fillColor: Colors.grey
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("Get the E-Book")))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  }, icon: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
                    child: Icon(Icons.copy,size: 16,),
                  ), label: Padding(
                    padding: const EdgeInsets.only(right: 15,top: 8,bottom: 8),
                    child: Text("Copy this question",),
                  )),
                  SizedBox(height: 10,),
                  ElevatedButton.icon(onPressed: (){
                    setState(() {
                      int index = i++;
                      text = myList[index];
                      if(index == myList.length-1){
                        _showToast("List Finished");
                        i=index;
                      }
                    });
                  }, icon: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 6,bottom: 6),
                    child: Icon(Icons.compare_arrows,color: AppColor.headerText,),
                  ), label: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text("Try another one",style: TextStyle(color: AppColor.headerText),),
                  ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF3F6F6),
                      side: BorderSide(
                          width: 2.0,
                          color: AppColor.headerText
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(alignment: Alignment.bottomCenter,child: Text(myText.footerText,style: TextStyle(color: AppColor.headerText),)),
                  ))
                ],
              ),
            ),
          );
        }
        else if(constrains.maxWidth > 716){
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/logo2.png",height: 140,),
                        Padding(
                          padding: const EdgeInsets.only(right: 35),
                          child: OutlinedButton(style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  width: 2.0,
                                  color: AppColor.headerText
                              ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),onPressed: (){}, child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text("Record their answer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                            ),),
                          )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 125,),
                  Text(myText.headerText,
                    style: TextStyle(
                        fontSize: mySize.headerTextSize,
                        color: AppColor.headerText
                    ),
                  ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 955,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25,bottom: 25,left: 10,right: 10),
                        child: Text(text,style: GoogleFonts.raleway(
                          color: AppColor.headerText,
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                      ), onPressed: (){
                        _showToast("Copied Successfully");
                        showDialog(context: (context), builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            content: Container(
                              height: 600,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Align(alignment: Alignment.topRight,child: InkWell(onTap: (){
                                      Navigator.pop(context);
                                    },child: Icon(Icons.close))),
                                    Row(
                                      children: [
                                        Container(
                                          width: 500,
                                          child: Padding(
                                            padding: const EdgeInsets.all(32),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Download the best\n100 questions",style: TextStyle(color: AppColor.headerText,fontSize: 35,fontWeight: FontWeight.bold),),
                                                SizedBox(height: 15,),
                                                Text("We'd love to send you an E-Book of \nthe 100 top questions you can \nask your loved ones to get \nto know them better",style: TextStyle(fontSize: 14,color: AppColor.headerText),),
                                                SizedBox(height: 80,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFFEFEEED),
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 8,right: 8,),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: AppColor.headerText,
                                                      ),
                                                      decoration: InputDecoration(
                                                          hintText: "Email",
                                                          border: InputBorder.none,
                                                          hintStyle: TextStyle(
                                                              color: AppColor.headerText,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                          fillColor: Colors.grey
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 30,),
                                                ElevatedButton(style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15)
                                                  )
                                                ),onPressed: (){}, child: Padding(
                                                  padding: const EdgeInsets.all(12),
                                                  child: Text("Get the E-Book",style: TextStyle(fontSize: 20),),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(width: 500,child: Image.asset("assets/images/books.jpg",height: 300,width: 300,)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      }, icon: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
                        child: Icon(Icons.copy,size: 16,),
                      ), label: Padding(
                        padding: const EdgeInsets.only(right: 15,top: 6,bottom: 6),
                        child: Text("Copy this question",),
                      )),
                      SizedBox(width: 20,),
                      ElevatedButton.icon(onPressed: (){
                        setState(() {
                          int index = i++;
                          text = myList[index];
                          if(index == myList.length-1){
                            _showToast("List Finished");
                            i=index;
                          }
                        });
                      }, icon: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 6,bottom: 6),
                        child: Icon(Icons.compare_arrows,color: AppColor.headerText,),
                      ), label: Padding(
                        padding: const EdgeInsets.only(right: 15,top: 6,bottom: 6),
                        child: Text("Try another one",style: TextStyle(color: AppColor.headerText),),
                      ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFF3F6F6),
                          side: BorderSide(
                              width: 2.0,
                              color: AppColor.headerText
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(alignment: Alignment.bottomCenter,child: Text(myText.footerText,style: TextStyle(color: AppColor.headerText),)),
                  ))
                ],
              ),
            ),
          );
        }
        else {
          return Container();
        }
      })
    );
  }
}
