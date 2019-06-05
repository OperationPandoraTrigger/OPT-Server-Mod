@if (@X)==(@Y) @end /* harmless hybrid line that begins a JScript comment
@goto :batch
:::
:::SLEEP.BAT  msec  [%time%]
:::SLEEP.BAT  /?
:::
:::  Suspend processing for msec milliseconds. The optional %time% argument
:::  can be added to improve timing accuracy. If called within a FOR loop,
:::  then !time! should be used instead, after enabling delayed expansion.
:::
:::  There is a startup time for SLEEP.BAT that limits the shortest delay
:::  possible. The startup time varies from machine to machine. Delays longer
:::  than the minimum are usually accurate to within 10 msec if the %time%
:::  argument is provided. One exception is when SLEEP.BAT is called the
:::  instant before changing from standard to daylight savings time, in which
:::  case the delay is extended by the startup time. The other exception occurs
:::  when changing from daylight savings to standard, in which case the delay
:::  never exceeds the startup time.
:::
:::  A single /? argument displays this help.
:::
:::  SLEEP.BAT Version 1.0 - written by Dave Benham
:::  https://stackoverflow.com/questions/29732878/delay-a-batch-file-in-under-a-second/29879492#29879492

============= :Batch portion ===========
@echo off
if "%~1" equ "/?" (
  for /f "tokens=* delims=:" %%A in ('findstr "^:::" "%~f0"') do @echo(%%A
  exit /b 0
) else cscript //E:JScript //nologo "%~f0" %* %time%
exit /b

============ JScript portion ==========*/
try {
  var arg2 = WScript.Arguments.Item(1).split(/[:.,]/);
  var start = new Date();
  if (start.getHours()<Number(arg2[0])) start.setDate( start.getDate()-1 );
  start.setHours( Number(arg2[0]),
                  Number(arg2[1]),
                  Number(arg2[2]),
                  Number(arg2[3])*10
                );
  var delay = Number(WScript.Arguments.Item(0));
  var adjustedDelay = delay - ((new Date())-start);
  if (adjustedDelay>0) WScript.sleep( (adjustedDelay>delay) ? delay : adjustedDelay );
  WScript.Quit(0);
} catch(e) {
  WScript.Stderr.WriteLine("SLEEP.BAT - Invalid call");
  WScript.Quit(1);
}
