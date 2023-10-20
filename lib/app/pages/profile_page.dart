import 'package:chuva_dart/app/data/models/event.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:chuva_dart/app/pages/controller/event_controller.dart';
import 'package:chuva_dart/app/pages/shared/utils.dart';
import 'package:chuva_dart/app/pages/widgets/my_card.dart';
import 'package:chuva_dart/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({required this.people, super.key});

  People people;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Event> myEvents = [];

  List<Event> getMyEvents(id) {
    return getIt<EventController>().getEventByPeopleId(id);
  }

  @override
  void initState() {
    super.initState();
    myEvents = getMyEvents(widget.people.id);
  }

  @override
  Widget build(BuildContext context) {
    var people = widget.people;
    var image = widget.people.picture ?? '';

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        // leading: IconButton(
        //     onPressed: () {

        //     },
        //     icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Chuva ❤️ Flutter'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: image.isNotEmpty
                              ? Image.network(image, width: 100)
                              : const Icon(
                                  FontAwesomeIcons.solidUser,
                                  size: 60,
                                  color: Colors.grey,
                                )),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                people.name ?? '',
                                style: const TextStyle(
                                    fontSize: 23.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                people.institution ?? '',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
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
                      Text(
                        'Bio',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                  child: HtmlWidget(
                    '''
                          <div style="text-align: justify;">
                            ${people.bio?.ptBr ?? ''}
                          </div>
                        ''',
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [myText('Atividades')],
                        )),
                    Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        padding: const EdgeInsets.only(left: 10.0),
                        child: myText(
                            '${Utils.getDayWeek(7).substring(0, 3).toLowerCase()}., ${Utils.formatDate(myEvents.first.start)}')),
                  ],
                ),
                Column(
                    children: myEvents.map((e) {
                  return Column(
                    children: [MyCard(event: e)],
                  );
                }).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

myText(label) {
  return Text(label,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500));
}
