package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.StageOrientationEvent;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF( frameRate="60", backgroundColor="#FFFFFF")]
	
	
	public class MainFlash extends Sprite
	{
		private var starlingInstance:Starling;
		
		public function MainFlash()
		{
			super();
			
			
			//AIR boilerplate
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			//Starling boilerplate
			Starling.multitouchEnabled = true;
			Starling.handleLostContext = true;
			
			starlingInstance = new Starling (MainStarling, 
											 this.stage,
											 getRectForStarling());
			
			//starlingInstance.showStatsAt("left", "bottom", 2 );
			
			
			//wait for root created (OPTIONAL)
			starlingInstance.addEventListener(starling.events.Event.ROOT_CREATED, 
											  onRootCreated);
			
			
			
			starlingInstance.start();
			
			
			//listen for rotation (OPTIONAL)
			stage.addEventListener(flash.events.StageOrientationEvent.ORIENTATION_CHANGE, onOrientationChange);
			
			
		}
		
		
		private function getRectForStarling():Rectangle
		{
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width =  stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			return viewPortRectangle;
		}
		
		private function onRootCreated(event:Object=null):void
		{
			starlingInstance.removeEventListener(starling.events.Event.ROOT_CREATED, onRootCreated);
			
			TextureLookup.getInstance().init(onTexturesReady, onTexturesRestored);
			
			applyOrientChanges();	
		}
		
		
		private function onOrientationChange(evt:Object=null):void
		{
			applyOrientChanges();
		}
		
		private function applyOrientChanges():void
		{
			var viewportRect:Rectangle = getRectForStarling();
			starlingInstance.stage.stageWidth = viewportRect.width;
			starlingInstance.stage.stageHeight = viewportRect.height;
			starlingInstance.viewPort = viewportRect;
			
		}
		
		
		
		private function onTexturesReady():void{
			(Starling.current.stage.getChildAt(0) as MainStarling).onTexturesReady();
		}
		private function onTexturesRestored():void{
			(Starling.current.stage.getChildAt(0) as MainStarling).onTexturesRestored();
		}
		
		
		
	}
}