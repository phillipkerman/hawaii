package
{
	import flash.display.Bitmap;
	import flash.system.Capabilities;
	
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.HorizontalLayoutData;
	import feathers.layout.VerticalLayout;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class MainStarling extends LayoutGroup
	{
		public function MainStarling()
		{
			super();
			
			addChild( new Quad(600,600,0xFF0000));
			var bmp:Bitmap = new Bitmap();
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		public function onTexturesReady():void{
		
			
			//DEMO 2
			if ( true ){
				var img:Image = TextureLookup.getInstance().getImage("weave");
				var holder:LayoutGroup = new LayoutGroup();
				holder.addChild(img);
				var holderLD:AnchorLayoutData = new AnchorLayoutData();
				holderLD.horizontalCenter = 0;
				holder.layoutData = holderLD;
				addChild (img);
			}
			
			//DEMO 3
			if ( true ){
				var button:Button = new Button();
				button.defaultSkin = TextureLookup.getInstance().getImage("settings_day");
				button.downSkin = TextureLookup.getInstance().getImage("settings_day_down");
				addChild(button);
			}
			
			//DEMO 4
			if ( true ){
			
				this.layout = new AnchorLayout();
				this.autoSizeMode = LayoutGroup.AUTO_SIZE_MODE_STAGE;
				
				
				var topRightLD:AnchorLayoutData = new AnchorLayoutData();
				topRightLD.right = 30;
				topRightLD.top = 30;
				button.layoutData = topRightLD;  //requires "button" from demo 3
			}
			
			
			//DEMO 5
			if ( true ){
				var myListExample:ListExample = new ListExample();
				var underImageLD:AnchorLayoutData = new AnchorLayoutData();
				underImageLD.top = 0;
				underImageLD.topAnchorDisplayObject = img;
				
				
				
				underImageLD.left = underImageLD.right = 0;
				
				myListExample.layoutData = underImageLD;
				addChild(myListExample);
			}
			
			
			//DEMO 6
			if ( true ){
				var clipWithButtons:ClipWithButtons = new ClipWithButtons();
				var bottomJustLD:AnchorLayoutData = new AnchorLayoutData();
				bottomJustLD.bottom=0;
				clipWithButtons.layoutData = bottomJustLD;
				addChild( clipWithButtons );
				
				addEventListener("myEvent", handleMyEvent);
			}
			
			
			
			//DEMO 7
			if ( true ){
				holder.x = 0-img.width;
				var tween:Tween = new Tween(holder, 2, Transitions.EASE_IN_OUT);
				tween.animate("x", 0);
				Starling.juggler.add(tween);
			}
			
			
			
			// DEMO 8
			if ( true ) {
				var flashBasedGroup:FlashBasedGroup = new FlashBasedGroup();
				addChild(flashBasedGroup);
			}
			
		}
		
		private function handleMyEvent(evt:Event):void
		{
			trace( evt.data.name );
		}		
		
				
		
		
		
		
		private function inchesToPixels(inches:Number):Number
		{
			return Capabilities.screenDPI*inches;				
		}
		
		
		public function onTexturesRestored():void
		{
			trace("onTexturesRestored");
		}
		
		public function someCustomFunctionInMainStarling():void
		{
			
		}
	}
}