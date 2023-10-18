import 'package:flutter/material.dart';

class MyCurrentBotton extends StatefulWidget {
  const MyCurrentBotton(
      {this.favorited = false, this.isProcessing = false, super.key});

  final bool? favorited;
  final bool isProcessing;

  @override
  State<MyCurrentBotton> createState() => _MyCurrentBottonState();
}

class _MyCurrentBottonState extends State<MyCurrentBotton> {
  var _isFavorited;

  bool getFavorited(){
    final valueOfFavorited = widget.favorited.toString();

    setState(() {
      if (valueOfFavorited.contains('true')){
        _isFavorited = true;
      }
      else{
        _isFavorited = false;
      }
    });

    return _isFavorited;
  }

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
              getFavorited()
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
                getFavorited()
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
