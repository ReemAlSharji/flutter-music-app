import 'package:flutter/material.dart';

Widget customPlayist(
    {String? title, String? singer, String? cover, VoidCallback? ontap}) {
  return GestureDetector(
      onTap: () => ontap!(),
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: NetworkImage(cover!)))),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  singer!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          ])));
}
