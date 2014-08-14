ivan = angular.module('ivan', [])

ivan.controller 'timer', ($scope, $interval, $element, $timeout) ->

  # TODO FEATURES
  # beep on hand change
  # fin workout screen
  #
  # TODO POLISH
  # ivan fade in out
  # count down fade in out
  # select diff sounds
  # graphics/fonts/colors
  # fancy pants progress bar

  $scope.defaults =
    countdown: 3
    minutes: 1
    reps: 10
    switch: false

  $scope.mode = 'setup'

  players = $element.find('audio')

  sound = (name) ->
    player.play() for player in players when player.src.indexOf(name) != -1

  progress = div for div in $element.find('div') when div.className == 'progress'

  $scope.secondsPerRep = ->
    ($scope.defaults.minutes*60)/$scope.defaults.reps

  msPerRep = ->
    $scope.secondsPerRep() *1000

  $scope.countdown = ->
    $scope.mode = 'countdown'

    $scope.state =
      countdown: $scope.defaults.countdown

    tick = ->
      $scope.state.countdown--
      if $scope.state.countdown == 0
        $interval.cancel(interval)
        $scope.workout()
      else
        sound('countdown')

    init = ->
      sound('countdown')

    $timeout(init, 0)
    interval = $interval(tick, 1000)

  $scope.workout = ->
    $scope.mode = 'workout'

    progress.style.transition = 'width ' + msPerRep() + 'ms'
    progress.style.width = '0px'
    w = '300px'

    $scope.state =
      secondsLeft: $scope.defaults.minutes * 60
      currentRep: 0

    tick =
      time: ->
        if $scope.state.secondsLeft == 0
          $scope.mode = 'finished'
          sound('finished')
          $interval.cancel(interval.time)
          $interval.cancel(interval.reps)
        else
          $scope.state.secondsLeft--
      reps: ->
        sound('rep')
        progress.style.width = if progress.style.width != w then w else '0px'
        $scope.state.currentRep++

    init = ->
      sound('rep')
      progress.style.width = w

    $timeout(init, 0)

    interval =
      time: $interval(tick.time, 1000)
      reps: $interval(tick.reps, msPerRep())
