listControllers = angular.module 'listControllers', ['ngMaterial', 'ngMessages']
listControllers.controller 'ListCtrl', ['$scope', '$http', '$location', '$mdDialog',
  ($scope, $http, $location, $mdDialog)->
    originatorEv = null
    $scope.openMenu = ($mdOpenMenu, ev)->
      originatorEv = ev
      $mdOpenMenu(ev)
      return
    $scope.showQR = (ev, token)->
      $mdDialog.show
        targetEvent: ev
        template: '<md-dialog ng-click="hide()">\n    <md-dialog-content>\n        <qr text="\'' + token + '\'"></qr>\n    </md-dialog-content>\n</md-dialog>'
        clickOutsideToClose: true
        controller: ($scope, $mdDialog)->
          $scope.hide = ->
            $mdDialog.hide()
    $scope.newOrder = ->
      $location.path "new"
    $scope.logout = ->
      $location.path "login"
    $scope.orders = [
      {
        "end": 1465229567931,
        "machine": 0,
        "order_id": 9,
        "order_time": 1465131983574,
        "order_token": "e0f2658498d5427795a24a0d167b0b11",
        "start": 1465219567931,
        "status": 3
      },
      {
        "end": 1463853323760,
        "machine": 0,
        "order_id": 8,
        "order_time": 1463841323765,
        "order_token": "97e946e6fc4a41f2b142e66b1050b22b",
        "start": 1463841323760,
        "status": 1
      },
      {
        "end": 1463837849222,
        "machine": 0,
        "order_id": 4,
        "order_time": 1463837627653,
        "order_token": "2230c834735542dbabcd2dcbd1597cdc",
        "start": 1463837729222,
        "status": 1
      },
      {
        "end": 1463837747442,
        "machine": 2,
        "order_id": 3,
        "order_time": 1463837627442,
        "order_token": "15e6d259267344e39a25a19b6b020a2c",
        "start": 1463837627442,
        "status": 1
      },
      {
        "end": 1463837747311,
        "machine": 1,
        "order_id": 2,
        "order_time": 1463837627313,
        "order_token": "8ebe4520940e45658e9039c8cb2803a7",
        "start": 1463837627311,
        "status": 2
      },
      {
        "end": 1463837729222,
        "machine": 0,
        "order_id": 1,
        "order_time": 1463837609230,
        "order_token": "64b0bc2bbff242609d5b3bc707810dec",
        "start": 1463837609222,
        "status": 2
      }
    ]
]
