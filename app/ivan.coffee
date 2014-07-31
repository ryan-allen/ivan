ivan = angular.module('ivan', [])

ivan.controller('timer', ($scope, $element, $timeout) ->
  $scope.ivan = 'IVAИ'
  $timeout(() ->
    $element.find('h1').addClass('hide')
    $scope.run = true
  , 1000))
