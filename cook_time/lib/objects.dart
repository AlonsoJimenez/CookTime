import 'dart:convert';

class User {
  bool isChef;
  String imageBytes;
  String profileDescription;
  int age;
  String name;
  String lastname;
  String email;
  String password;
  List<String> myMenu;
  List<String> followers;
  List<String> following;
  List<Enterprise> companies;
  List<String> followingComp;

  User(
      {this.isChef,
      this.age,
      this.email,
      this.lastname,
      this.name,
      this.password,
      this.profileDescription,
      this.imageBytes,
      this.companies,
      this.followers,
      this.following,
      this.followingComp,
      this.myMenu});

  factory User.fromJson(Map<String, dynamic> json) {
    var jsonCompanies = json["companies"] as List;
    var jsonFollowers = json["followers"] as List;
    var jsonFollowing = json["following"] as List;
    var jsonMenu = json["myMenu"] as List;
    var jsonComp = json["followingComp"] as List;
    return User(
        isChef: json["isChef"] != null ? json["isChef"] : null,
        age: json["age"] != null ? json["age"] : null,
        email: json["email"] != null ? json["email"] : null,
        lastname: json["lastName"] != null ? json["lastName"] : null,
        name: json["name"] != null ? json["name"] : null,
        password: json["password"] != null ? json["password"] : null,
        profileDescription: json["profileDescription"] != null
            ? json["profileDescription"]
            : null,
        imageBytes: json["imageBytes"] != null ? json["imageBytes"] : null,
        followers: jsonFollowers != null ? List.from(jsonFollowers) : null,
        following: jsonFollowing != null ? List.from(jsonFollowing) : null,
        myMenu: jsonMenu != null ? List.from(jsonMenu) : null,
        followingComp: jsonComp != null ? List.from(jsonComp) : null,
        companies: jsonCompanies != null
            ? jsonCompanies
                .map((variableJson) => Enterprise.fromJson(variableJson))
                .toList()
            : null);
  }

  Map<String, dynamic> toJson() => {
        "isChef": isChef,
        "age": age,
        "email": email,
        "lastname": lastname,
        "name": name,
        "password": password,
        "profileDescription": profileDescription,
        "imageBytes": imageBytes,
        "companies": companies,
        "followers": followers,
        "following": following,
        "followingComp": followingComp,
        "myMenu": myMenu
      };
}

class Enterprise {
  String enterpriseName;
  String contactInfo;
  String operationHours;
  List<EnterpriseRecipe> recipes;
  List<String> members;
  List<String> followers;

  Enterprise({
    this.contactInfo,
    this.enterpriseName,
    this.followers,
    this.members,
    this.operationHours,
    this.recipes,
  });

  factory Enterprise.fromJson(Map<String, dynamic> json) {
    var jsonRecipes = jsonDecode(json["recipes"]) as List;
    return Enterprise(
        contactInfo: json["contactInfo"],
        enterpriseName: json["enterpriseName"],
        followers: json["followers"] as List,
        members: json["members"] as List,
        operationHours: json["operationHours"],
        recipes: jsonRecipes
            .map((recipesVar) => EnterpriseRecipe.fromJson(recipesVar))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        "enterpriseName": enterpriseName,
        "contactInfo": contactInfo,
        "operationHours": operationHours,
        "recipes": recipes,
        "members": members,
        "followers": followers
      };
}

class Recipe {
  String author;
  String imageBytes;
  int stars;
  String dishName;
  int portionsSize;
  int preparationMinutes;
  String dishType;
  List<String> tags;
  List<String> ingridients;
  List<String> steps;
  List<String> comments;
  int difficulty;

  Recipe(
      {this.author,
      this.comments,
      this.difficulty,
      this.dishName,
      this.dishType,
      this.imageBytes,
      this.ingridients,
      this.portionsSize,
      this.preparationMinutes,
      this.stars,
      this.steps,
      this.tags});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        author: json["author"],
        comments: json["comments"] as List,
        difficulty: json["difficulty"],
        dishName: json["dishName"],
        dishType: json["dishType"],
        imageBytes: json["imageBytes"],
        ingridients: json["ingridients"] as List,
        portionsSize: json["portionSize"],
        preparationMinutes: json["preparationMinutes"],
        stars: json["stars"],
        steps: json["steps"] as List,
        tags: json["tags"] as List);
  }
  Map<String, dynamic> toJson() => {
        "author": author,
        "comments": comments,
        "difficulty": difficulty,
        "dishName": dishName,
        "dishType": dishType,
        "imageBytes": imageBytes,
        "ingridients": ingridients,
        "portionSize": portionsSize,
        "preparationMinutes": preparationMinutes,
        "stars": stars,
        "steps": steps,
        "tags": tags
      };
}

class EnterpriseRecipe extends Recipe {
  String author;
  String imageBytes;
  int stars;
  String dishName;
  int portionsSize;
  int preparationMinutes;
  String dishType;
  List<String> tags;
  List<String> ingridients;
  List<String> steps;
  List<String> comments;
  int difficulty;
  bool isPublic;
  int price;

  EnterpriseRecipe(
      {this.author,
      this.comments,
      this.difficulty,
      this.dishName,
      this.dishType,
      this.imageBytes,
      this.ingridients,
      this.portionsSize,
      this.preparationMinutes,
      this.stars,
      this.steps,
      this.tags,
      this.isPublic,
      this.price});

  factory EnterpriseRecipe.fromJson(Map<String, dynamic> json) {
    return EnterpriseRecipe(
        author: json["author"],
        comments: json["comments"] as List,
        difficulty: json["difficulty"],
        dishName: json["dishName"],
        dishType: json["dishType"],
        imageBytes: json["imageBytes"],
        ingridients: json["ingridients"] as List,
        portionsSize: json["portionSize"],
        preparationMinutes: json["preparationMinutes"],
        stars: json["stars"],
        steps: json["steps"] as List,
        tags: json["tags"] as List,
        isPublic: json["isPublic"],
        price: json["price"]);
  }

  Map<String, dynamic> toJson() => {
        "author": author,
        "comments": comments,
        "difficulty": difficulty,
        "dishName": dishName,
        "dishType": dishType,
        "imageBytes": imageBytes,
        "ingridients": ingridients,
        "portionSize": portionsSize,
        "preparationMinutes": preparationMinutes,
        "stars": stars,
        "steps": steps,
        "tags": tags,
        "price": price,
        "isPublic": isPublic
      };
}
