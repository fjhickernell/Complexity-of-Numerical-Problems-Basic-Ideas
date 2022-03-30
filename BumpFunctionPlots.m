%% Bump Functions for Computational Complexity

close all
gail.InitializeWorkspaceDisplay
bump = @(x,a,b) (x-a).^2 .* (b-x).^2 .*(30/(b-a)^5);

rng(29)
n = 5;
xdata = rand(n,1);

figure(1)
plot(xdata,zeros(n,1),'.')
hold on

sortx = sort(xdata);
[~,wh] = max(diff(sortx));
a = sortx(wh);
b = sortx(wh+1);
xbump = [0; a + (b-a)*(0:0.001:1)'; 1];
ybump = [0; bump(xbump(2:end-1),a,b); 0];
plot(xbump,ybump,'color',MATLABOrange)
box off
h = gca;
h.XTick = [];
h.YAxis.Visible = 'off';
xshift = 0.02;
yshift = 0.3;
for ii = 1:n
   text(xdata(ii)-xshift,-yshift,['\(x_' int2str(ii) '\)'])
end

