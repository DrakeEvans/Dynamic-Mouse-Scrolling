#MaxHotKeysPerInterval 100000
#SingleInstance Force

firstThreshold := 200 ;Time in milliseconds
secondThreshold := 45 ;Time in milliseconds
secondSpeedMultiplier := 3 ;Multiplies default mouse scroll speed
thirdSpeedMultiplier := 6 ;Multiplies default mouse scroll speed

;It would be nice to implement a continuous speed curve by solving for an x^2 polynomial function, Guassian elimination...
coordinates := {} ;Defined as an associative array similar to a dictionary

;define coordinates as x = rate and y = scroll multiplier
;define dictionary with key = x and value = y
firstRate := 1000/firstThreshold ;first Threshold value given in millisecond, this converts the rate to signal/second
coordinates[firstRate] := 1 ;This is implied in as the default, future key:value pairs will use a variable

secondRate := 1000/firstThreshold
coordinates[secondRate] := secondSpeedMultiplier

thirdRate := 1000/thirdThreshold
coordinates[thirdRate] := thirdSpeedMultiplier







WheelUp:: ;This will be triggered whenever the system recieves a scroll
    if (A_TimeSincePriorHotkey > firstThreshold) { ;Time in miliseconds since the last scroll event
        SendInput {WheelUp}
    } else if (A_TimeSincePriorHotkey > secondThreshold) {
        Loop, %secondSpeedMultiplier% {
            SendInput {WheelUp}
        }
    } else {
        Loop, %thirdSpeedMultiplier% {
            SendInput {WheelUp}
        }        
    }
return


WheelDown::
    if (A_TimeSincePriorHotkey > firstThreshold) {  
        SendInput {WheelDown}
    } else if (A_TimeSincePriorHotkey > secondThreshold) {
        Loop, %secondSpeedMultiplier% {
            SendInput {WheelDown}
        }
    } else { ;less than 60
        Loop, %thirdSpeedMultiplier% {
            SendInput {WheelDown}
        }        
    }
return


