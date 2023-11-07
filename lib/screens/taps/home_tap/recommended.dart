import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class Recomended extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height*0.25,width: double.infinity,color: AppTheme.darkGrey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Recommended',style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
