import 'dart:async';

import 'package:chuva_dart/app/pages/widgets/my_current_botton.dart';
import 'package:chuva_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventPage extends StatefulWidget {
  const EventPage({this.goTo, super.key});

  final Function? goTo;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool? _favorited;
  bool _isVisible = false;
  bool _isProcessing = false;
  Widget currentBotton = const MyCurrentBotton();

  final String _image =
      'https:\/\/static.galoa.com.br\/file\/Eventmanager-Private\/styles\/large\/s3\/eventmanager_person\/Screenshot%202023-10-10%20at%2013.06.35.png?VersionId=4_z9e083e414507696175f50716_f10473fd681469d07_d20231010_m160744_c003_v0312007_t0020_u01696954064581\u0026itok=XSqu4FiW';

  @override
  void initState() {
    super.initState();
    setState(() {
      currentBotton = MyCurrentBotton(favorited: getFavorited());
    });
  }

  void _showFooter() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
          _isProcessing = false;
          currentBotton = MyCurrentBotton(favorited: getFavorited());
        });
      }
    });
  }

  onPressed() {
    _favorited = !getFavorited().toString().contains('true');
    setFavorited(_favorited);
    _isVisible = true;
    _isProcessing = true;
    currentBotton = MyCurrentBotton(
        favorited: _favorited, isProcessing: true); // is fovorited
    _showFooter();
  }
  
  void setFavorited(isFavorited) {
    appPreferences.setBool('isFavorited', isFavorited);
  }

  bool? getFavorited() {
    return appPreferences.getBool('isFavorited');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      color: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: const Row(
                        children: [
                          Text(
                            'Astrofísica e Cosmologia',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, right: 5.0, left: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'A Física dos Buracos Negros Supermassivos',
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10.0, bottom: 5, top: 5.0),
                      child: Column(
                        children: [
                          myRow(Icons.access_time, 'Domingo 09:00h - 10:00h'),
                          myRow(Icons.location_on, 'Luanda')
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              onPressed();
                            });
                          },
                          style: myStyle(_isProcessing),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [currentBotton],
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 15.0),
                      padding: const EdgeInsets.only(right: 5.0),
                      child: const Row(
                        children: [
                          Expanded(
                              child: HtmlWidget(
                            '''<div class=\"flex flex-grow flex-col gap-3 max-w-full\">\r\n<div class=\"min-h-[20px] flex flex-col items-start gap-3 whitespace-pre-wrap break-words overflow-x-auto\">\r\n<div class=\"markdown prose w-full break-words dark:prose-invert dark\">\r\n<p>A Astrofísica Relativista dedica-se ao estudo dos fenômenos cósmicos onde a teoria da relatividade geral de Einstein é crucial para entender os processos físicos envolvidos. Esta teoria prevê a existência de buracos negros, ondas gravitacionais e a curvatura do espaço-tempo em presença de massa.</p>\r\n\r\n<p>Os astrofísicos exploram objetos como buracos negros e estrelas de nêutrons para testar as previsões da relatividade em ambientes extremos, tais como fortes campos gravitacionais. A observação de ondas gravitacionais, em particular, abriu uma nova janela para o universo, permitindo estudos acerca da colisão de objetos compactos e dinâmicas gravitacionais intensas.</p>\r\n</div>\r\n</div>\r\n</div>\r\n
                          ''',
                            textStyle: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Coordenador',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            onPressed: () {
                              widget.goTo!(_image);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: _image.isNotEmpty
                                        ? Image.network(
                                            _image,
                                            width: 60,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.solidUser,
                                            size: 50,
                                            color: Colors.grey,
                                          )),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Stephen William Hawking',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Universidade de Cambridge',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: _isVisible
          ? Container(
              color: Colors.grey[800],
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 5.0),
                    margin: const EdgeInsets.only(
                        top: 15.0, bottom: 30.0, left: 5.0),
                    child: Text(
                      getFavorited().toString().contains('true')
                          ? 'Vamos te lembrar dessa atividade.'
                          : 'Não vamos mais te lembrar dessa atividade.',
                      style:
                          const TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

myRow(iconData, label) {
  return Row(
    children: [
      Icon(
        iconData,
        color: Colors.blue[700],
        size: 15.0,
      ),
      const SizedBox(width: 5.0),
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
      )
    ],
  );
}

myStyle(isProcessing) {
  return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: isProcessing ? Colors.grey[400] : Colors.blue[700]);
}
