// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/core/shared/shared_image.dart';
import 'package:task/core/shared/shared_rich_text.dart';
import 'package:task/core/shared/shared_text.dart';
import '../../../../core/helpers/my_application.dart';
import '../../../../core/shared/shared_error.dart';
import '../manager/next_comic_cubit/next_comic_cubit.dart';
import '../manager/next_comic_cubit/next_comic_state.dart';

class NextComicScreen extends StatefulWidget {
  final int num;
  const NextComicScreen({Key? key, required this.num}) : super(key: key);

  @override
  _NextComicScreenState createState() => _NextComicScreenState();
}

class _NextComicScreenState extends State<NextComicScreen> {
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
        BlocProvider.of<NextComicCubit>(context).getNextComic(num: widget.num);
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
        title: const Text("Next Comic"),
      ),
      body: SafeArea(
        child: BlocBuilder<NextComicCubit, NextComicState>(
            builder: (context, state) {
          if (state is NextComicLoading) {
            return SpinKitDoubleBounce(
              color: Colors.red,
              size: size.width * .08,
            );
          } else if (state is NextComicLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.05),
                  SharedImage(image: state.nextComicModel.image.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedRichText(
                      title: state.nextComicModel.title.toString(),
                      day: state.nextComicModel.day.toString(),
                      month: state.nextComicModel.month.toString(),
                      year: state.nextComicModel.year.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedText(alt: state.nextComicModel.alt.toString())
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
