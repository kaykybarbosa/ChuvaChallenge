import 'package:chuva_dart/app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  bool _favorited = false;

  final String _image =
      'https:\/\/static.galoa.com.br\/file\/Eventmanager-Private\/styles\/large\/s3\/eventmanager_person\/Screenshot%202023-10-10%20at%2013.06.35.png?VersionId=4_z9e083e414507696175f50716_f10473fd681469d07_d20231010_m160744_c003_v0312007_t0020_u01696954064581\u0026itok=XSqu4FiW';

  // const Text('A Física dos Buracos Negros Supermassivos'),
  // const Text('Mesa redonda'),
  // const Text('Domingo 07:00h - 08:00h'),
  // const Text('Sthepen William Hawking'),
  // const Text('Maputo'),
  // // const Text('Astrofísica e Cosmologia'),
  // Text(_favorited
  //         ? 'Remover da sua agenda'
  //         : 'Adicionar à sua agenda'),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        leading: IconButton(
            onPressed: () => context.push('/calendar'),
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Chuva ❤️ Flutter'),
      ),
      body: ProfilePage(image: _image)
    );

    
  }
}

myRow(iconData, label) {
  return Row(
    children: [
      Icon(
        iconData,
        color: Colors.blue,
        size: 15.0,
      ),
      const SizedBox(width: 5.0),
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w400),
      )
    ],
  );
}

// Column(
//         children: [
//           Container(
//             color: Colors.purple,
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             child: const Row(
//               children: [
//                 Text(
//                   'Exoplanetas e Sistemas Planetários',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 5.0),
//             padding:
//                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//             child: const Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Biossinais em Mundos Oceânicos: Europa e Encélado',
//                     style:
//                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 myRow(Icons.access_time, 'Domingo 09:00h - 10:00h'),
//                 myRow(Icons.location_on, 'Luanda')
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _favorited = !_favorited;
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5)),
//                   backgroundColor: Colors.blue),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _favorited
//                       ? const Icon(
//                           Icons.star,
//                           color: Colors.white,
//                         )
//                       : const Icon(
//                           Icons.star_outline,
//                           color: Colors.white,
//                         ),
//                   const SizedBox(width: 5.0),
//                   Text(
//                     _favorited
//                         ? 'Remover da sua agenda'
//                         : 'Adicionar à sua agenda',
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 25.0, left: 10.0),
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 const Row(
//                   children: [
//                     Text(
//                       'Coordenador',
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 ElevatedButton(
//                   onPressed: () {
                   
//                   },
//                   style: ElevatedButton.styleFrom(
//                     elevation: 0,
//                     backgroundColor: Colors.white,
//                     padding: const EdgeInsets.all(0),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
//                   ),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: Image.network(
//                             _imagem,
//                             width: 60,
//                           )),
//                       Container(
//                         margin:
//                             const EdgeInsets.symmetric(horizontal: 10.0),
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Stephen William Hawking',
//                               style: TextStyle(fontSize: 18.0, color: Colors.black),
//                             ),
//                             Text(
//                               'Universidade de Cambridge',
//                               style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Color.fromARGB(255, 156, 156, 156),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
