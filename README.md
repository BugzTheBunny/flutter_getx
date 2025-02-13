# A Demo application using GetX for Flutter.

[GetX](https://pub.dev/packages/get)

Some more intresting things:
- [SmartManagement](https://pub.dev/documentation/get/latest/get_core_src_smart_management/SmartManagement-class.html)

# **Navigation**
----
## 1. *Showing Snackbar*: **[`Get.snackbar()`]**

To show a snackbar, we created a simple app.

## **nuances:**

- We replaced `MaterialApp` for `GetMaterialApp`, it's the GetX better option that allows us to save code, and activate things without using context, for example with normal Flutter, we can't use `Snackbar` (Popping up message) without the use of `context`.

- We created the homepage in another dart file, we created it as a stateless file and imported it into the main.

- In the HomePage widget / view, we impelemnted a simple ElevatedButton, on which on press we show a snackbar, and we changed the design a bit to test it.


main.dart:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}
```

**homepage.dart**
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('Helloo!!!', 'Im a snackbar!!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blue,
                      colorText: Colors.white,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      icon: Icon(Icons.insert_comment_rounded));
                },
                child: Text('Show Snack!'))
          ],
        ),
      ),
    );
  }
}

```
---
## 2. *Showing Dialog*: **[`Get.defaultDialog()`]**

The dialog is pretty much the same when talking about usage, you can even show snacks after dialog, look at the example below, it's pretty self explanitory.

## **nuances:**
- I've added `duration` to snackbar, that's how much the the snack will be showed.
- `onConfirm` does not close the window when pressed, so we use `.pop`
- `barrierDismissible` - a boolean that will allow / not allow closing the dialog when pressing the background (outside of the dialog)


```
ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Are you sure?',
                      content: Text('Are you sure that 2+2 is 5?'),
                      textCancel: 'Yea!',
                      textConfirm: 'Sure!',
                      barrierDismissible: true,
                      onCancel: () {
                        print('Hehe u stoopid');
                      },
                      onConfirm: () {
                        print('Hehe u stoopid');
                        Navigator.of(context).pop();
                        Get.snackbar('Hehe no', 'U stoooopid!!',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.blue,
                            colorText: Colors.white,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            icon: Icon(Icons.insert_comment_rounded),
                            duration: Duration(seconds: 2));
                      });
                },
                child: Text('Show Dialog!'))
```
---
## 3. *Showing Buttom Sheet*: **[`Get.bottomSheet()`]**

Also nothing special.

## **nuances:**
- `isDismissible` a boolean that will allow / not allow closing the dialog when pressing the background (outside of the dialog)

```
ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircularProgressIndicator(),
                            Icon(Icons.access_alarm_rounded)
                          ],
                        ),
                      ),
                      backgroundColor: Colors.white,
                      isDismissible: false);
                },
                child: Text('Show Dialog!'))
```
---
## 3. *Basic Navigation* **[ `Get.to()`  | `Get.back()` ]**

- `Get.to(() => Path())`: Sends you to the path you selected.  
- `Get.back()`: Sends you to back to the previous path.  

- We created another page `shop.dart`, we will navigate to it.
- You can see there is `Get.back();` inside the file, that will return us to the previous page we were on.

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Go Back'))
          ],
        ),
      ),
    );
  }
}
```

- We modify Homepage to make the button navigate us.
- `Get.to(() => Shop());` Routing is is simple as that now, and going back is what we explain in the code above.
- Note that we imported `shop.dart`

```
...
import './shop.dart';
....

            ElevatedButton(
                onPressed: () {
                  Get.to(() => Shop());
                },
                child: Text('Go to Store!'))
...
```

---
## 3. *Basic Navigation* **[ `Get.off()`  | `Get.offAll()` ]**

- `Get.off()`: Send you to a page you selected, but removes the previous one from the state (Meaning you wont get 'back' funtionality not via `Get.back()` nor via back button whic appears in appbar) 
- `Get.offAll()`: Same as above, but it closes **EVERYTHING ELSE**

- We are creating a new file `cart.dart`, which will be our cart.
- The first button will return us back to the shop, and "kill" the `cart` "state".
- The second button will bring us back to homepage, and will kill everything beside it.

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './homepage.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back to store')),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(() => HomePage());
                },
                child: Text('Back Home'))
          ],
        ),
      ),
    );
  }
}

```
---
## 4. *Navigation with data transfer* **[ `Get.back(result:...)`  | `Get.to(arguments:{})` ]**



