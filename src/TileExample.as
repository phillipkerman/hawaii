package
{
	import feathers.controls.LayoutGroup;
	import feathers.layout.AnchorLayout;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class TileExample extends LayoutGroup
	{
		public static const COLOR_RED:Number = 0xFF0000;
		public static const COLOR_GREEN:Number = 0x00FF00;
		public static const COLOR_BLUE:Number = 0x0000FF;
		
		public function TileExample(p_item:Object, h:Number, w:Number)
		{
			super();
			
			this.backgroundSkin = new Quad(20,20,p_item.myColor);
			
			this.height = h;
			this.width = w;
			
			//divider
			var q:Quad = new Quad(w,1,0);
			q.y = h-1;
			addChild( q );
			
		}
		
	}
}