var ivan = angular.module('ivan', []);

ivan.controller('timer', function($scope, $element, $timeout) {
  $scope.ivan = 'IVAИ';
  $timeout(function() {
    $element.find('h1').addClass('hide');
    $scope.run = true;
  }, 1000);
});