- `Get.back(result:{})` = result takes data, and returns it to the page you are returning to.
- `Get.to(arguments:{})` : arguments takes data, and sends it to the page you are going to.

**Notes**:
- You can send 1 item, or send dict or anything else.
- You can access the data as as it was a dict, view the code to see how to get the data that we send.

**shop.dart**
- We are getting the "name" argument from the homepage, so we can use it.

`Text('My name is ... ${Get.arguments["name"]}')`
```
child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('My name is ... ${Get.arguments["name"]}'), // Getting the data
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back(result: '200');
                },
                child: Text('Go Back')),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => Cart());
                },
                child: Text('Open Cart'))
          ],
        ),
```

`homepage.dart`
- Note that the data we get from 'back' is not initialized, so we are waiting for it, so when we press the button, the call to the new shop is initialized, and the 'status' is waiting for the response.

`String status = await Get.to(() => Shop(), arguments: {'name': 'Slava'}); `

```
child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                
                  String status = await Get.to(() => Shop(), arguments: {'name': 'Slava'}); 
                  print(status);
                  
                },
                child: Text('Go to Store!'))
          ],
        ),
```

---
## 5. *Navigation via routing* **[ `getPages: [GetPage(name: '/home', page:() => homePage())` | ETC..]**
- Using this, you can set a list of paths to use in GETX.

