ivan = angular.module('ivan', [])

ivan.controller('timer', ($scope, $element, $timeout) ->

  # TODO 
  #   store below values in cookies
  #   beeper
  #   timer w/ two timeouts (one for rep tick and one for countdown display)
  #   custom controls

  $scope.countdown = 3
  $scope.time = '5:00'
  $scope.reps = 50

  $scope.repsPerMinute = ->
    parseFloat($scope.reps) / timeInMinutes()

  timeInMinutes = () ->
    [m, s] = $scope.time.split(':')
    [m, s] = [parseInt(m), parseInt(s)]
    m + (s/60)

  timeInSeconds = () ->
    [m, s] = $scope.time.split(':')
    [m, s] = [parseInt(m), parseInt(s)]
    (m*60) + s

  secondsPerRep = () ->
    timeInSeconds() / parseFloat($scope.reps)

  $scope.begin = ->
    console.log(timeInSeconds(), secondsPerRep())
)
