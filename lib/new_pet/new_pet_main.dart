import 'package:animal_vax/global_utilities/app_navigation_bar.dart';
import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:animal_vax/new_pet/bloc/new_pet_bloc.dart';
import 'package:animal_vax/new_pet/utilities/new_pet_widget.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPetMain extends StatefulWidget {
  const NewPetMain({super.key, required this.authToken, required this.user});

  final PostLogin authToken;
  final User user;


  @override
  State<NewPetMain> createState() => _NewPetMainState();
}

class _NewPetMainState extends State<NewPetMain> {
  final NewPetBloc newPetBloc = NewPetBloc();
  final TextEditingController petNameCont = TextEditingController();
  final TextEditingController breedCont = TextEditingController();
  final TextEditingController petDobCont = TextEditingController();
  final TextEditingController petAgeCont = TextEditingController();
  final TextEditingController microchipCont = TextEditingController();
  final TextEditingController colorCont = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    newPetBloc.add(NewPetInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPetBloc, NewPetState>(
      bloc: newPetBloc,
      listenWhen: (previous, current) => current is NewPetActionState,
      buildWhen: (previous, current) => current is !NewPetActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is NewPetNavigateToDashboardActionState){
          Navigator.popAndPushNamed(context, RouteManager.dashboard, arguments: {'authToken': state.authToken, 'userInfo': state.user});
        }
        else if(state is NewPetAddedActionState){
          customSnackbar(context, "Pet Added");
          petNameCont.text = "";
          petAgeCont.text = "";
          petDobCont.text = "";
          breedCont.text = "";
          colorCont.text = "";
          microchipCont.text = "";
          setState(() {});
        }
        else if(state is NewPetAddedErrorActionState){
          customSnackbar(context, "Couldn't add pet");
          petNameCont.text = "";
          petAgeCont.text = "";
          petDobCont.text = "";
          breedCont.text = "";
          colorCont.text = "";
          microchipCont.text = "";
          setState(() {});
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case NewPetInitialState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Add a new Pet", style: GoogleFonts.poppins(),),
              ),
              body: NewPetWidget(user: widget.user, newPetBloc: newPetBloc, authToken: widget.authToken, petAgeCont: petAgeCont, petNameCont: petNameCont, petDobCont: petDobCont, breedCont: breedCont, colorCont: colorCont, microchipCont: microchipCont, isLoading: false,),
              bottomNavigationBar: AppNavigationBar(currentPageIndex: 1, newPetBloc: newPetBloc, user: widget.user, authToken: widget.authToken),
            );
          case NewPetLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Add a new Pet", style: GoogleFonts.poppins(),),
              ),
              body: NewPetWidget(user: widget.user, newPetBloc: newPetBloc, authToken: widget.authToken, petAgeCont: petAgeCont, petNameCont: petNameCont, petDobCont: petDobCont, breedCont: breedCont, colorCont: colorCont, microchipCont: microchipCont, isLoading: true,),
              bottomNavigationBar: AppNavigationBar(currentPageIndex: 1, newPetBloc: newPetBloc, user: widget.user, authToken: widget.authToken),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
