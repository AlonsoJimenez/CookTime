import 'dart:convert';
import 'dart:io';
import 'package:cook_time/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'objects.dart';

String userForEveryone;
String passwordForEveryone;

User mainUserProfile;

//get methods

///Get para extraer la información del Newsfeed.
Future<List<Recipe>> newsfeed(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response =
      await http.get("http://10.0.2.2:9080/CookTimeServer/rest/user/newsFeed",
          // Send authorization headers to the backend.
          headers: <String, String>{"authorization": author});
  if (response.statusCode == 200) {
    var jsonRecipes = json.decode(response.body.toString()) as List;
    return jsonRecipes != null
        ? jsonRecipes
            .map((recipesValues) => Recipe.fromJson(recipesValues))
            .toList()
        : new List<Recipe>();
  } else {
    return null;
  }
}

///Get para extraer la información de la empresa propia.
Future<List<EnterpriseRecipe>> ownCompany(
    String user, String password, String name) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/company/menu/$name",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    var listing = json.decode(response.body.toString()) as List;
    return listing != null
        ? listing.map((value) => EnterpriseRecipe.fromJson(value)).toList()
        : null;
  } else {
    throw Exception("Error loading");
  }
}

///Get para extraer la información del usuario (propio).
Future<List<Recipe>> ownUser(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/own",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    var listing = json.decode(response.body.toString()) as List;
    return listing != null
        ? listing.map((value) => Recipe.fromJson(value)).toList()
        : new List<Recipe>();
  } else {
    throw Exception("Error loading");
  }
}

///Get para extraer el perfil del usuario.
Future<User> profile(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/profile",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body.toString()));
  } else {
    throw Exception("Profile loading error");
  }
}

///Get para extraer las notificaciones según el usuario.
Future<List<String>> notifications(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/notifications",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    var listing = json.decode(response.body) as List;
    return listing != null ? List.from(listing) : null;
  } else {
    print("lmnno");
    throw Exception("Error loading notifications");
  }
}

///Get para extraer las compañías del usuario.
Future<List<Enterprise>> companies(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/companies",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    var listRet = json.decode(response.body.toString()) as List;
    return listRet != null
        ? listRet
            .map((variableJson) => Enterprise.fromJson(variableJson))
            .toList()
        : null;
  } else {
    throw Exception("Error loading notifications");
  }
}

///Get para extraer las recetas por estrellas.
Future<List<Recipe>> byStars(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response =
      await http.get("http://10.0.2.2:9080/CookTimeServer/rest/user/stars",
          // Send authorization headers to the backend.
          headers: <String, String>{"authorization": author});
  if (response.statusCode == 200) {
    var jsonRecipes = json.decode(response.body.toString()) as List;
    return jsonRecipes != null
        ? jsonRecipes
            .map((recipesValues) => Recipe.fromJson(recipesValues))
            .toList()
        : new List<Recipe>();
  } else {
    return null;
  }
}

///Get para extraer las recetas por fecha.
Future<List<Recipe>> byDate(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response =
      await http.get("http://10.0.2.2:9080/CookTimeServer/rest/user/date",
          // Send authorization headers to the backend.
          headers: <String, String>{"authorization": author});
  if (response.statusCode == 200) {
    var jsonRecipes = json.decode(response.body.toString()) as List;
    return jsonRecipes != null
        ? jsonRecipes
            .map((recipesValues) => Recipe.fromJson(recipesValues))
            .toList()
        : new List<Recipe>();
  } else {
    return null;
  }
}

///Get para extraer las recetas por dificultad.
Future<List<Recipe>> byDifficulty(String user, String password) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response =
      await http.get("http://10.0.2.2:9080/CookTimeServer/rest/user/difficulty",
          // Send authorization headers to the backend.
          headers: <String, String>{"authorization": author});
  if (response.statusCode == 200) {
    var jsonRecipes = json.decode(response.body.toString()) as List;
    return jsonRecipes != null
        ? jsonRecipes
            .map((recipesValues) => Recipe.fromJson(recipesValues))
            .toList()
        : new List<Recipe>();
  } else {
    return null;
  }
}

///Get para buscar usuario.
Future<User> profileSearch(String user, String password, String search) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/profiles/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    return response.body.toString() != ""
        ? User.fromJson(json.decode(response.body))
        : null;
  } else {
    throw Exception("Load to search for user");
  }
}

///Get para buscar empresa.
Future<Enterprise> enterpriseSearch(
    String user, String password, String search) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/enterprise/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    return response.body.toString() != ""
        ? Enterprise.fromJson(json.decode(response.body))
        : null;
  } else {
    throw Exception("Load to search for user");
  }
}

///Get para buscar menu.
Future<Recipe> menuSearch(String user, String password, String search) async {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  final response = await http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/menu/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
  if (response.statusCode == 200) {
    if (response.body.toString() != "") {
      if (json.decode(response.body)["isPublic"] != null) {
        return EnterpriseRecipe.fromJson(json.decode(response.body));
      } else {
        return Recipe.fromJson(json.decode(response.body));
      }
    } else {
      return null;
    }
  } else {
    throw Exception("Load to search for user");
  }
}

//post methods

///Post para añadir nueva receta.
Future<http.Response> postRecipe(String user, String password, Recipe recipe) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/recipe",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(recipe));
}

///Post para añadir nueva compañía.
Future<http.Response> postCompany(
    String user, String password, Enterprise company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/company",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(company));
}

///Post para añadir nuevo usuario.
Future<http.Response> postUser(User user) {
  String author = "Basic " + base64Encode(utf8.encode("authNew:newUser"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/newUser",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(user));
}

///Post para seguir usuario.
Future<http.Response> followUser(
    String user, String password, String toFollow) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/follow/$toFollow",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

///Post para seguir a una compañía..
Future<http.Response> followCompany(
    String user, String password, String company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/followCompany?company=$company",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

///Post para añadir un nuevo comentario.
Future<http.Response> newComment(
    String user, String password, String recipe, String comment) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/comment/$recipe?comment=$comment",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

///Post para añadir estrellas a una receta.
Future<http.Response> newRate(
    String user, String password, String recipe, double star) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/stars/$recipe?rate=$star",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

///Post para añadir nuevo miembro a una empresa.
Future<http.Response> companyMember(
    String user, String password, String name, String userToFollow) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/company/member/$name?username=$userToFollow",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

///Post para añadir nueva receta a la empresa.
Future<http.Response> companyRecipe(
    String user, String password, String name, EnterpriseRecipe recipe) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
      "http://10.0.2.2:9080/CookTimeServer/rest/company/recipe/$name",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(recipe));
}

//put methods
///Put para modificar la compañía.
Future<http.Response> editCompany(
    String user, String password, String name, Enterprise company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/company/edit/$name",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(company));
}

///Put para modificar la receta.
Future<http.Response> editRecipe(
    String user, String password, String name, Recipe recipe) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/recipe/edit/$name",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(recipe));
}

///Put para modificar el usuario.
Future<http.Response> updateUser(String user, String password, User updater) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/user/update",
      // Send authorization headers to the backend.
      headers: <String, String>{
        "authorization": author,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(updater));
}

///Put para eliminar receta.
Future<http.Response> deleteRecipe(
    String user, String password, String delete) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.delete(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/delete?=$delete",
    // Send authorization headers to the backend.
    headers: <String, String>{
      "authorization": author,
      'Content-Type': 'application/json'
    },
  );
}
