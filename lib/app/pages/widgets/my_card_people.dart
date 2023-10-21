import 'package:cached_network_image/cached_network_image.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyCardPeople extends StatefulWidget {
  const MyCardPeople({super.key, required this.people});

  final People people;

  @override
  State<MyCardPeople> createState() => _MyCardPeopleState();
}

class _MyCardPeopleState extends State<MyCardPeople> {

  @override
  Widget build(BuildContext context) {
    var people = widget.people;
    var image = widget.people.picture ?? '';

    return ElevatedButton(
      onPressed: () {
        context.push('/profile/${people.id}');
      },
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),),),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.grey[100],
                child: image.isNotEmpty
                    ? Image(
                        image: CachedNetworkImageProvider(
                          image,
                          maxHeight: 165,
                          maxWidth: 165
                        ),
                        width: 60,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null){
                            return child;
                          }

                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey[300],
                            ),
                          );
                        },
                      )
                    : const Icon(
                        FontAwesomeIcons.solidUser,
                        size: 60,
                        color: Colors.grey,
                      ),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  people.name ?? '',
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                Text(
                  people.institution ?? '',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