- First we define the routes list in the root.
- We implement all of the routes, we do this because this is the only place in which we will need this now, so we can remove the rest of the imports in the other files.
- Notice we removed `home:` paramenter, and replaced it with `initialRoute`, they both work, but this one looks better.

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './views/homepage.dart';
import './views/shop.dart';
import './views/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/homepage',
      getPages: [
        GetPage(
          name: '/store',
          page: () => Shop(),
        ),
        GetPage(
          name: '/homepage',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart',
          page: () => Cart(),
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}

```
- Navigating using the routes, is simmilar to the normal Get.to() but we just use the name that we defined, and we use Get.toNamed() for example.
Here is an example of the new navigation (notice that we defined `/shop` in the root), the arguments also pass normally.

- `Get.toNamed('/shop', arguments: {'name': 'Slava'})`

- same for `off`:
  - `Get.offNamed('/shop', arguments: {'name': 'Slava'})`
  - `Get.offAllNamed('/homepage', arguments: {'name': 'Slava!'})`

---
## 6. *Navigation via routing WITH WILD CARD* **[ `getPages: [GetPage(name: '/home', page:() => homePage())` | ETC..]**

- Lets add a wild card to the `store`, now we can navigate there with or without a parameter.
- The extra parameter can be used for easier navigation.

```
      getPages: [
        GetPage(
          name: '/store',
          page: () => Shop(),
        ),
        GetPage(
          name: '/store/:prodID',
          page: () => Shop(),
        ),
        GetPage(
          name: '/homepage',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart',
          page: () => Cart(),
        )
      ],
```

- In order to go to the `/store/:prodID` we will use an example.
```
ElevatedButton(
                onPressed: () async {
                  Get.toNamed('/store/MacBook', arguments: {'name': 'Slava'});
                },
                child: Text('Show Macbook!'))
          ],
```

- And in the shop we will add another container
```
    Container(
      child: Text('Selected Product ${Get.parameters["prodID"]}'),
    ),
```

- Like so, we will be able to see MacBook, over there.
- BUT if we navigate there via the normal button (`Get.toNamed('/store')`) we will get `null` instead of the product.



# **State Management.**

## 1. **GetxController**
- Getx uses **MVC** (*Model–view–controller*) architecture.
- Lets create a new folder, called `controllers`, and create `homeController.dart` inside it.

- **homeController.dart**
```
import 'package:get/get.dart';

class HomePageController extends GetxController {
  String status = 'unknown';

  void updateStatus(newStatus) {
    status = newStatus;
    print(status);
    update();
  }
}
```
- Everything that is listening to this controller, will be changed, when this method is called.
- In the home page, we add 3 more widgets, A test of a status, and 2 buttons, one for login, one for logout, and we import the controller
- And we declear a final controller.
```
...
import '../controllers/homeController.dart';
...
final HomePageController homepageController = Get.put(HomePageController());
...
Text("User Status : ${homepageController.status}"),
            ElevatedButton(
                onPressed: () {
                  homepageController.updateStatus("Online!");
                },
                child: Text('Login In')),
            ElevatedButton(
                onPressed: () {
                  homepageController.updateStatus("Offline!");
                },
                child: Text('Log Out'))
```
- Now, when you will click this, everything is actually working, but we just dont see it update on the gui, but you can see it does print the status, `so how do we actually see the changes?` 

---
## 2. **GetxBuilder**
- Using GetX builder, we can actually see when things changing, we just need to wrap around our text and buttons with `GetBuilder`:
- Note, that it needs the `type` of the `Controller`.
```
    GetBuilder<HomePageController>(builder: (_) {
      return Text("User Status :${homepageController.status}");
    }),
```
- Now when ever you press one of the buttons, then builder will re-render the data.
---
## 3. **View the controller in other places?**

- What if we want to see the controller in another place? we need to initialize it again? Nope, lets see if for example we want to see the status, in the shop, near the title.

- So, we still need to import a few things, but its much less of the code we need.
  - We imported the controller to the `store.dart`
  - we used `Get.find` to find the controller we need.
  - we added `home.status` to the title.
    - And yeah! it updates.
```
import '../controllers/homeController.dart';
import 'package:get/get.dart';

class Shop extends StatelessWidget {
  HomePageController home = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop ${home.status}'),
```
---
## 4. **Unique ID in GetxController**
- Why we need it?:

  If we have 1 item, we don't really need it, but if we have 10 items? if we just change the status, we dont want the rest of the 9 items to update with it, so we can rebuild ONLY the things that we want, with a Unique ID.

- We will add another property, `usersCount` to the home controller, which will update when we want, but that wont affect the rest of the items.

- First we add another builder to the homepage:
- also add a print to the previous controller `print('STATUS REBUILD');`

```
GetBuilder<HomePageController>(builder: (_) {
              print('USERS REBUILD');
              return Text("User Status :${homepageController.usersCount}");
            }),
```
- Then we add the variable into the controller
```
  String status = 'Unknown';
  int usersCount = 10;
```
- Now when ever we press the login / logout, we will see that both of the Widgets are getting rebuilt, which we don't want, how to solve it?
  - We want only the status to change.
- We add ID's to the Builders first of all.

```
...
  GetBuilder<HomePageController>(
      id: "status_widget",
      builder: (_) {
        print('STATUS REBUILD');
        return Text("User Status :${homepageController.status}");
      }),
...
  GetBuilder<HomePageController>(
      id: 'userscount_widget',
      builder: (_) {
        print('USERS REBUILD');
        return Text("Users Count :${homepageController.usersCount}");
      }),
...
```
- now, in the `updateStatus` method inside `homeController.dart`, we add the id (it can take a list of id's ofcourse).

```
  void updateStatus(newStatus) {
    status = newStatus;
    print(status);
    update(['status_widget']);
  }
```

- Now, when you will login and out, you will see that only the `STATUS REBUILD` is showing, because that the only one that is affected when we call the update function.
  - For Diving deeper porpuse, lets create another function, that will increment the amount of users.

- add a button on the main homepage.
```
  ElevatedButton(
                  onPressed: () {
                    homepageController.addUsers();
                  },
                  child: Text('Add Users')),
```
- add the function itself.
```
  void addUsers() {
    usersCount += 1;
    update(['userscount_widget']);
  }
```
- Now you have a button, which will only update the user count, note it that will not affect the status, and same goes the other way around.

---
## 5. **GetX approach [.obs]**
- To make everything more reactive, we can use the GetX approach.
  - we chage the `status` into a and observeble for the GetX widget.
  - we remove the update, because getx knows how to do it by itself.
  - Notice that we added `.obs` to the initialization value, and we changed it to var, and `.value` to the changing method.


**homeController.dart**
```
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var status = 'Unknown'.obs;
  int usersCount = 10;

  void updateStatus(newStatus) {
    status.value = newStatus;
  }

  void addUsers() {
    usersCount += 1;
    update(['userscount_widget']);
  }
}

```
- On the `homepage.dart` we replace the old `GetBuilder` with `GetX` widget.
- it looks almost much the same, but as you can see it has less code.
```
GetX<HomePageController>(builder: (_) {
              print('STATUS REBUILD');
              return Text("User Status :${homepageController.status}");
            }),
```
- Now the application will work in the same way, but with even less code.
---
## 6. **Obx approach [.obs]**
- Now, can we make it even shorter and easier to implement? **YES WE CAN!**
- using the Obx class/widget.
  - in this part, we only change the widget in the `homepage.dart`
```
 Obx(() {
    print('STATUS REBUILD');
    return Text("User Status :${homepageController.status.value}");
  }),
```
- Yup.. that pretty much it, now it has even less code, and it looks cleaner.
---
## 7. **Getx Workers**
- GetX workers are callbacks that are performed on certein events.

1. `ever(listener,(_){})`
  - The ever listener will accure everytime we call change variable/observable.
  - We override the `OnInit()` function inside `HomePageController`.
  ```
  @override
  void onInit() {
    ever(status, (_) {
      print('This will run everything we call the variable!');
    });
    super.onInit();
  }
  ```
  - If we want another one of these, we can just add, for example for the user count.
  -**NOTE** - you need to change the rest of the items in the app for the users count to make it work.
    - set the initialization as needed and turn the value into obs.
    - change the class in the homepage to Obx.
  ```
  @override
  void onInit() {
    ever(status, (_) {
      print('This will run everything we call the variable!');
    });

    ever(usersCount, (_) {
      print('The users count was updated.');
    });
    super.onInit();
  }
  ```

  - **OR** we can use `everAll()`, which listens to both of the parameters:
  - `everAll([status, usersCount], (_) => print('Something is updated..!'));` 
    - *Note im using the short syntax, but the normal one also works here ofcourse*
    - Everytime one of the parameters changes, this will be called.
- If we want something that will be called only onces, we can use... `once()`
  ```
  once(usersCount, (_) {
    print('This will be called one time only!');
  });
  ```
- Another cool worker is `debounce()`, it will do something, after `N` time that the value was not changed.
  - Press the add users, wait for 2 seconds, and you will see the print.
```
  debounce(usersCount, (number) {
    print(number);
  }, time: Duration(seconds: 2));
```

# **Dependancy Injection.**
---
## 1. **Few words about Dependancy Injection**
- The normal way to transefr Widgets and their data while using Flutter, is a headeach, you need to transfer them level by level, from the root to the buttom, even when sometimes we don't actually use them inside of the layers in the way.

- But with git, when using for example `Get.put(HomePageController());` we are actually getting the option to use the items where ever we want.

- Problem? - When the place where this is declared is getting removed from the navigation stack, the Injection will also be removed.

- Solution? - We can make it permanent, meaning make it stay in memmory usign the permanent property.
  - `Get.put(HomePageController(), permanent: true);`
  - now we can use it anywhere, even if the widget in which we initialize it, is removed from the stack.
---
## 2. **Bindings, Lazy , GetWidget**, A better way!
- Instead of declearing what we want to use everywhere, we can just declear them in one place, and use them.

- Create a folder `bindings`, and create `homeBindings.dart`
- Note, instead of `lazyPut`, we can indeed use `put`, but if we do so, it will be initialized right when the app starts, if we use lazy, it will start only when called.
- note the `fenix` parameter, when we use bindings, the Widget gets destroyed in the background verytime, so when we use `fenix`, the exact same value will be returned everytime, on a high level, imagine that it wont be destroyed.
```
import 'package:get/get.dart';
import '../controllers/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController(), fenix: true);
  }
}

