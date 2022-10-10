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
import '../manager/previous_comic_cubit/previous_comic_cubit.dart';
import '../manager/previous_comic_cubit/previous_comic_state.dart';

class PreviousComicScreen extends StatefulWidget {
  final int num;
  const PreviousComicScreen({Key? key, required this.num}) : super(key: key);

  @override
  _PreviousComicScreenState createState() => _PreviousComicScreenState();
}

class _PreviousComicScreenState extends State<PreviousComicScreen> {
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
        BlocProvider.of<PreviousComicCubit>(context)
            .getPreviousComic(num: widget.num);
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
        title: const Text("Previous Comic"),
      ),
      body: SafeArea(
        child: BlocBuilder<PreviousComicCubit, PreviousComicState>(
            builder: (context, state) {
          if (state is PreviousComicLoading) {
            return SpinKitDoubleBounce(
              color: Colors.red,
              size: size.width * .08,
            );
          } else if (state is PreviousComicLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.05),
                  SharedImage(image: state.previousComicModel.image.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedRichText(
                      title: state.previousComicModel.title.toString(),
                      day: state.previousComicModel.day.toString(),
                      month: state.previousComicModel.month.toString(),
                      year: state.previousComicModel.year.toString()),
                  SizedBox(height: size.height * 0.02),
                  SharedText(alt: state.previousComicModel.alt.toString())
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
