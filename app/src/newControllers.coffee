newControllers = angular.module 'newControllers', ['ngMaterial', 'ngMessages']
newControllers.controller 'NewCtrl', ['$scope', '$http', '$location', '$mdToast',
  ($scope, $http, $location, $mdToast)->
    $scope.order = {}
    $scope.door = {}
    $scope.has_door = false
    $scope.back = ->
      $location.path 'orders'
    $scope.avail = '13:00'
    $scope.postOrder = ->
      $scope.back()
      $mdToast.show($mdToast.simple().textContent('You order has been placed!'))
]
