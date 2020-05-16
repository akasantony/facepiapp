import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:video_player/video_player.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}


class _WelcomePageState extends State<WelcomePage> {

  VideoPlayerController _driverVideoPlayerController;
  VideoPlayerController _generatedVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _driverVideoPlayerController = VideoPlayerController.asset('assets/media/welcome/00.mp4');
    _generatedVideoPlayerController = VideoPlayerController.asset('assets/media/welcome/generated.mp4');

    _driverVideoPlayerController.addListener(() {
      setState(() {});
    });
    _driverVideoPlayerController.setLooping(true);
    _driverVideoPlayerController.initialize().then((_) => setState(() {}));
    _driverVideoPlayerController.play();

    _generatedVideoPlayerController.addListener(() {
      setState(() {});
    });
    _generatedVideoPlayerController.setLooping(true);
    _generatedVideoPlayerController.initialize().then((_) => setState(() {}));
    _generatedVideoPlayerController.play();
  }

  @override
  void dispose() {
    _driverVideoPlayerController.dispose();
    _generatedVideoPlayerController.dispose();
    super.dispose();
  }


  Widget _bodyBuilder(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(241, 39, 17, 1),
                  Color.fromRGBO(245, 175, 25, 1)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(60),
              child: Text(
                "FacePi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset("assets/media/welcome/got-05.png"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: AspectRatio(
                                aspectRatio: _driverVideoPlayerController.value.aspectRatio,
                              child: VideoPlayer(_driverVideoPlayerController),
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: AspectRatio(
                            aspectRatio: _generatedVideoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_generatedVideoPlayerController),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 70,
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
//              color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      hintText: "Phone Number",
                      textStyle: TextStyle(color: Colors.white),
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ignoreBlank: false,
                      autoValidate: false,
//              textFieldController: controller,
                      inputBorder: InputBorder.none,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: (){
                        Navigator.pushNamed(context, '/verify');
                      },
                      child: Text("Next", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20, fontWeight: FontWeight.bold),),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _bodyBuilder(context),
      ),
    );
  }
}
