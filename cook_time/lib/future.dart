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

Future<http.Response> byStars(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/stars",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> byDate(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/date",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> byDifficulty(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/difficulty",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

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

Future<http.Response> followUser(
    String user, String password, String toFollow) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/follow/$toFollow",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> followCompany(
    String user, String password, String company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/followCompany?company=$company",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> newComment(
    String user, String password, String recipe, String comment) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/comment/$recipe?comment=$comment",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> newRate(
    String user, String password, String recipe, int star) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/stars/$recipe?rate=$star",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> companyMember(
    String user, String password, String name, String userToFollow) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post(
    "http://10.0.2.2:9080/CookTimeServer/rest/company/member/$name?username=$userToFollow",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

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
