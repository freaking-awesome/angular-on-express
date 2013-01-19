'use strict'

IndexCtrl= ($scope, $http) ->
    console.log('IndexCtrl...')

angular.module('Application', [])
.config ($routeProvider, $locationProvider) ->

    $routeProvider
        .when '/',
            templateUrl: 'index.html'
            controller: IndexCtrl
       .otherwise
           redirectTo:'/'

    $locationProvider
        .html5Mode true