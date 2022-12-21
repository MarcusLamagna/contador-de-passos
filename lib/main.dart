import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Criando um Widget resposável do corpo do app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Criando variável contador de pessoas
  int count = 0;


  void decrement() {
    //Redesenhar a tela com o estado alterado
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  //Quando está vazio
  bool get isEmpty => count == 0;

  //Quando estiver lotado
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    //Método responsável por RECRIAR a tela
    print('Build');
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/passos.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          //Centtalizar texto
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
        //Se estiver lotado, apresentar como lotado, caso contrtario
        //apresentar pode entrar.
        isFull ?'Lotado' : 'Pode entrar!',
          style: TextStyle(
            fontSize: 30,
            color: isFull ? Colors.red : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            '$count',
            style: TextStyle(
              fontSize: 100,
              color: isFull ? Colors.red : Colors.white,
            ),
          ),
        ),
        Row(
          //Centralizar botao
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        TextButton(
        //Se estiver vazio, desabilitar botão
        onPressed: isEmpty ? null : decrement,
          style: TextButton.styleFrom(
              backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) :
              Colors.white,
              fixedSize: const Size(100, 100),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          ),
        ),
        child: const Text(
          'Saiu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(width: 32),
      TextButton(
        onPressed: isFull ? null : increment,
        style: TextButton.styleFrom(
          backgroundColor: isFull ? Colors.white.withOpacity(0.2) :
          Colors.white,
          fixedSize: const Size(100, 100),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
          ),
        ),
        child: const Text(
          'Entrou',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      ],
    ),]
    ,
    )
    ,
    )
    ,
    );
  }
}
