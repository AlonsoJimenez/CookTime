import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'objects.dart';

//get methods
Future<http.Response> newsfeed(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/newsFeed",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> profile(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/profile",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> notifications(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/notifications",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> companies(String user, String password) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/companies",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
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

Future<http.Response> profileSearch(
    String user, String password, String search) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/profiles/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> enterpriseSearch(
    String user, String password, String search) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/enterprise/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

Future<http.Response> menuSearch(String user, String password, String search) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.get(
    "http://10.0.2.2:9080/CookTimeServer/rest/user/menu/$search",
    // Send authorization headers to the backend.
    headers: <String, String>{"authorization": author},
  );
}

//post methods
Future<http.Response> postRecipe(String user, String password, Recipe recipe) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/recipe",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
      body: jsonEncode(recipe));
}

Future<http.Response> postCompany(
    String user, String password, Enterprise company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/company",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
      body: jsonEncode(company));
}

Future<http.Response> postUser(User user) {
  String author = "Basic " + base64Encode(utf8.encode("authNew:newUser"));
  return http.post("http://10.0.2.2:9080/CookTimeServer/rest/user/newUser",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
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
      headers: <String, String>{"authorization": author},
      body: jsonEncode(recipe));
}

//put methods

Future<http.Response> editCompany(
    String user, String password, String name, Enterprise company) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/company/edit/$name",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
      body: jsonEncode(company));
}

Future<http.Response> editRecipe(
    String user, String password, String name, Recipe recipe) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/recipe/edit/$name",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
      body: jsonEncode(recipe));
}

Future<http.Response> updateUser(String user, String password, User updater) {
  String author = "Basic " + base64Encode(utf8.encode("$user:$password"));
  return http.put("http://10.0.2.2:9080/CookTimeServer/rest/user/update",
      // Send authorization headers to the backend.
      headers: <String, String>{"authorization": author},
      body: jsonEncode(updater));
}
