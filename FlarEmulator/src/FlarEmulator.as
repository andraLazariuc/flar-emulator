
/** 
 * <p>Original Author:  Jesse Freeman</p>
 * <p>Class File: FlarEmulator.as</p>
 * 
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 * 
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 * 
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 * 
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 *
 * <p>Revisions<br/> 
 *      2.0  Initial version April 29, 2009</p>
 *
 */
 
package
{
	import com.flashbum.CPodContainer;

	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	[SWF( backgroundColor="#000000", framerate="31" )]

	public class FlarEmulator extends FLARVision
	{

		protected var label:TextField;
		protected static const defaultText:String = "Click to change to debug mode - Debug is currently to ";

		/**
		 * 
		 */		
		public function FlarEmulator()
		{
			super( );
		}

		/**
		 * Calls the super's init then creates our debug display and adds a
		 * click listener to the stage. 
		 * 
		 */		
		override protected function init():void
		{
			debug = true;
			super.init( );
			createDebugDisplay( );
			stage.addEventListener( MouseEvent.CLICK, onClick );
		}

		/**
		 * Creates our 3d object the cPod.
		 * 
		 */		
		override protected function create3dObjects():void
		{
			var cpod:CPodContainer = new CPodContainer( );
			cpod.attachTo( baseNode );
		}

		/**
		 * Switches the active source from the CardEmulator to the Webcam.
		 * 
		 */		
		public function switchSource():void
		{
			if(debug)
			{
				if(contains( cardEmulator ))
				{
					removeChild( cardEmulator );
					cardEmulator = null;
				}	
			}
			else
			{
				video = null;
				webcam = null;				
			}
   			
			debug = ! debug;
			label.text = defaultText + debug;
			createCamera( );
		}

		/**
		 * Sets up a display to let us know what mode we are in.
		 * 
		 */		
		protected function createDebugDisplay():void
		{
			label = new TextField( );
			label.defaultTextFormat = new TextFormat( "Arial", 12, 0x000000, true );
			label.autoSize = "right";
			label.selectable = false;
			label.background = true;
			label.text = defaultText + debug;
   			
			label.x = stage.stageWidth - label.width;
			addChild( label );
		}

		/**
		 * Class switch source when a click event is recieved. 
		 * @param event
		 * 
		 */		
		protected function onClick(event:MouseEvent):void
		{
			switchSource( );
		}
	}
}