package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	
	import feathers.controls.LayoutGroup;
	
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class FlashBasedGroup extends LayoutGroup
	{
		public function FlashBasedGroup()
		{
			super();
			
			//make flash sprite
			var flashSprite:Sprite = new Sprite();
			
			//do flash drawing
			flashSprite.graphics.lineStyle(5,0xFF0000);
			flashSprite.graphics.lineTo(100,100);
			flashSprite.graphics.moveTo(100,0);
			flashSprite.graphics.lineTo(0,100);
			
			flashSprite.filters = [ new DropShadowFilter(5) ];
			
			//make bitmapData
			var bd:BitmapData = new BitmapData(100,100, true, 0x000000FF);
			
			//draw the flashSprite
			bd.draw(flashSprite);
			
			//make a bitmap
			var bmp:Bitmap = new Bitmap(bd);
			
			//create an image from texture from bitmap
			var img:Image = new Image(  Texture.fromBitmap(bmp) );
			
			
			//put on stage
			addChild(img);			
			
		}
	}
}