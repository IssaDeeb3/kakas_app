part of shared_widgets;

class LoadingWidget extends StatelessWidget {
  final bool isLinear;

  const LoadingWidget({
    super.key,
    this.isLinear = false,
  });

  @override
  Widget build(BuildContext context) {
    // if (isLinear) {
    //   return const LinearProgressIndicator();
    // }

    return Center(
        child: LoadingAnimationWidget.waveDots(color: Colors.black, size: 50));
  }
}
