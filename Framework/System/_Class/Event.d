module System._Class.Event;

import System;


public final class Event(T...)
{
	private alias void delegate(T) Handler;
	private Handler[] _value;

	@property
	{
		public int Count() { return cast(int)_value.length; }
	}

	public this()
	{
	}
	
	public this(Event!T value)
	{
		_value ~= value._value;
	}
	
	public this(Handler value)
	{
		_value ~= value;
	}
	
	public void opAddAssign(Handler value)
	{
		_value ~= value;
	}

	public void opAddAssign(Event!T value)
	{
		_value ~= value._value;
	}

	public void opSubAssign(Handler value)
	{
		if (!_value.length)
			return;

		foreach (ref x; _value)
		{
			if (value == x)
				x = null;
		}
	}
	
	public void opSubAssign(Event!T value)
	{
		foreach (x; value._value)
			opSubAssign(x);
	}
	
	public void opCall(T params)
	{
		foreach (x; _value)
			if (x !is null)
				x(params);
	}
}


unittest
{
	class Buttons
	{
		public bool b1, b2, b3, b4;
		
		public void myButton1_click(Object sender, EventArgs e)
		{
			b1 = true;
		}
		
		public void myButton2_click(Object sender, EventArgs e)
		{
			b2 = true;
		}
		
		public void myButton3_click(Object sender, EventArgs e)
		{
			b3 = true;
		}
		
		public void myButton4_click()
		{
			b4 = true;
		}
	}

	Buttons buttons = new Buttons();
	EventHandler event = new EventHandler();

	event += new EventHandler();
	event += new EventHandler((sender, e) { buttons.myButton1_click(sender, e); });
	event += &buttons.myButton2_click;
	event += (sender, e) { buttons.myButton3_click(sender, e); };
	event -= &buttons.myButton2_click;

	event(new Object(), new EventArgs());

	assert(buttons.b1);
	assert(!buttons.b2);
	assert(buttons.b3);
	assert(!buttons.b4);


	alias Event!() TestHandler;
	TestHandler th = new TestHandler();

	assert(!th.Count);
	th += &buttons.myButton4_click;
	assert(th.Count);

	th();
	assert(buttons.b4);
}