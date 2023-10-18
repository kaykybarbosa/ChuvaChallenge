import 'package:chuva_dart/app/pages/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({this.image = '', super.key});

  final String image ;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: widget.image.isNotEmpty
                    ? Image.network(
                      widget.image,
                      width: 100)
                    : const Icon(FontAwesomeIcons.solidUser, size: 60, color: Colors.grey,)
                    ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                Text('Bio', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
            child:
              const HtmlWidget('''<p style="text-align: justify">Doutor em cosmologia, foi professor lucasiano emérito na Universidade de Cambridge, um posto que foi ocupado por Isaac Newton, Paul Dirac e Charles Babbage. Foi, pouco antes de falecer, diretor de pesquisa do Departamento de Matemática Aplicada e Física Teórica (DAMTP) e fundador do Centro de Cosmologia Teórica (CTC) da Universidade de Cambridge</p>\r\n''',
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
          ),
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    myText('Atividades')
                  ],
                )
              ),
              Container(
                margin:const EdgeInsets.only(left: 10.0),
                padding: const EdgeInsets.only(left: 10.0),
                child: myText('dom. 26/11/2023')
              ),
            ],
          ),
          MyCard()
        ],
    );
  }
}

myText(label){
  return Text(
    label, 
    style: const TextStyle(
      fontSize: 18.0, 
      fontWeight: FontWeight.w500)
  );
}