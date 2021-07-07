# A Demo application using GetX for Flutter.

[GetX](https://pub.dev/packages/get)


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