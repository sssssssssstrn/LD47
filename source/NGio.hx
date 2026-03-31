package;

#if (!android && !NO_NEWGROUNDS)
import io.newgrounds.NG;
import io.newgrounds.components.ScoreBoardComponent;
import io.newgrounds.objects.Medal;
import io.newgrounds.objects.Score;
import io.newgrounds.objects.ScoreBoard;
#end

class NGio
{
	#if (!android && !NO_NEWGROUNDS)
	public static var loggedIn:Bool = false;
	public static var ng:NG;
	
	public static function init(api:String):Void
	{
		ng = NG.create(api);
		ng.requestLogin();
	}
	
	public static function postScore(score:Int, board:String):Void
	{
		if (ng != null && ng.loggedIn)
		{
			ng.callComponent(ng.scoreBoards.postScore(board, score));
		}
	}
	
	public static function unlockMedal(medal:String):Void
	{
		if (ng != null && ng.loggedIn)
		{
			ng.callComponent(ng.medals.unlock(medal));
		}
	}
	#else
	public static function init(api:String):Void {}
	public static function postScore(score:Int, board:String):Void {}
	public static function unlockMedal(medal:String):Void {}
	#end
}