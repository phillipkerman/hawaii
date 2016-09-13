package
{
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.layout.HorizontalLayout;
	
	import starling.display.Quad;
	import starling.events.Event;
	
	public class ClipWithButtons extends LayoutGroup
	{
		public function ClipWithButtons()
		{
			super();
		}
		
		override protected function initialize():void
		{
			this.backgroundSkin = new Quad(1,1,0xeeeeee);
			
			this.layout = new HorizontalLayout();
			(this.layout as HorizontalLayout).gap = 20;
			
			var settingsButton:Button = new Button();
			settingsButton.defaultSkin = TextureLookup.getInstance().getImage("settings_day");
			settingsButton.downSkin = TextureLookup.getInstance().getImage("settings_day_down");
			addChild(settingsButton);
			settingsButton.addEventListener(Event.TRIGGERED, handleClickSettings);
			
			var sleepButton:Button = new Button();
			sleepButton.defaultSkin = TextureLookup.getInstance().getImage("sleep_day");
			sleepButton.downSkin = TextureLookup.getInstance().getImage("sleep_day_down");
			addChild(sleepButton);
			sleepButton.addEventListener(Event.TRIGGERED, handleClickSleep);
			
			
		
		}
		
		private function handleClickSettings():void
		{
			dispatchEventWith("myEvent",true,  {name:"settings"});
		}
		
		private function handleClickSleep():void
		{
			dispatchEventWith("myEvent",true, {name:"sleep"});
		}
	}
}