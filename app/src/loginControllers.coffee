loginControllers = angular.module 'loginControllers', ['ngMaterial', 'ngMessages', 'ngStorage']
loginControllers.controller 'LoginCtrl', ['$scope', '$http', '$location', '$localStorage', '$mdToast',
  ($scope, $http, $location, $localStorage, $mdToast)->
    $scope.user = {}
    $scope.loading = false
    $scope.login = ->
      $scope.loading = true
      $http
        method: 'POST'
        url: '/token'
        data: $scope.user
      .then (response)->
        $localStorage.token = response.data.token
        $location.path "orders"
      , (response)->
        $scope.loading = false
        msg = response.data.msg
        $mdToast.show($mdToast.simple().textContent(msg))
]
