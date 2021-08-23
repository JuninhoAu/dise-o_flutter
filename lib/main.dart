
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Convertir medidas"),
      ),
      body: MyBody()
    ));
  }
}




class MyBody extends StatefulWidget{
  

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  
  final List<String> _medidas=['metros','kilomentros','gramos','kilogramos','pies','millas','libras','onzas'];

  final  _formulas=[
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1000,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,0],
                   [1,0.001,0,0,3.28084,0.000621371,0,1]];//matris

  late String _startM;
  late String _endM;
  String finalValue="0";

       final editController=TextEditingController();


  @override
  void initState() {
    _startM=_medidas[0];
    _endM=_medidas[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     final labelStyle=TextStyle(color: Colors.blueGrey,fontSize: 16);
     final measureStyle=TextStyle(color: Colors.blue[700],fontSize: 16);


     return SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
         child: Column(
           children: [
            SizedBox(height: 8,),
     
             Text("Valor",style: labelStyle,),
             TextField(
               controller: editController,
               decoration: InputDecoration(
               hintText: "Valor Inicial",
               contentPadding: EdgeInsets.all(8)),
              
             ),
             SizedBox(height: 8,),
             Text("De",style: labelStyle),
             DropdownButton(
               isExpanded: true,
               value:_startM,
               items: _medidas.map((e){
               return DropdownMenuItem(
                 value: e,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(e,style: measureStyle,),
                 )
                 );
               }).toList(),onChanged: (value){

                setState(() {

                 _startM=value.toString();

                });
     
               }),
              SizedBox(height: 8,),
     
               Text("Para",style: labelStyle),
                DropdownButton(
               isExpanded: true,
               value:_endM,
               items: _medidas.map((e){
               return DropdownMenuItem(
                 value: e,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(e,style: measureStyle),
                 )
                 );
               }).toList(),onChanged: (value){
     
                setState(() {
                  
                  _endM=value.toString();

                });
     
               }),
              SizedBox(height: 32,),
     
              OutlinedButton(child:const Text("Convertir") ,onPressed: (){

                try{

                  final value=double.parse(editController.text.trim());
                  print("valor$value");
                  
                  setState(() {

                  final vari=_formulas[_medidas.indexOf(_startM)][_medidas.indexOf(_endM)].toString();
                  final ola= double.parse(vari);
                  this.finalValue="${value*ola}";

                     print("valor en el array formula:${_medidas.indexOf(_startM)}");
                  print("valor en el array2 formula:${_medidas.indexOf(_endM)}");
                  print("valor en la formula:$ola valor de lo que escribi: $value");
                    
                  });
               

                  FocusScope.of(context).requestFocus(FocusNode());


                }catch(e){

                  print("Problemas al convertir");
                }
                
                
                },),
              Text("res:$finalValue",style: labelStyle)
           ],
         ),
       
       ),
     );

  }
}



