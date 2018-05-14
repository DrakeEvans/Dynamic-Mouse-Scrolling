#MaxHotKeysPerInterval 100000
#SingleInstance Force

;This sc ript provides exponential mouse scrolling speeds using a discrete exponential function

firstThreshold := 200 ;Time in milliseconds
secondThreshold := 45 ;Time in milliseconds
secondSpeedMultiplier := 3 ;Multiplies default mouse scroll speed
thirdSpeedMultiplier := 6 ;Multiplies default mouse scroll speed

;It would be nice to implement a continuous speed curve by solving for an x^2 polynomial function, Guassian elimination to solve etc....

WheelUp:: ;This will be triggered whenever the system recieves a scrollup signal
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


