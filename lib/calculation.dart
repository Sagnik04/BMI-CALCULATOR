import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget {  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var hf = TextEditingController();
  var hi = TextEditingController();
  var wt = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  var Value1;
  var result = " ";
  var bgcolour = Colors.grey.shade100;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("BMI CALCULATOR",style: TextStyle(color: Colors.blue.shade200,fontFamily: 'FontTitle',fontWeight: FontWeight.bold),),
       backgroundColor: Colors.black,
       centerTitle: true,
     ),
     backgroundColor: bgcolour,
     body: SingleChildScrollView(
       child: Form(
         key: _key,
         child: Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   controller: hf,
                   keyboardType: TextInputType.number,
                   validator: (Value1){
                     if(Value1!.isEmpty){
                       return "Enter The Height(in Feet)";
                     }
                     return null;
                   },
                   decoration: InputDecoration(
                     hintText: "Enter Your Height(in Feet)",hintStyle: TextStyle(color: Colors.black),
                   ),
                 ),
               ),
               SizedBox(height: 40,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   controller: hi,
                   validator: (Value1){
                     if(Value1!.isEmpty){
                       return "Enter The Height(in Inch)";
                     }
                     return null;
                   },
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       hintText: "Enter Your Height(in Inch)",hintStyle: TextStyle(color: Colors.black)
                   ),
                 ),
               ),
               SizedBox(height: 40,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: TextFormField(
                   controller: wt,
                   validator: (Value1){
                     if(Value1!.isEmpty){
                       return "Enter The Weight(in Kgs)";
                     }
                     return null;
                   },
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                       hintText: "Enter Your Weight(in Kgs)",hintStyle: TextStyle(color: Colors.black)
                   ),
                 ),
               ),
               SizedBox(
                 height: 40,
               ),
               ElevatedButton(onPressed: (){
                 if(_key.currentState!.validate()){
                   var ft = hf.text.toString();
                   var inch = hi.text.toString();
                   var w = wt.text.toString();

                   var Iinch = int.parse(inch);
                   var Ift = int.parse(ft);
                   var Iw = double.parse(w);

                   var tInch = (Ift*12) + Iinch;
                   var tCm = tInch*2.54;
                   var tM = tCm/100;
                   var msg = " ";


                   var bmi = Iw/(tM*tM);

                   if(bmi>25){
                     msg = "You Are OverWeight!";
                     bgcolour = Colors.red.shade200;
                   }else if(bmi<18){
                     msg = "You Are UnderWeight!";
                     bgcolour = Colors.yellow.shade200;

                   }else{
                     msg = "You Are Healthy!";
                     bgcolour = Colors.green.shade200;


                   }
                   setState(() {
                     result = " $msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";

                   });


                 }

               }, child: Text("Calculate",style: TextStyle(color: Colors.black),)),
               SizedBox(height: 20,),
               Text(result,style: TextStyle(fontWeight: FontWeight.bold),)
             ],
           ),
         ),
       ),
     ),
   );
  }}
