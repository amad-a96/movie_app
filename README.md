# Trending Movies App

## Overview

This is a mobile application built with Flutter that showcases trending movies. The app includes features like movie search, detailed movie information, and offline support. It follows Clean Architecture principles and uses GetX for state management.

## Features

- **Trending Movies List:** View and paginate through a list of trending movies.
- **Search Functionality:** Filter movies locally with a search bar.
- **Movie Details:** Access detailed information about a movie, including title, image, release date, overview, budget, revenue, and spoken languages.
- **Offline Support:** Seamlessly works offline with local data caching.
- **Custom UI:** Includes a custom app launcher icon and splash screen.

## Architecture

This project follows Clean Architecture principles, which include:

- **Presentation Layer:** Handles UI and user interactions.
- **Domain Layer:** Contains business logic and use cases.
- **Data Layer:** Manages data sources and repositories.

## State Management

GetX is used for state management. It provides reactive state handling and simplifies the management of app state.

## API

The app uses The Movie Database (TMDb) API for fetching movie data. For more information, visit the [TMDb API documentation](https://developer.themoviedb.org/).

### API Endpoints Used

- **Get the list of official genres for movies:**
  - **Endpoint:** `https://api.themoviedb.org/3/genre/movie/list`
  - **Documentation:** [Genre Movie List](https://developer.themoviedb.org/reference/genre-movie-list)

- **List of trending movies:**
  - **Endpoint:** `https://api.themoviedb.org/3/discover/movie?include_adult=false&sort_by=popularity.desc&page=1`
  - **Documentation:** [Discover Movie](https://developer.themoviedb.org/reference/discover-movie)

- **Details of a movie:**
  - **Endpoint:** `https://api.themoviedb.org/3/movie/{movie_id}`
  - **Documentation:** [Movie Details](https://developer.themoviedb.org/reference/movie-details)

- **Image Basics:**
  - **Documentation:** [Image Basics](https://developer.themoviedb.org/docs/image-basics)

