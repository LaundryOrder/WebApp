// Generated by CoffeeScript 1.10.0
var newControllers;

newControllers = angular.module('newControllers', ['ngMaterial', 'ngMessages']);

newControllers.controller('NewCtrl', [
  '$scope', '$http', '$location', '$mdToast', function($scope, $http, $location, $mdToast) {
    $scope.isLoadingAvail = true;
    $scope.isLoadingPlacing = false;
    $http({
      method: 'GET',
      url: '/avail'
    }).then(function(response) {
      $scope.isLoadingAvail = false;
      return $scope.avail = response.data.time;
    });
    $scope.order = {};
    $scope.door = {};
    $scope.has_door = false;
    $scope.avail = 0;
    $scope.postOrder = function() {
      if ($scope.has_door) {
        $scope.order.door = $scope.door;
      }
      $scope.isLoadingPlacing = true;
      return $http({
        method: 'POST',
        url: '/order',
        data: $scope.order
      }).then(function(response) {
        $scope.back();
        return $mdToast.show($mdToast.simple().textContent('You order has been placed!'));
      });
    };
    return $scope.back = function() {
      return $location.path('orders');
    };
  }
]);

//# sourceMappingURL=newControllers.js.map
