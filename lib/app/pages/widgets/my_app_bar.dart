import 'package:flutter/material.dart';

class MyAppBar{
  final BuildContext context;

  MyAppBar({required this.context});

  AppBar get(){
    return AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text(
              'Chuva ❤️ Flutter',
              style: TextStyle(fontSize: 20.0),
            ),
              const Text(
                'Programação',
                style: TextStyle(fontSize: 20.0),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white
                ),
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(width: 50.0),
                    const Text(
                      'Exibindo todas atividades', 
                      style: TextStyle(
                        fontSize: 15.0, 
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
