loginControllers = angular.module 'loginControllers', ['ngMaterial', 'ngMessages']
loginControllers.controller 'LoginCtrl', ['$scope', '$http', '$location', '$rootScope'
  ($scope, $http, $location, $rootScope)->
    $scope.user = {}
    $scope.login = ->
      $location.path "orders"
#      $rootScope.$broadcast 'USER', $scope.user.username
      $rootScope.username=$scope.user.username

]
