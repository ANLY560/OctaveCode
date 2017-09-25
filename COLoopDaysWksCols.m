% Loop to create matrix with CO daily averages
CO_dailyAvg = zeros(1:365,1);
for i = 1:365,
   temp = mean(COmatx(1:24,i));
   CO_dailyAvg(i) = temp;
end

% Loop to put daily averages in matrix by weeks
k=1;
for i = 1:52,
   for j = 1:7,
      wk(j,i) = CO_dailyAvg(k);
      k++;
   end
end

% Create figure of daily variation
figure
hold on
k=1;
for i = 1:52,
   for j = 1:7,
      temp(j)=CO_dailyAvg(k);
      k++;
   end
   wkAvg(i) = mean(temp(1:7));
   plot(wk(1:7,i), ':')
end

CO_dailyAvg = CO_dailyAvg';

% Develop matrix to calc and plot average for day of week for year

   Wed = mean(wk(1,1:52));
   Thurs = mean(wk(2,1:52));
   Fri = mean(wk(3,1:52));
   Sat = mean(wk(4,1:52));
   Sun = mean(wk(5,1:52));
   Mon = mean(wk(6,1:52));
   Tue = mean(wk(7,1:52));

plot(x=1,Wed, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=2,Thurs, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=3,Fri, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=4,Sat, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=5,Sun, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=6,Mon, 'ro', 'markersize', 10, 'markerfacecolor', 'r')
plot(x=7,Tue, 'ro', 'markersize', 10, 'markerfacecolor', 'r')

title('Variation in Measured Levels per Day of the Week')
xlabel('Day of the Week (1 = Wed)')
ylabel('Average Measured Levels of CO')

hold off
