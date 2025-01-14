abstract class AppStates {}

class InitialState extends AppStates {}

class GetUserDataSuccessState extends AppStates {}

class GetUserDataErrorState extends AppStates {}

class GetGenresSuccessState extends AppStates {}

class GetGenresErrorState extends AppStates {}

class GetGenreMoviesSuccessState extends AppStates {}

class GetGenreMoviesErrorState extends AppStates {}

class GetMoviesLoadingState extends AppStates {}

class GetMoviesSuccessState extends AppStates {}

class GetMoviesErrorState extends AppStates {}

class GetTopRatedMoviesLoadingState extends AppStates {}

class GetTopRatedMoviesSuccessState extends AppStates {}

class GetTopRatedMoviesErrorState extends AppStates {}

class GetTrendingMoviesLoadingState extends AppStates {}

class GetTrendingMoviesSuccessState extends AppStates {}

class GetTrendingMoviesErrorState extends AppStates {}

class GetUpcomingMoviesLoadingState extends AppStates {}

class GetUpcomingMoviesSuccessState extends AppStates {}

class GetUpcomingMoviesErrorState extends AppStates {}

class MovieAdded extends AppStates {}
