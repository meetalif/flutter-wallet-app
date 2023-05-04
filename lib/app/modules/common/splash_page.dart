import 'package:wallet/app/modules/home/home_page.dart';
import 'package:waveui/waveui.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Get.changeTheme(WaveTheme());
      },
    );
    Future.delayed(
      Duration(seconds: 2),
      () async {
        await Get.to(() => HomePage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WaveScaffold(
      backgroundColor: Get.theme.cardColor,
      body: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 40,
          width: 40,
        ),
      ),
    );
  }
}
