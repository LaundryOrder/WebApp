app = angular.module 'AMPlaygroundApp0', ['ngMaterial', 'ngRoute', 'ngMessages',
  'listControllers', 'loginControllers', 'newControllers']
app
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
#.config ($mdThemingProvider) ->
#  $mdThemingProvider.theme 'default'
#  .primaryPalette('cyan')
#  .accentPal
