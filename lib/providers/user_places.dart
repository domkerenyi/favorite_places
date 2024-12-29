import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// here we want to add class that allows manipulation

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier()
      : super(
            const []); // initialization: we reach out to the super state and set it to an empty list.

  // we have to create a new state. We can not edit the old state directly!!

  void addPlace(String title, File image) {
    final newPlace =
        Place(title: title, image: image); // here we create the class and we update the state
    state = [newPlace, ...state]; // we add the old state elements (empty) + the new state
  }
}

// here we set up the providers:

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) =>
    UserPlacesNotifier()); // here we return a new instance of the UserPlacesNotifier() class
