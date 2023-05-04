import 'package:waveui/waveui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return WaveScaffold(
      appBar: WaveAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(FluentIcons.navigation_24_regular),
        ),
        title: "Wallet",
        actions: [
          SizedBox(
            width: 30,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://media.licdn.com/dms/image/D5603AQEi5wMNUoo00w/profile-displayphoto-shrink_800_800/0/1681638157623?e=2147483647&v=beta&t=t6pKhFiuy0X6jcIQjG0KnLF6wl4jbiK3lc_L2yOs7oY",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _heroCard(balance: "8,458.00"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _menuItem(
                    color: Colors.blue,
                    icon: FluentIcons.send_28_filled,
                    title: "Send",
                  ),
                  SizedBox(width: 12),
                  _menuItem(
                    color: Colors.red,
                    icon: FluentIcons.calendar_work_week_28_filled,
                    title: "Activities",
                  ),
                  SizedBox(width: 12),
                  _menuItem(
                    color: Colors.cyan,
                    icon: FluentIcons.chart_multiple_24_filled,
                    title: "Stats",
                  ),
                  SizedBox(width: 12),
                  _menuItem(
                    color: Colors.purple,
                    icon: FluentIcons.wallet_28_filled,
                    title: "Payment",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _transactions(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _heroCard({required String balance}) {
    return GestureDetector(
      onTap: () {
        isExpanded = !isExpanded;
        setState(() {});
      },
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/gradient-smooth-blue-lines-background_23-2148964962.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(WaveConstants.radius)),
          child: !isExpanded
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$$balance",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Total balance",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Md Waliul Islam Alif",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Flutter Platinum Card",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "2134 **** **** 0505",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "\$${balance}",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Flutter",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
    );
  }

  Widget _menuItem({
    Color color = Colors.red,
    String title = '',
    IconData icon = FluentIcons.wallet_28_filled,
  }) {
    return Expanded(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: WaveContainer(
              color: color.withOpacity(0.3),
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text("${title}"),
        ],
      ),
    );
  }

  Widget _transactions() {
    return WaveCard(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Transactions",
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text("View all"),
              ),
            ],
          ),
          ListTile(
            title: Text("Electric bill"),
            subtitle: Text("Today at 0:40"),
            trailing: Text("-\$40"),
          ),
          ListTile(
            title: Text("Salary"),
            subtitle: Text("Yesterday at 12:20"),
            trailing: Text("+\$11,250"),
          ),
          ListTile(
            title: Text("New pc build"),
            subtitle: Text("12 Aug 2023 at 04:12"),
            trailing: Text("-\$4,490"),
          ),
          ListTile(
            title: Text("Water bill"),
            subtitle: Text("10 Aug 2023 at 0:40"),
            trailing: Text("-\$83.43"),
          )
        ],
      ),
    );
  }
}