```

- in the `main.dart` file, we add binding to the route.
`GetPage(name: '/homepage', page: () => HomePage(), binding: HomeBinding()),`
- in `homepage.dart` we remove eveything we don't need, and refactor the code a bit.
  - we removed the imports we dont need.
  - we change the extension of the Widget
    - `class HomePage extends GetWidget<HomePageController>`
  - we removed the initialization of the controller.
  - we refactor all of the usage of the controller.
- As you can see, now the code is more clear, and has less code, but everything works the same, we can do the same thing in the `cart.dart`, and it will wrok the same.
```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/homeController.dart';

class HomePage extends GetWidget<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  String status =
                      await Get.toNamed('/store', arguments: {'name': 'Slava'});
                },
                child: Text('Go to Store!')),
            ElevatedButton(
                onPressed: () async {
                  Get.toNamed('/store/MacBook', arguments: {'name': 'Slava'});
                },
                child: Text('Show Macbook!')),
            Obx(() {
              print('STATUS REBUILD');
              return Text("User Status :${controller.status.value}");
            }),
            ElevatedButton(
                onPressed: () {
                  controller.updateStatus("Online!");
                },
                child: Text('Login In')),
            ElevatedButton(
                onPressed: () {
                  controller.updateStatus("Offline!");
                },
                child: Text('Log Out')),
            Obx(() {
              return Text("Users Count :${controller.usersCount.value}");
            }),
            ElevatedButton(
                onPressed: () {
                  controller.addUsers();
                },
                child: Text('Add Users')),
          ],
        ),
      ),
    );
  }
}

