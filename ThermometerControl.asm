#start=Thermometer.exe#

Check100:
in al,125
cmp al,100
jae Giam
jmp Check70
Check70:
cmp al,70
jbe Tang
jmp Check100
Giam:
mov al,0
out 127,al
jmp Check100
Tang:
mov al,1
out 127,al
jmp Check100