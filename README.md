Cordova Game plugin
====================

# Overview #
Show leaderboard and achievements (google play game and game center, SDK)
 
[android, ios] [cordova cli] [xdk] [phonegap build service]

Requires google play developer account https://play.google.com/apps/publish/<br>
Requires apple developer account https://developer.apple.com/devcenter/ios/index.action

This is open source cordova plugin.

You can see Cordova Plugins in one page: http://cranberrygame.github.io?referrer=github

```c
cf)

Leaderboard game: Best score game
	Limited life
		ex) 1, 3
	Limited time
		ex) 30 seconds
	Time is score
	
Achievement
	Score
		ex)	Achievement1 (Score 10)
			Achievement2 (Score 30)
			Achievement3 (Score 60)
			Achievement4 (Score 100)
			Achievement5 (Score 150)
	Level
		ex)	Achievement1 (Level 1)
			Achievement2 (Level 2)
			Achievement3 (Level 4)
			Achievement4 (Level 6)
			Achievement5 (Level 8)
			Achievement6 (Level 10)
	Category
		ex)	Achievement1 (Number)
			Achievement1 (Fruit)
			Achievement1 (Color)
			Achievement1 (Other)
			Achievement1 (Challenge (Limited time))
```
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


# Credits #
