angular
.module 'AMPlaygroundApp0', ['ngMaterial', 'ngRoute', 'ngMessages', 'ngStorage', 'angularMoment', 'ja.qr',
  'listControllers', 'loginControllers', 'newControllers']
.constant 'BASE_URL', 'http://192.168.1.233:8233'
.config ['$routeProvider', ($routeProvider)->
  $routeProvider
  .when '/orders',
    templateUrl: 'partials/order-list.html'
    controller: 'ListCtrl'
  .when '/login',
    templateUrl: 'partials/login.html'
    controller: 'LoginCtrl'
  .when '/new',
    templateUrl: 'partials/new-order.html'
    controller: 'NewCtrl'
  .otherwise
      redirectTo: '/login'
]
.factory 'APIURLProcessor', ($q, $localStorage, BASE_URL)->
  request: (config) ->
    if config.url[0] == '/'
      config.url = BASE_URL + config.url
      config.headers['Authorization'] = 'Token ' + $localStorage.token
    config
.config ['$httpProvider', ($httpProvider)->
  $httpProvider.interceptors.push('APIURLProcessor');
]
#.config ($mdThemingProvider) ->
#  $mdThemingProvider.theme 'default'
#  .primaryPalette('cyan')
#  .accentPal
