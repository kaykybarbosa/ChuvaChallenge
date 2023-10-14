// import 'package:flutter/material.dart';

// class trash extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//           const Text(
//             'Programação',
//           ),
//           const Text(
//             'Nov',
//           ),
//           const Text(
//             '2023',
//           ),
//           OutlinedButton(
//             onPressed: () {
//               _changeDate(DateTime(2023, 11, 26));
//             },
//             child: Text(
//               '26',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ),
//           OutlinedButton(
//             onPressed: () {
//               _changeDate(DateTime(2023, 11, 28));
//             },
//             child: Text(
//               '28',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ),
//           if (_currentDate.day == 26)
//             OutlinedButton(
//                 onPressed: () {
//                   setState(() {
//                     _clicked = true;
//                   });
//                 },
//                 child: const Text('Mesa redonda de 07:00 até 08:00')),
//           if (_currentDate.day == 28)
//             OutlinedButton(
//                 onPressed: () {
//                   setState(() {
//                     _clicked = true;
//                   });
//                 },
//                 child: const Text('Palestra de 09:30 até 10:00')),
//           if (_currentDate.day == 26 && _clicked) const Activity(),
//         ],
//     )
//   }

// Stack(
//         children: [
//           Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 50,
//                     child: const Text(
//                       ' Nov 2023',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 2,
//                     ),
//                   ),
//                   const MyBottonDate(number: '26'),
//                   const MyBottonDate(number: '27'),
//                   const MyBottonDate(number: '28'),
//                   const MyBottonDate(number: '29'),
//                   const MyBottonDate(number: '30'),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),


// AnimatedBuilder(
//         animation: Listenable.merge([
//           store.isLoading,
//           store.erro,
//           store.state
//         ]),
//         builder: (context, child) {
//           if(store.isLoading.value){
//              return const Center(child: CircularProgressIndicator());
//           } 

//           if (store.erro.value.isNotEmpty){
//             return Center(
//               child: Text(
//                 store.erro.value,
//                 style: const TextStyle(
//                   color: Colors.black54,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             );
//           } else{
//             return const Center(child: Text("chegou"),);
//           }
//         }
//       )

//card
// Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.0),
//                   color: Colors.white
//                 ),
//                 margin: const EdgeInsets.only(
//                     left: 10.0, top: 15.0, bottom: 5.0, right: 10.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Colors.pink,
//                       ),
//                       child: const SizedBox(
//                         height: 90,
//                         width: 5.0,
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: Container(
//                         padding: EdgeInsets.all(5.0),
//                         decoration: BoxDecoration(color: Colors.white, 
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                         child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Mesa redonda de 07:00 até 08:00'),
//                             Text(
//                               'A Física dos Buracos Negros Supermassivos',
//                               style: TextStyle(fontSize: 18.0),
//                               maxLines: 2,
//                             ),
//                             Text(
//                               'Stephen William Hawkings',
//                               style: TextStyle(fontSize: 15.0),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),



// }