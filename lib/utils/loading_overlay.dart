import 'package:flutter/material.dart';
import 'package:judicial_exams/utils/styles.dart';
class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppStyle().button,),
      );
    }
    return child;
  }
}
