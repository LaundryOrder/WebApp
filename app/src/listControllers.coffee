listControllers = angular.module 'listControllers', ['ngMaterial', 'ngMessages', 'ngStorage']
listControllers.controller 'ListCtrl', ['$scope', '$http', '$location', '$mdDialog', '$localStorage',
  ($scope, $http, $location, $mdDialog, $localStorage)->
    $scope.isLoading = true
    $scope.refresh = ->
      $scope.isLoading = true
      $http
        method: 'GET'
        url: '/orders'
      .then (response)->
        $scope.isLoading = false
        $scope.orders = response.data.orders
      , (response)->
        $location.path "login"
    $scope.refresh()
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
    $scope.cancelOrder = (order_id)->
      $http
        method: 'DELETE'
        url: '/order/' + order_id
      .then (response) ->
        $scope.refresh()
      , (response)->
        $mdToast.show($mdToast.simple().textContent(response.data.msg))
    $scope.newOrder = ->
      $location.path "new"
    $scope.logout = ->
      $http
        method: 'GET'
        url: '/revoke'
      # todo confirm logout result
      delete $localStorage.token
      $location.path "login"
# todo back button to exit
# todo auto redirect by token
]
