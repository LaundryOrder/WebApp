newControllers = angular.module 'newControllers', ['ngMaterial', 'ngMessages']
newControllers.controller 'NewCtrl', ['$scope', '$http', '$location', '$mdToast',
  ($scope, $http, $location, $mdToast)->
    $scope.isLoadingAvail = true
    $scope.isLoadingPlacing = false
    $http
      method: 'GET'
      url: '/avail'
    .then (response)->
      $scope.isLoadingAvail = false
      $scope.avail = response.data.time
    $scope.order = {}
    $scope.door = {}
    $scope.has_door = false
    $scope.avail = 0
    $scope.postOrder = ->
      if $scope.has_door
        $scope.order.door = $scope.door
      $scope.isLoadingPlacing = true
      $http
        method: 'POST'
        url: '/order'
        data: $scope.order
      .then (response) ->
        $scope.back()
        $mdToast.show($mdToast.simple().textContent('You order has been placed!'))
    $scope.back = ->
      $location.path 'orders'
]
