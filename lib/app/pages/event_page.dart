import 'dart:async';

import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/shared/utils.dart';
import 'package:chuva_dart/app/pages/widgets/my_card_people.dart';
import 'package:chuva_dart/app/pages/widgets/my_current_botton.dart';
import 'package:chuva_dart/main.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class EventPage extends StatefulWidget {
  EventPage({required this.event, super.key});

  Event event;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool? _favorited;
  bool _isVisible = false;
  bool _isProcessing = false;
  Widget currentBotton = const MyCurrentBotton();

  @override
  void initState() {
    super.initState();
    setState(() {
      currentBotton = MyCurrentBotton(favorited: getFavorited(widget.event.id));
    });
  }

  void _showFooter() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
          _isProcessing = false;
          currentBotton = MyCurrentBotton(favorited: getFavorited(widget.event.id));
        });
      }
    });
  }

  onPressed() {
    var eventId = widget.event.id;
    _favorited = !getFavorited(eventId).toString().contains('true');
    setFavorited(eventId ,_favorited);
    _isVisible = true;
    _isProcessing = true;
    currentBotton = MyCurrentBotton(
        favorited: _favorited, isProcessing: true); // is fovorited
    _showFooter();
  }

  void setFavorited(eventId , isFavorited) {
    appPreferences.setBool('$eventId', isFavorited);
  }

  bool? getFavorited(eventId) {
    return appPreferences.getBool('$eventId');
  }

  @override
  Widget build(BuildContext context) {
    var event = widget.event;
    var dateStart = widget.event.start?.toLocal();
    var dateEnd = widget.event.end?.toLocal();

    getParent(){
      var listParent;
      if (event.parent.toString().isNotEmpty){
        var events = getIt<EventController>().events;
        events.value.forEach((element) {
          if (element.id == event.parent!){
            listParent.add(element);
          }
         });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      color:
                          Color(Utils.colorFromHex(event.category?.color ?? '')),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            event.category?.title?.ptBr ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 5.0, right: 5.0, left: 5.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              event.title?.ptBr ?? '',
                              style: const TextStyle(
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
                          myRow(
                            Icons.access_time,
                            '${Utils.getDayWeek(dateStart?.weekday ?? 0)} ${Utils.formatHour(dateStart)}h - ${Utils.formatHour(dateEnd)}h',
                          ),
                          myRow(Icons.location_on,
                              event.locations?.first?.title?.ptBr ?? '')
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
                          vertical: 40, horizontal: 15.0),
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: HtmlWidget(
                            event.description?.ptBr ?? '',
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                event.people?.firstOrNull?.role?.label
                                        ?.ptBr ??
                                    '',
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Column(
                            children: event.people?.map((people) {
                                  return Column(
                                    children: [
                                      MyCardPeople(people: people!),
                                      const SizedBox(height:20), // Adicione um SizedBox entre os MyCardPeople
                                    ],
                                  );
                                }).toList() ?? [],
                          )
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
                      getFavorited(widget.event.id).toString().contains('true')
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
