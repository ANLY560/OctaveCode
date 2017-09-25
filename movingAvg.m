windowSize = input("Enter a number for the window size:  ")
j = 1:windowSize;
CO_10_mean(1:(365-(windowSize-1))) = 0;
CO_20_mean(1:(365-(windowSize-1))) = 0;

for i = 1:(365-(windowSize-1))

   temp10 = mean(CO_10(j));
   temp20 = mean(CO_20(j));
   j = j + 1;
   i++;
   CO_10_mean(i) = temp10;
   CO_20_mean(i) = temp20;
end
