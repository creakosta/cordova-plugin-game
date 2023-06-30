Cordova Game plugin
====================
# API #

Authorization

```javascript

window.game.login();

window.game.onLoginSucceeded = function(result) {
var playerDetail = result;
alert('onLoginSucceeded: ' + playerDetail['playerId'] + ' ' + playerDetail['playerDisplayName']);
};
	
window.game.onLoginFailed = function() {
alert('onLoginFailed');
};

window.game.logout();

alert(window.game.isLoggedIn());

window.game.getPlayerImage();

window.game.onGetPlayerImageSucceeded = function(result) {
var playerImageUrl = result;
alert('onGetPlayerImageSucceeded: ' + playerImageUrl);
};

window.game.onGetPlayerImageFailed = function() {
alert('onGetPlayerImageFailed');
};

```
Leaderboards

```javascript

window.game.getPlayerScore(leaderboardId);

window.game.submitScore(leaderboardId, 5); //leaderboard id, score

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

window.game.showLeaderboard(leaderboardId); //leaderboard id

window.game.showLeaderboards();

```
Achievements

```javascript

window.game.unlockAchievement(achievementId); //achievement id

window.game.onUnlockAchievementSucceeded = function() {
alert('onUnlockAchievementSucceeded');
};

window.game.onUnlockAchievementFailed = function() {
alert('onUnlockAchievementFailed');
};

window.game.incrementAchievement(achievementId, 50); //achievement id, incrementalStepOrCurrentPercent: current percent for incremental achievement (0-100)

window.game.onIncrementAchievementSucceeded = function() {
alert('onIncrementAchievementSucceeded');
};

window.game.onIncrementAchievementFailed = function() {
alert('onIncrementAchievementFailed');
};

window.game.resetAchievements();

window.game.onResetAchievementsSucceeded = function() {
alert('onResetAchievementsSucceeded');
};
	
window.game.onResetAchievementsFailed = function() {
alert('onResetAchievementsFailed');
};

window.game.showAchievements();

```

Access Point (iOS 14+)

```javascript
// CHECK IF AVAILABLE
window.game.isAccessPointAvailable((available) => {
        // Basically you know the API should be there
        // Still need to call `checkAuth()` etc.
    },
    (err) => {}
);


// SHOW, HIDE and MODIFY the access point
const accessPointProps = {  
    // OPTIONAL, sets position of the accesspoint
    // values: "TOP_LEFT"|"TOP_RIGHT"|"BOTTOM_LEFT"|"BOTTOM_RIGHT"
    // maps to: https://developer.apple.com/documentation/gamekit/gkaccesspointlocation?language=objc
    location: "TOP_LEFT",  
    
    // OPTIONAL, if highlights shall be shown
    // maps to: https://developer.apple.com/documentation/gamekit/gkaccesspoint/3618827-showhighlights?language=objc
    showHighlights: true,
    
    // OPTIONAL, enable/disable access point
    // maps to: https://developer.apple.com/documentation/gamekit/gkaccesspoint/3618827-showhighlights?language=objc
    active: true,  
};

window.game.modifyAccessPoint(() => {
        // success!
    }, (err) => {
        // failed!
    },
    accessPointProps,
);


// EXAMPLE hide access point
window.game.modifyAccessPoint(() => {}, () => {}, { active: false });

```
