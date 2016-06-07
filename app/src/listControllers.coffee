listControllers = angular.module 'listControllers', ['ngMaterial', 'ngMessages', 'ngStorage']
listControllers.controller 'ListCtrl', ['$scope', '$http', '$location', '$mdDialog', '$localStorage',
  ($scope, $http, $location, $mdDialog, $localStorage)->
    $scope.isLoading = true
    $http
      method: 'GET'
      url: '/orders'
    .then (response)->
      $scope.isLoading = false
      $scope.orders = response.data.orders
    , (response)->
      $location.path "login"
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
      delete $localStorage.token
      $location.path "login"
# todo add revoke operation
# todo pull down refresh
# todo back button to exit
# todo auto redirect by token
]
