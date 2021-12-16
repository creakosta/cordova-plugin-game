Cordova Game plugin
====================
# Change log #
```c
	1.0.109
		Fixed crash issue when show leaderbord after logout.
	1.0.112
		Added show leaderboards method.
	1.0.113
		Fixed crash issue when submit score after logout.
	1.0.115
		Refixed crash issue when submit score after logout.
```
# API #
```javascript
//
var leaderboardId = "REPLACE_THIS_WITH_YOUR_LEADERBOARD_ID";
var achievementId1 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID1";
var achievementId2 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID2";
var achievementId3 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID3";
var achievementId4 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID4";
var achievementId5 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID5";
/*
var leaderboardId;
var achievementId1;
var achievementId2;
var achievementId3;
var achievementId4;
var achievementId5;
//android
if (navigator.userAgent.match(/Android/i)) {
	leaderboardId = "REPLACE_THIS_WITH_YOUR_LEADERBOARD_ID";
	achievementId1 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID1";
	achievementId2 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID2";
	achievementId3 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID3";
	achievementId4 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID4";
	achievementId5 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID5";
}
//ios
else if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
	leaderboardId = "REPLACE_THIS_WITH_YOUR_LEADERBOARD_ID";
	achievementId1 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID1";
	achievementId2 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID2";
	achievementId3 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID3";
	achievementId4 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID4";
	achievementId5 = "REPLACE_THIS_WITH_YOUR_ACHIEVEMENT_ID5";
}
*/

//
document.addEventListener("deviceready", function(){
	window.game.setUp();

	//callback
	window.game.onLoginSucceeded = function(result) {
		var playerDetail = result;
        alert('onLoginSucceeded: ' + playerDetail['playerId'] + ' ' + playerDetail['playerDisplayName']);
    };	
    window.game.onLoginFailed = function() {
        alert('onLoginFailed');
    };
	//	
    window.game.onSubmitScoreSucceeded = function() {
        alert('onSubmitScoreSucceeded');
    };	
    window.game.onSubmitScoreFailed = function() {
        alert('onSubmitScoreFailed');
    };
    window.game.onGetPlayerScoreSucceeded = function(result) {
		var playerScore = result;
        alert('onGetPlayerScoreSucceeded: ' + playerScore);
    };
    window.game.onGetPlayerScoreFailed = function() {
        alert('onGetPlayerScoreFailed');
    };	
	//	
    window.game.onUnlockAchievementSucceeded = function() {
        alert('onUnlockAchievementSucceeded');
    };  
    window.game.onUnlockAchievementFailed = function() {
        alert('onUnlockAchievementFailed');
    };
    window.game.onIncrementAchievementSucceeded = function() {
        alert('onIncrementAchievementSucceeded');
    };  
    window.game.onIncrementAchievementFailed = function() {
        alert('onIncrementAchievementFailed');
    };
    window.game.onResetAchievementsSucceeded = function() {
        alert('onResetAchievementsSucceeded');
    };	
    window.game.onResetAchievementsFailed = function() {
        alert('onResetAchievementsFailed');
    };
	//
    window.game.onGetPlayerImageSucceeded = function(result) {
		var playerImageUrl = result;
        alert('onGetPlayerImageSucceeded: ' + playerImageUrl);
    };
    window.game.onGetPlayerImageFailed = function() {
        alert('onGetPlayerImageFailed');
    };		
}, false);

//
window.game.login();
window.game.logout();
alert(window.game.isLoggedIn());

//
window.game.submitScore(leaderboardId, 5);//leaderboardId, score
window.game.showLeaderboard(leaderboardId);
window.game.showLeaderboards();
window.game.getPlayerScore(leaderboardId);

//
window.game.unlockAchievement(achievementId1);
window.game.unlockAchievement(achievementId2);
window.game.unlockAchievement(achievementId3);
window.game.unlockAchievement(achievementId4);
window.game.unlockAchievement(achievementId5);
window.game.incrementAchievement(achievementId1, 2); //achievementId, incrementalStepOrCurrentPercent: Incremental step (android) or current percent (ios) for incremental achievement.
window.game.incrementAchievement(achievementId2, 2);
window.game.incrementAchievement(achievementId3, 2);
window.game.incrementAchievement(achievementId4, 2);
window.game.incrementAchievement(achievementId5, 2);
window.game.showAchievements();
window.game.resetAchievements();//only supported on ios

//
window.game.getPlayerImage();

