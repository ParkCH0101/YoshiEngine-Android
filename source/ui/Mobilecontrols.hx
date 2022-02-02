package ui;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;

import ui.FlxVirtualPad;
import ui.Hitbox;



class Mobilecontrols extends FlxSpriteGroup
{
	public var mode:ControlsGroup = HITBOX;

	public var _hitbox:Hitbox;
	public var _virtualPad:FlxVirtualPad;

	var config:Config;

	public function new() 
	{
		super();

		switch (mode)
		{
			case HITBOX:
				_hitbox = new Hitbox();
				add(_hitbox);

			case DEFAULT:
				_hitbox = new Hitbox();
				add(_hitbox);
		}
	}

	function initVirtualPad(vpadMode:Int) 
	{
		switch (vpadMode)
		{
			case 1:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
			case 2:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
				_virtualPad = config.loadcustom(_virtualPad);
			default: // 0
				_virtualPad = new FlxVirtualPad(RIGHT_FULL, NONE);
		}
		
		_virtualPad.alpha = 0.75;
		add(_virtualPad);	
	}


	public static function getModeFromNumber(modeNum:Int):ControlsGroup {
		return switch (modeNum)
		{
			case 0: VIRTUALPAD_RIGHT;
			case 1: VIRTUALPAD_LEFT;
			case 2: KEYBOARD;
			case 3: VIRTUALPAD_CUSTOM;
			case 4:	HITBOX;

			default: HITBOX;

		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	KEYBOARD;
	VIRTUALPAD_CUSTOM;
	HITBOX;
}
