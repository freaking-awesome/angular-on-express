'use strict'

IndexCtrl= ($scope, $http) ->
    console.log('IndexCtrl...')

angular.module('Application', [])
.config ($routeProvider) ->
    $routeProvider
        .when '/',
            templateUrl: 'index.html'
            controller: IndexCtrl
       .otherwise
           redirectTo:'/'