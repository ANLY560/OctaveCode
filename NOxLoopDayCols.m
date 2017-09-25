% Loop to create matrix with 1 column per day
NOxmatx = zeros(24,365);
k=1;
for i = 1:365,
   for j = 1:24,
      NOxmatx(j, i) = NOx(k);
      k++;
   end
end

% Put daily peak values in vectors
NOx_10 = NOxmatx(10,1:365)';
NOx_20 = NOxmatx(20,1:365)';
