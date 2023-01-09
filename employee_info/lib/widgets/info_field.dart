import 'package:flutter/material.dart';

/// Widget to display field and value in detail screen
///
class InfoFieldValue extends StatelessWidget {
  @required
  final String field;
  @required
  final String value;
  final int maxLines;
  final Function()? onTap;
  final Function()? onLongPress;
  final Color? valueColor;
  final Color? keyColor;
  const InfoFieldValue({
    Key? key,
    required this.field,
    required this.value,
    this.maxLines = 20,
    this.onTap,
    this.valueColor,
    this.onLongPress,
    this.keyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$field :  ',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: keyColor ?? Colors.black,
                  fontSize: 16,
                ),
          ),
          Expanded(
            child: InkWell(
              onLongPress: onLongPress,
              onTap: onTap,
              child: Text(
                value == '' ? 'no data' : value,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:
                          // ignore: prefer_if_null_operators
                          valueColor == null
                              ? (onTap == null && onLongPress == null)
                                  ? value == ''
                                      ? Colors.red
                                      : Colors.black
                                  : Colors.blue
                              : valueColor,
                      fontWeight: onTap == null ? null : FontWeight.bold,
                      fontSize: 18,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
              ),
            ),
          )
        ],
      ),
    );
  }
}
