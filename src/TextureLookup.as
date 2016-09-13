package
{
	import flash.display3D.Context3DTextureFormat;
	import flash.filesystem.File;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class TextureLookup
	{
		
		//============ SINGLETON CORE
		private static var _instance:TextureLookup;
		private var _assetManager:AssetManager;
		
		public function TextureLookup  ( enforcer:TextureSingletonEnforcer ){
			
		}
		
		
		public function init(initialLoadCompleteFunc:Function, 
							 texturesRestoredFunc:Function):void{
			
			if ( _assetManager ){
				_assetManager.dispose();
				_assetManager.purge();
			}
			_assetManager = new AssetManager( 1, false );
			//_assetManager.textureFormat = Context3DTextureFormat.BGRA_PACKED;
			_assetManager.verbose = true;
			_assetManager.addEventListener(Event.TEXTURES_RESTORED, texturesRestoredFunc);
			
			var appDir:File = File.applicationDirectory;
			_assetManager.enqueue( appDir.resolvePath("img/") );
			
			
			try{
				
				_assetManager.loadQueue(function (ratio:Number):void{
					if ( ratio == 1 ){	
						initialLoadCompleteFunc();
					}
				});
				
			} catch(e:Error){
				//
			}
			
			
			
		}
		
		public function getImage( name:String ):Image
		{
			return new Image(getTexture(name));
		}
		
		
		//addChild(new Image(TextureLookup.getInstance().getTexture('green_dot')));
		public function getTexture( name:String ):Texture{
			
			
			var texture:Texture = _assetManager.getTexture(name);
			if ( !texture ){
				trace("can't find " + name );
				return Texture.empty(100,100);
			}
			return texture;
			
		}
		public static function getInstance():TextureLookup{
			if ( _instance == null ) {
				_instance = new TextureLookup ( new TextureSingletonEnforcer() );
			}
			return _instance;
		}
		//===============END SINGLETON
		
		
		
	}
}

//internal class
class TextureSingletonEnforcer{
}