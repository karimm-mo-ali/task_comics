// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/core/shared/shared_image.dart';
import 'package:task/core/shared/shared_rich_text.dart';
import 'package:task/core/shared/shared_text.dart';
import 'package:task/features/CurrentComic/presentation/manager/current_comic_cubit/current_comic_cubit.dart';
import '../../../../core/config/routes.dart';
import '../../../../core/helpers/my_application.dart';
import '../../../../core/shared/shared_button.dart';
import '../../../../core/shared/shared_error.dart';
import '../manager/current_comic_cubit/current_comic_state.dart';

class CurrentComicScreen extends StatefulWidget {
  const CurrentComicScreen({Key? key}) : super(key: key);

  @override
  _CurrentComicScreenState createState() => _CurrentComicScreenState();
}

class _CurrentComicScreenState extends State<CurrentComicScreen> {
  @override
  void initState() {
    // TODO: implement initState
    MyApplication.checkConnection().then((value) {
      if (!value) {
        Fluttertoast.showToast(
            msg: 'No Internet',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        BlocProvider.of<CurrentComicCubit>(context).getCurrentComic();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,

        title: const Text("Current Comic"),
      ),
      body: SafeArea(
        child: BlocBuilder<CurrentComicCubit, CurrentComicState>(
            builder: (context, state) {
          if (state is CurrentComicLoading) {
            return SpinKitDoubleBounce(
              color: Colors.red,
              size: size.width * .08,
            );
          } else if (state is CurrentComicLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.05),
                  SharedImage(image: state.currentComicModel.image.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedRichText(
                      title: state.currentComicModel.title.toString(),
                      day: state.currentComicModel.day.toString(),
                      month: state.currentComicModel.month.toString(),
                      year: state.currentComicModel.year.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedText(alt: state.currentComicModel.alt.toString()),
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SharedButton(
                          icon: Icons.arrow_back_ios,
                          onTap: () => Navigator.pushNamed(
                              context, previousComicScreen,
                              arguments: (state.currentComicModel.num)! - 1)),
                      SizedBox(width: size.width * 0.05),
                      SharedButton(
                          icon: Icons.arrow_forward_ios,
                          onTap: () => Navigator.pushNamed(
                              context, nextComicScreen,
                              arguments: (state.currentComicModel.num)! + 1)),
                    ],
                  )
                ],
              ),
            );
          } else {
            return const SharedError();
          }
        }),
      ),
    );
  }
}
