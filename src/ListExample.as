package
{
	import flash.utils.Dictionary;
	
	
	import feathers.controls.LayoutGroup;
	import feathers.controls.List;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.renderers.IListItemRenderer;
	import feathers.data.ListCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	
	import starling.display.Quad;
	
	public class ListExample extends LayoutGroup
	{
		private var myList:List;
		private var cachedAccessories:Dictionary;
		private var myCollection:ListCollection;
		
		public function ListExample()
		{
			super();
			this.backgroundSkin = new Quad(10,10,0xaaaaaa);
			this.layout = new AnchorLayout();
		}
		
		override protected function initialize():void
		{
			cachedAccessories = new Dictionary(true);
			
			var fullWidthLD:AnchorLayoutData = new AnchorLayoutData();
			fullWidthLD.left = fullWidthLD.right = 0;
			
			
			
			myList = new List();
			myList.horizontalScrollPolicy = List.SCROLL_POLICY_OFF;
			myList.verticalScrollPolicy = List.SCROLL_POLICY_ON;
			myList.layoutData = new AnchorLayoutData(0,0,0,0);
			myList.height = 400;
			
			
			
			
			var itemRendererFactory:Function = function ():IListItemRenderer
			{
				var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
				
				
				renderer.labelFunction  = function (item:Object):String{ 
					return ""; 
				};
				
				
				renderer.accessoryFunction = function ( item:Object ):LayoutGroup
				{
					
					//see if we already have this accessory
					if(item in cachedAccessories) {
						return cachedAccessories[item];
					}
					
					var accessory:LayoutGroup = new TileExample(item, 80, stage.stageWidth);
					accessory.layoutData = fullWidthLD;
					
					//save the accessory in dictionary
					cachedAccessories[item] = accessory;
					
					
					return accessory;
					
				};
				
				renderer.stopScrollingOnAccessoryTouch = false;
				return renderer;
				
			}
			
			myList.itemRendererFactory = itemRendererFactory;
		
		
			//make and populate collection
			myCollection = new ListCollection();
			myCollection.push( {myColor:TileExample.COLOR_RED} );
			myCollection.push( {myColor:TileExample.COLOR_GREEN} );
			myCollection.push( {myColor:TileExample.COLOR_BLUE} );
			
			//put a bunch of random ones in collection
			var colors:Array = [TileExample.COLOR_RED,
								TileExample.COLOR_GREEN,
								TileExample.COLOR_BLUE];
			for(var i:int=0; i<2000; i++){
				var r:int = Math.floor(Math.random()*3);
				myCollection.push( {myColor:colors[r]} );
			}
			
			
			//associate collection as list's data provider:
			myList.dataProvider = myCollection;
			
			//put list on stage
			addChild( myList );
			
			
		}
		
	}
}