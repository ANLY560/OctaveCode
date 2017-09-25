% Loop to create matrix with 1 column per day
COmatx = zeros(24,365);
k=1;
for i = 1:365,
   for j = 1:24,
      COmatx(j, i) = CO(k);
      k++;
   end
end

% Put daily peak values in vectors
CO_10 = COmatx(10,1:365)';
CO_20 = COmatx(20,1:365)';
