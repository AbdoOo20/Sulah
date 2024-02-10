import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateWidget extends StatefulWidget {
  final num? initialRating;
  final ValueChanged<double>? onRatingUpdate;
  final bool ignoreGestures;
  final double iconSize;
  final double? itemSize;

  const RateWidget({Key? key,this.initialRating,this.onRatingUpdate,this.ignoreGestures = true,this.iconSize = 15, this.itemSize}) : super(key: key);

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  @override
  Widget build(BuildContext context) {

    return RatingBar.builder(
      ignoreGestures: widget.ignoreGestures,
      //  itemSizeHeight: 20.0,
     // itemSizeWidth: 20.0,
     itemSize: widget.itemSize??20.0,
      initialRating:(widget.initialRating?? 0).toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
      itemBuilder: (context, _) => Icon(
        Icons.star_rounded,
        color: Colors.amber,
        size: widget.iconSize,
      ),
      onRatingUpdate:widget.onRatingUpdate??(rate){},
      // onRatingUpdate: (rating) {
      //   print(rating);
     // },
    );

  }
}
