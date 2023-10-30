# timart_app

This is a Flutter app designed to manage products, allowing users to add, retrieve, update, and delete products. The app uses the sqfentity package to interact with an SQLite database.
## Getting Started

A brief README that explains how i set up the app and the database connection:
At the app level
I created the product manager app using the 'flutter create timart_app' in my CMD environment. 
I added all the needed dependencies as seen in the pub.yaml file, also used a version that would be compactible for all dependencies.
From the instruction on the Sqfentity documentation i imported the products.g.dart file.
I then created the productsController class where i implemented all my CRUD login and passed it to my UI using the Getx state management.



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
