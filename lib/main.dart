import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Mulish',
      ),
      home: const MyHomePage(title: 'Gerador de cores aleatórias'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int coordenadasX = 0;
  int coordenadasY = 0;
  int coordenadasZ = 0;
  bool _pressionadoDescer = false;
  bool _pressionadoSubir = false;


  double alpha = 1.0;
  double hue = 180;
  double saturation = 0.5;
  double value = 0.5;
  
  late HSVColor corCirculo = HSVColor.fromAHSV(
    alpha,
    hue,
    saturation,
    value,
  );
 

  void definirCor() {
    setState(() {
      corCirculo = HSVColor.fromAHSV(
    alpha,
    hue,
    saturation,
    value,
    );
    });
  }

  void entrar() {
    setState(() {
      if(coordenadasZ < 5){
      coordenadasZ++;
      value+= 0.1;
      }
    });
  }
  void sair() {
    setState(() {
      if(coordenadasZ > -5){
      coordenadasZ--;
      value-= 0.1;
      }
    });
  }
  void subir() {
    setState(() {
      if(coordenadasX < 180){
      coordenadasX++;
      hue++;
      }
    });
  }
  void descer() {
    setState(() {
      if(coordenadasX > -180){
      coordenadasX--;
      hue--;
      }
    });
  }
  void direita() {
    setState(() {
      if(coordenadasY < 5){
        coordenadasY++;
        saturation+= 0.1;
      }
    });
  }
  void esquerda() {
    setState(() {
      if(coordenadasY > -5){
        coordenadasY--;
        saturation-= 0.1;
      }
    });
  }

  void descerApertado() async{
    while(_pressionadoDescer){
      descer();
      definirCor();
    }
  }
  void subirApertado() async{
    while(_pressionadoSubir){
      subir();
      definirCor();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child:Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text("$coordenadasX $coordenadasY $coordenadasZ")
              ),
               width: 400.0,
              height: 550.0,
              decoration: BoxDecoration(
                color: corCirculo.toColor(),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              child: Center(
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => {entrar(),definirCor()},
                        child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.add),
                        ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      GestureDetector(
                        onTap: () => {sair(),definirCor()},
                        child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.remove),),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        //onLongPress: () =>  subirApertado(),
                        //onLongPressStart: (details) => {_pressionadoSubir = true,},
                        //onLongPressEnd: (details) => {_pressionadoSubir = false},
                        onTap: () => {subir(),definirCor()},
                        child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.keyboard_arrow_up),
                        ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                          onTap: () => {esquerda(),definirCor()},
                            child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.keyboard_arrow_left),
                            ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          GestureDetector(
                        onTap: () => {direita(),definirCor()},
                            child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.keyboard_arrow_right),
                            ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        //onLongPress: () =>  descerApertado(),
                        //onLongPressStart: (details) => {_pressionadoDescer = true,},
                        //onLongPressEnd: (details) => {_pressionadoDescer = false},
                        onTap: () => {descer()},
                        child:Container(
                          padding: const EdgeInsets.all(8),
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                          child:const Center (child: Icon(Icons.keyboard_arrow_down),
                      ),
                        ),
                      ),
                    ],
                  ),
                ],
              ), 
            ),
            ),
          ]
        ),
      ),   
    );
  }
}
