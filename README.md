# usersapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Flutter some command :

-> flutter pub get
-> flutter pub outdated
-> flutter pub upgrade
-> flutter devices
-> flutter doctor -v
-> flutter doctor --android-licenses
-> flutter clean	
-> flutter run

# Firstly We have cloned from github link and open the terminal or vs or android studio then use this command
-> git clone https://github.com/hozrotbelal/UsersApp.git

# After clone then we will give the command
-> flutter pub get
-> flutter doctor -v

# Then we can run the command
-> flutter clean	
-> flutter run

# you can run this userApp project
we can see the Home, Favourite, Chat and Account.
Home and Favourite tab is workable, other tab is not worked.

-> Home Page Some Feature
   - pagination with 10 items per page
   - Loading more items should be triggered 
   - Shimmer view added
   - RefreshIndicator added
   - Add to favorite added
   - When click user item it's navigated to Details page

-> Favourite Page Some Feature
   - Show favorite list
   - Remove favorite list

-> Details Page Feature
   - Clickable UserData show in user deatils page
   - User show favorite or not
   - If it is favorite, then you can do the unfavorite from details page.

# Finally we can get apk below this command
-> flutter build apk --release

# I have completed the some task as your requirement.
1. REST API Integration:
Implement pagination with 10 items per page.
Display the user data in a scrollable list. Loading more items should be triggered as the
user scrolls down.

-> Shimmer view added
-> RefreshIndicator addeed
-> When click user item it's navigated to Details page

2. Favorite Functionality and Local Storage:
Allow users to mark/unmark items as favorites.
Store the favorite status locally on the device for later use, ensuring persistence across
app launches.

3. Detail Page (optional):
Implement a detail page for each list item.
Display additional details about the selected user.

Note: Toggle Theme is not completed in this time. It is half done and Testing is not completed.