const boolToString = function(prop) {
    if (prop === true)
        return 'yes';
    if (prop === false)
        return 'no';

    var propType = typeof prop;
    if (propType == 'string') {
        const noCase = prop.toLowerCase();
        if (noCase == 'true')
            return 'yes';
        if (noCase == 'false')
            return 'no';
    }
    return '';
};

module.exports = {
	_loggedin: false,
	tag: '',
	setUp: function () {
		cordova.exec(
		function (result) {
		}, 
		function (error) {
		}, "Game", "setUp", []);
    },
	login: function (tag) {
		var self = this;
		cordova.exec(function (result) {
			var playerDetail = result;
			self._loggedin = true;
			self.tag = tag;			
			if (self.onLoginSucceeded)
				self.onLoginSucceeded(playerDetail);
		}, 
		function (error) {
			self.tag = tag;		
			if (self.onLoginFailed)			
				self.onLoginFailed();
		}, "Game", "login", []);
    },
	logout: function () {
		var self = this;
		cordova.exec(function (result) {
			self._loggedin = false;
		}, 
		function (error) {
		}, "Game", "logout", []);
    },
	isLoggedIn: function () {
		return this._loggedin;
	},
	submitScore: function (leaderboardId, score, tag) {
		var self = this;
		cordova.exec(function (result) {
			self.tag = tag;
			if (self.onSubmitScoreSucceeded)			
				self.onSubmitScoreSucceeded();
		}, 
		function (error) {
			self.tag = tag;
			if (self.onSubmitScoreFailed)			
				self.onSubmitScoreFailed();
		}, "Game", "submitScore", [leaderboardId, score]);
	},
	showLeaderboard: function (leaderboardId) {
		cordova.exec(
		function (result) {
		}, 
		function (error) {
		}, "Game", "showLeaderboard", [leaderboardId]);
	},
	showLeaderboards: function () {
		cordova.exec(
		function (result) {
		}, 
		function (error) {
		}, "Game", "showLeaderboards", []);
	},
	getPlayerScore: function (leaderboardId, tag) {
		var self = this;
		cordova.exec(function (result) {
			var playerScore = result;
			self.tag = tag;
			if (self.onGetPlayerScoreSucceeded)
				self.onGetPlayerScoreSucceeded(playerScore);
		}, 
		function (error) {
			self.tag = tag;
			if (self.onGetPlayerScoreFailed)			
				self.onGetPlayerScoreFailed();
		}, "Game", "getPlayerScore", [leaderboardId]);
	},
	unlockAchievement: function (achievementId, tag) {
		var self = this;
		cordova.exec(function (result) {
			self.tag = tag;
			if (self.onUnlockAchievementSucceeded)			
				self.onUnlockAchievementSucceeded();
		}, 
		function (error) {
			self.tag = tag;
			if (self.onUnlockAchievementFailed)			
				self.onUnlockAchievementFailed();
		}, "Game", "unlockAchievement", [achievementId]);
	},
	incrementAchievement: function (achievementId, incrementalStepOrCurrentPercent, tag) {
		var self = this;
		cordova.exec(function (result) {
			self.tag = tag;
			if (self.onIncrementAchievementSucceeded)			
				self.onIncrementAchievementSucceeded();
		}, 
		function (error) {
			self.tag = tag;
			if (self.onIncrementAchievementFailed)			
				self.onIncrementAchievementFailed();
		}, "Game", "incrementAchievement", [achievementId, incrementalStepOrCurrentPercent]);
	},	
	showAchievements: function () {
		cordova.exec(
		function (result) {
		}, 
		function (error) {
		}, "Game", "showAchievements", []);
	},
	resetAchievements: function () {
		var self = this;
		cordova.exec(function (result) {
			if (self.onResetAchievementsSucceeded)			
				self.onResetAchievementsSucceeded();
		}, 
		function (error) {
			if (self.onResetAchievementsFailed)			
				self.onResetAchievementsFailed();
		}, "Game", "resetAchievements", []);
	},	
	getPlayerImage: function () {
		var self = this;
		cordova.exec(function (result) {
			var playerImageUrl = result;
			if (self.onGetPlayerImageSucceeded)			
				self.onGetPlayerImageSucceeded(playerImageUrl);
		}, 
		function (error) {
			if (self.onGetPlayerImageFailed)			
				self.onGetPlayerImageFailed();
		}, "Game", "getPlayerImage", []);
	},
        isAccessPointAvailable: function (success, failure) {
                cordova.exec(success, failure, "Game", "isAccessPointAvailable", []);
        },
        modifyAccessPoint: function (success, failure, data) {
        // make sure nothing bad can happen here
        var sendData = {};
        if (typeof data == 'object') {
            if (typeof data.location == 'string') {
                sendData.location = data.location;
            }
            if (typeof data.showHighlights != 'undefined') {
                sendData.showHighlights = boolToString(data.showHighlights);
            }
            if (typeof data.active != 'undefined') {
                sendData.active = boolToString(data.active);
            }
        }
        cordova.exec(success, failure, "Game", "modifyAccessPoint", [sendData]);
        },	
	
	onLoginSucceeded: null,
	onLoginFailed: null,	
	onSubmitScoreSucceeded: null,
	onSubmitScoreFailed: null,
        onGetPlayerScoreSucceeded: null,
        onGetPlayerScoreFailed: null,	
	onUnlockAchievementSucceeded: null,
	onUnlockAchievementFailed: null,
	onIncrementAchievementSucceeded: null,
	onIncrementAchievementFailed: null,
	onResetAchievementsSucceeded: null,
	onResetAchievementsFailed: null,
	onGetPlayerImageSucceeded: null,
	onGetPlayerImageFailed: null
};
