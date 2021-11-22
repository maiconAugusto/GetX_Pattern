import 'package:flutter/material.dart';
import 'package:get_x/app/core/images.dart';
import 'package:progressive_image/progressive_image.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: ProgressiveImage(
                thumbnail: const NetworkImage(Images.profile),
                image: const NetworkImage(
                  Images.profile,
                ),
                height: 100,
                fit: BoxFit.cover,
                width: 100,
                placeholder: null,
              )),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Maicon Augusto Carvalho de Freitas',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Aux. de saúde',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Colors.yellow, size: 18),
                        Icon(Icons.star_border, size: 18),
                        Icon(Icons.star_border, size: 18),
                        Icon(Icons.star_border, size: 18),
                        Icon(Icons.star_border, size: 18),
                      ],
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text('Ver perfil'))
                  ],
                )))
      ],
    );
  }
}
