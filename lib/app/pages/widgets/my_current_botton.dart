import 'package:flutter/material.dart';

class MyCurrentBotton extends StatefulWidget {
  MyCurrentBotton(
      {this.favorited = false, this.isProcessing = false, super.key});

  bool favorited;
  bool isProcessing;

  @override
  State<MyCurrentBotton> createState() => _MyCurrentBottonState();
}

class _MyCurrentBottonState extends State<MyCurrentBotton> {
  @override
  Widget build(BuildContext context) {
    return widget.isProcessing
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh, color: Colors.grey[600]),
              const SizedBox(width: 5.0),
              Text(
                'Processando',
                style: TextStyle(fontSize: 17, color: Colors.grey[600]),
              )
            ],
          )
        : Row(
            children: [
              widget.favorited
                  ? const Icon(
                      Icons.star_outline,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
              const SizedBox(width: 5.0),
              Text(
                widget.favorited
                    ? 'Remover da sua agenda'
                    : 'Adicionar à sua agenda',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
            ],
          );
  }
}
