import 'package:flutter/material.dart';
import 'package:flutter_mobile_vkr/images.dart';

class CardProfileWidget extends StatelessWidget {
  final String titlecard;
  final String descriptioncard;
  final ImageProvider<Object> imagecard;
  final VoidCallback onPressed;
  
  const CardProfileWidget({
    Key? key,
    required this.titlecard,
    required this.descriptioncard,
    required this.imagecard,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: 130,
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: <Widget>[
            Image(image: imagecard),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    titlecard,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    descriptioncard,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 1,
            )
          ],
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(0.6),
    //   child: GestureDetector(
    //     onTap: onPressed,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.deepPurpleAccent,
    //         border: Border.all(color: Colors.grey.withOpacity(0.3)),
    //         borderRadius: const BorderRadius.all(Radius.circular(8)),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.black.withOpacity(0.1),
    //             blurRadius: 8,
    //             offset: const Offset(0, 2),
    //           ),
    //         ],
    //       ),
    //       height: 160,
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Text(
    //           titlecard,
    //           style: const TextStyle(
    //             fontSize: 16,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
