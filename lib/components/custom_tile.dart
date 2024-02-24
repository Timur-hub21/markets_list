import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTile extends StatefulWidget {
  final String title;
  final String price;
  final String svgIcon;
  final String percent;
  final bool isPostitive;
  final bool isFavorite;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.title,
    required this.price,
    required this.svgIcon,
    required this.percent,
    required this.isPostitive,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              widget.svgIcon,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(
                widget.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: widget.isPostitive ? Colors.green : Colors.red,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    widget.isPostitive ? '+${widget.percent}%' : '-${widget.percent}%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: widget.isPostitive ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.onTap,
              child: widget.isFavorite
                  ? const Icon(
                      Icons.star,
                      size: 35,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.star_border,
                      size: 35,
                      color: Colors.grey,
                    ),
            )
          ],
        ),
      );
}
