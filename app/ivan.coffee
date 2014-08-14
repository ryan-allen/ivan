ivan = angular.module('ivan', [])

ivan.controller 'timer', ($scope, $interval) ->

  # TODO FEATURES
  # count down to time out
  # work out count down (seconds)
  # rep timer count down (somehow)
  # beep on rep
  # beep on hand change
  # progress bar somehow
  # fin workout screen
  #
  # TODO POLISH
  # ivan fade in out
  # count down fade in out
  # select diff sounds
  # graphics/fonts/colors
  # fancy pants progress bar

  $scope.defaults =
    countdown: 10
    minutes: 10
    reps: 75
    switch: false

  $scope.mode = 'setup'

  $scope.secondsPerRep = ->
    ($scope.defaults.minutes*60)/$scope.defaults.reps

  $scope.workout = ->
    console.log('wat')
    $scope.mode = 'workout'

    $scope.state =
      secondsLeft: $scope.defaults.minutes * 60
      currentRep: 0

    updateSeconds = ->
      $scope.state.secondsLeft--

    updateReps = ->
      $scope.state.currentRep++

    secondsInterval = $interval(updateSeconds, 1000)
    repsInterval = $interval(updateReps, $scope.secondsPerRep()*1000)
