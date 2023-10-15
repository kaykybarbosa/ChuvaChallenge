import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.image, super.key});

  String image;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget.image,
                    width: 100,
                  )),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stephen William Hawking',
                        style: TextStyle(fontSize: 23.0, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Universidade de Cambridge',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 156, 156, 156),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: const Row(
            children: [
              Text('Bio', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0, top: 5.0),
          child: const Row(
            children: [
              Expanded(child: Text('Doutor em cosmologia, foi professor lucasiano em emérito na Universidade de Cambridge, um posto que foi ocupado por Isaac Newton, Paul Dirac e Charles Babbage. Foi, pouco antes de falecer, diretor de pesquisa do Departamento de Matemmática Aplicada e Física Teórica (DAMTP) e fundador do Centro de Cosmologia Teórica (CTC) da Universidade de Cambridge.',
              style: TextStyle(fontSize: 16.0),),),
            ],
          )
        ),
      ],
    );
  }
}