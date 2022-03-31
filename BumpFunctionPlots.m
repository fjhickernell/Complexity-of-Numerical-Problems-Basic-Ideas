%% Bump Functions for Computational Complexity

gail.InitializeWorkspaceDisplay
bump = @(x,a,b) (x-a).^2 .* (b-x).^2; %.*(30/(b-a)^5);

rng(29)
n = 5;
xdata = rand(n,1);

figure(1)
plot(xdata,zeros(n,1),'.')
hold on

[sortx,wh1] = sort(xdata);
[~,wh2] = max(diff(sortx));
a = sortx(wh2);
b = sortx(wh2+1);
xbump = [0; a + (b-a)*(0:0.001:1)'; 1];
ybump = [0; bump(xbump(2:end-1),a,b); 0];
plot(xbump,ybump,'color',MATLABOrange)
box off
h = gca;
h.XTick = [];
h.YAxis.Visible = 'off';
sc = max(ybump);
xshift = 0.02;
yshift = 0.05*sc;
for ii = 1:n
   text(xdata(ii)-xshift,-yshift,['\(x_' int2str(ii) '\)'],'FontSize',30)
end
text(0.05,0.9*sc,['bump\((x,x_' int2str(wh1(wh2)) ...
    ',x_' int2str(wh1(wh2+1)) ')\)'],'FontSize',30);
print('-depsc','IntegrationBump.eps')

