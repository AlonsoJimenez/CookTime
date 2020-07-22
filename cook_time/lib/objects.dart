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
        "myMenu": myMenu,
      };
}

class Enterprise {
  String imageBytes;
  String enterpriseName;
  String contactInfo;
  String operationHours;
  List<EnterpriseRecipe> recipes;
  List<String> members;
  List<String> followers;

  Enterprise(
      {this.contactInfo,
      this.enterpriseName,
      this.followers,
      this.members,
      this.operationHours,
      this.recipes,
      this.imageBytes});

  factory Enterprise.fromJson(Map<String, dynamic> json) {
    var jsonRecipes = json["recipes"] as List;
    var jsonMembers = json["members"] as List;
    var jsonFollowers = json["followers"] as List;
    return Enterprise(
        imageBytes: json["imageBytes"] != null ? json["imageBytes"] : null,
        contactInfo: json["contactInfo"] != null ? json["contactInfo"] : null,
        enterpriseName:
            json["enterpriseName"] != null ? json["enterpriseName"] : null,
        followers: jsonFollowers != null ? List.from(jsonFollowers) : null,
        members: jsonMembers != null ? List.from(jsonMembers) : null,
        operationHours:
            json["operationHours"] != null ? json["operationHours"] : null,
        recipes: jsonRecipes != null
            ? jsonRecipes
                .map((recipesVar) => EnterpriseRecipe.fromJson(recipesVar))
                .toList()
            : null);
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
  List<int> publish;
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
      this.tags,
      this.publish});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var jsonComments = json["comments"] as List;
    var jsonIngridients = json["ingridients"] as List;
    var jsonSteps = json["steps"] as List;
    var jsonTags = json["tags"] as List;
    var jsonPublish = json["publish"] as List;
    return Recipe(
        author: json["author"] != null ? json["author"] : null,
        comments: jsonComments != null ? List.from(jsonComments) : null,
        difficulty: json["difficulty"] != null ? json["difficulty"] : null,
        dishName: json["dishName"] != null ? json["dishName"] : null,
        dishType: json["dishType"] != null ? json["dishType"] : null,
        imageBytes: json["imageBytes"] != null ? json["imageBytes"] : null,
        ingridients:
            jsonIngridients != null ? List.from(jsonIngridients) : null,
        portionsSize: json["portionSize"] != null ? json["portionSize"] : null,
        preparationMinutes: json["preparationMinutes"] != null
            ? json["preparationMinutes"]
            : null,
        stars: json["stars"] != null ? json["stars"] : null,
        steps: jsonSteps != null ? List.from(jsonSteps) : null,
        tags: jsonTags != null ? List.from(jsonTags) : null,
        publish: jsonPublish != null ? List.from(jsonPublish) : null);
  }
  Map<String, dynamic> toJson() => {
        "author": author,
        "comments": comments,
        "difficulty": difficulty,
        "dishName": dishName,
        "dishType": dishType,
        "imageBytes": imageBytes,
        "ingridients": ingridients,
        "portionsSize": portionsSize,
        "preparationMinutes": preparationMinutes,
        "stars": stars,
        "steps": steps,
        "tags": tags,
        "publish": publish,
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
  List<int> publish;
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
      this.publish,
      this.isPublic,
      this.price});

  factory EnterpriseRecipe.fromJson(Map<String, dynamic> json) {
    var jsonComments = json["comments"] as List;
    var jsonIngridients = json["ingridients"] as List;
    var jsonSteps = json["steps"] as List;
    var jsonTags = json["tags"] as List;
    var jsonPublish = json["publish"] as List;
    return EnterpriseRecipe(
        author: json["author"] != null ? json["author"] : null,
        comments: jsonComments != null ? List.from(jsonComments) : null,
        difficulty: json["difficulty"] != null ? json["difficulty"] : null,
        dishName: json["dishName"] != null ? json["dishName"] : null,
        dishType: json["dishType"] != null ? json["dishType"] : null,
        imageBytes: json["imageBytes"] != null ? json["imageBytes"] : null,
        ingridients:
            jsonIngridients != null ? List.from(jsonIngridients) : null,
        portionsSize: json["portionSize"] != null ? json["portionSize"] : null,
        preparationMinutes: json["preparationMinutes"] != null
            ? json["preparationMinutes"]
            : null,
        stars: json["stars"] != null ? json["stars"] : null,
        steps: jsonSteps != null ? List.from(jsonSteps) : null,
        tags: jsonTags != null ? List.from(jsonTags) : null,
        publish: jsonPublish != null ? List.from(jsonPublish) : null,
        isPublic: json["isPublic"] != null ? json["isPublic"] : null,
        price: json["price"] != null ? json["price"] : null);
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
        "publish": publish,
        "price": price,
        "isPublic": isPublic
      };
}
