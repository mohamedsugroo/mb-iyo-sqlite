let app = angular.module('mangaApp', [])
  

app.controller('searchController', function($scope, $http) {

	$scope.posts = []

	$http({
		method: 'GET',
		url: '/posts.json'
	}).then(function successCallback(response) {
		$scope.posts = response.data
	}, function errorCallback(response) {
		console.log(response)

	});

});
