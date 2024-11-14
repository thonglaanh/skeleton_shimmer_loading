### Shimmer:

A package provides an easy way to add skeleton shimmer loading effect in Flutter project

![Shimmer Loading Animation](https://miro.medium.com/v2/resize:fit:1200/1*uZ5_qMv7QUAeCtaFCHzNKA.gif)

### How to use

```dart
import 'package:skeleton_shimmer_loading/skeleton_shimmer_loading.dart';
```

```dart
        AppShimmerLoading(
              isLoading: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ShimmerItem(
                      child: Container(
                        width: 100,
                        height: 20,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  ShimmerItem(
                    child: Container(
                      width: 100,
                      height: 20,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.red,
                  ),


                ],
              ),
            );
```

Good luck!!!
