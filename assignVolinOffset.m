function offset = assignVolinOffset(x, offsetmax)
% This function can assign Volin-like offsets to a dataset assuming a
% Gaussian distribution.
% Inputs:
% x -- input data array.
% offsetmax -- the maximum peak
pd = fitdist(x, "Normal");
mu = pd.mu;
sigma = pd.sigma;

ppeak = pdf(pd, mu); % normalisation term

% for range within 3*sigma
ymax = mu + 3*sigma;
ymin = mu - 3*sigma;
yrange = linspace(ymin, ymax, 12); % number of bins

offset = zeros(size(x));

for icnt = 1:length(yrange) - 1 
    mid = (yrange(icnt) + yrange(icnt + 1))/2;

    yoffset = pdf(pd, mid) / ppeak * offsetmax;
    
    xidx = x > yrange(icnt) & x < yrange(icnt+1);
    if sum(xidx) > 1
        offset(xidx) = linspace(-yoffset, yoffset, sum(xidx));
    end
end

end