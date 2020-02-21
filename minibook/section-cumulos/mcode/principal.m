%%
addpath(genpath('mfiles'))
M=[
1 0 0 1 1 0 0 0 0 1 0 0;
0 0 0 0 0 0 0 0 0 0 0 0;
0 0 1 1 1 1 1 1 1 1 1 1;
0 1 1 0 0 0 0 0 1 0 0 0;
1 1 0 0 0 0 0 1 1 1 0 0;
1 0 0 0 1 1 1 1 0 1 1 1;
0 0 1 0 0 0 0 0 0 0 0 0;
0 1 1 0 0 0 1 1 0 0 1 1];


Cum=Cumulus(M);
[GMAP ID W]= Cum.calculate_cumulus();
imagesc(GMAP)
colormap(jet)

GMAP
