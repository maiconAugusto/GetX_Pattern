import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  const Rate({Key? key, required this.rate}) : super(key: key);
  final int rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: renderateWidget(rate),
    );
  }
}

Widget renderateWidget(rate) {
  if (rate == 0) {
    return (Row(
      children: const [
        Icon(Icons.star_border),
        Icon(Icons.star_border),
        Icon(Icons.star_border),
        Icon(Icons.star_border),
        Icon(Icons.star_border),
      ],
    ));
  }
  if (rate == 1) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
      ],
    ));
  }
  if (rate == 2) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
      ],
    ));
  }
  if (rate == 3) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
      ],
    ));
  }
  if (rate == 4) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
      ],
    ));
  }
  if (rate == 4) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey[400],
        ),
      ],
    ));
  }
  if (rate == 5) {
    return (Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
        ),
      ],
    ));
  }
  return const SizedBox();
}
