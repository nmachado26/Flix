# Project 2 - *FoneFlix*

**FoneFlix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **19** hours spent in total

## User Stories

The following **required** functionality is complete:

- [YES ] User can view a list of movies currently playing in theaters from The Movie Database.
- [YES ] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [ YES] User sees a loading state while waiting for the movies API.
- [ YES] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [YES ] User sees an error message when there's a networking error.
- [YES] Movies are displayed using a CollectionView instead of a TableView.
- [YES ] User can search for a movie.
- [YES ] All images fade in as they are loading.
- [YES ] User can view the large movie poster by tapping on a cell.
- [YES ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [YES ] Customize the selection effect of the cell.
- [YES ] Customize the navigation bar.
- [YES ] Customize the UI.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- [YES] - home screen added to welcome the user
- [YES] -  added custom logo and splashscreen
- [YES] - link to buy tickets take to fandango to buy a movie ticket
- [YES] - tableview cells and poster are customized
- [YES] - collection view cells are edited

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to use NS Default to successfully store and display in the tableview everytime. I want to discuss with those who used NSDefaults and see what the most efficient way to store and display is, and learn about all the possibilities for features from NSDefault.
2.  Had difficulty with designing. It would be helpful to discuss what features my classmates used and what is editable in designing (storyboards), to see how I can improve my UI.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/CxflANf.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
I had challenges with NSDefault, which I hope to focus on more last time. I had difficulty with design but learned alot with help from other and google on improving interface, etc. A definite challenge was understanding the API and how to fetch data, but once I learned that, I was able to implement the trailer feature and buy tickets feature, which are two of my favorites. At first, I did not understand the flow of the project, but learned that being organzied in the storyboard and using segue efficiently helps to be efficient with it.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- https://wallpapers.pictures/batman-vs-superman-wallpapers-for-iphone-6 - wallpaper image and logo

## License

Copyright [2018] [Nicolas Machado]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
