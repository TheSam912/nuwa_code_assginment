import 'package:nuwa/constants/strings.dart';
import 'package:nuwa/widgets/status_widget.dart';
import '../widgets/dashboard_widget.dart';
import '../widgets/footer_widget.dart';
import 'package:flutter/material.dart';
import '../constants/assets.dart';
import '../widgets/appbar_widget.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: statusWidget(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppbarWidget(),
              DashboardWidget(
                  imageList: dashboardImages,
                  dialogText: adminDashboardPageTitle,
                  buttonText: btnDataCollection),
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