```

# **GetStorage**
*A fast, extra light and synchronous key-value in memory, which backs up data to disk at each operation. It is written entirely in Dart and easily integrates with Get framework of Flutter.*

TL;DR : it allows you to use internal data, some sort of ENV variables, and to rewrite them, get them, and change them.

Usage example: You can store email & password of a user, after the initial login, after that, he wont need to log in again, because we can read the data about him.

---
## 1. **Install and Init**
- **How to install**:
  - First, we add it to the dependancies in pubspec.
  - Then we run `flutter packages get`
- **How to init the GetStorage**:
   ```
  import 'package:get_storage/get_storage.dart';

  void main() async {
    await GetStorage.init();
    runApp(MyApp());
  }
   ```
---
## 2. **Using the storage**
- Add initialization of the storage in `homepage.dart`
```
...
class HomePage extends GetWidget<HomePageController> {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
...
```
- Remove everything we had in the homepage children.
- Add a TextField.
- Add 2 buttons.
- Add a snackbar.
- Add a TextController.

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_demo/controllers/homeController.dart';

class HomePage extends GetWidget<HomePageController> {
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email Address')),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                  onPressed: () {
                    if (GetUtils.isEmail(emailController.text)) {
                      storage.write('email', emailController.text);
                      emailController.text = '';
                    } else {
                      Get.snackbar(
                          'Something went wrong..', 'Enter a valid email',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.yellow);
                    }
                  },
                  child: Text('Add Users')),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(onPressed: () {}, child: Text('View')),
            ),
          ],
        ),
      ),
    );
  }
}
```
---
## 3. **Making it work the GetX way**
- Before we continue, remove everything from that app that is connected to the users count, or the status.
- clean the homepage controller, and replace it with
```
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var email = ''.obs;

  void updateEmail(newEmail) {
    email.value = newEmail;
  }
}
```

- on `homepage.dart`:
```
SizedBox(
    height: MediaQuery.of(context).size.height * 0.05,
    width: MediaQuery.of(context).size.width * 0.3,
    child: ElevatedButton(
        onPressed: () {
          controller.updateEmail("${storage.read('email')}");
        },
        child: Text('View')),
  ),
  Obx(() {
    return Text('Email Address: ${controller.email.value}');
  })
```

- now the mail that you will input, will be saved in the internal storage.
- when you will press the "view" button, the homeController will activate the update email, which will update the email variable, with the variable, that we use `storage.read('email')` to get, meaning we will get the internal `email` variable, meaning, that even if you rebuild the app, you can access this variable, because its saved inside the app.

- `Last notes`:
  - You can listen you changes in the values with:
    ```
    storage.listnKey("email",(_){
      print('Email changed');
    });
    ```
  - You can remove keys with the usage of:
  ```
  storage.remove(key);
  ```
  