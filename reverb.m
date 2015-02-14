%%this is asimple matlab  code to generate reverb using delay
song=wavread('%Path%'); %% Mention  file path 
left=song(:,1);
right=song(:,1);
z=zeros((44100/8),1);%Delay 44100/8 samples
l=cat(1,z,left); %Modified left channel delay 5513 samples (zero padded)
r=cat(1,right,z);%zero padding at end of right channel
reverb=cat(2,l,r);%modified stereo track
sound(reverb,44100)
%% start: 0, 4410, 6616,8822.
%% endzro: 8822, 4412,2206,0
%% Modification delay
zs1=zeros(4410,1);
zs2=zeros(6616,1);
zs3=zeros(8822,1);
%%end zeropadding
ze0=zeros(8822,1);
ze1=zeros(4412,1);
ze2=zeros(2206,1);
%left channel delay
l1=left;
l2=cat(1,zs1,left);
l3=cat(1,zs2,left);
l4=cat(1,zs3,left);
l1=cat(1,left,ze0);
%end padding
l2=cat(1,l2,ze1);
l3=cat(1,l3,ze2);
l4=cat(1,zs3,left);
%right channel delay
r1=right;
r2=cat(1,zs1,right);
r3=cat(1,zs2,right);
r4=cat(1,zs3,right);
%end padding
r1=cat(1,right,ze0);
r2=cat(1,r2,ze1);
r3=cat(1,r3,ze2);
%%left right final  channels
play=l1+l2+l3+l4;
play2=r1+r2+r3+r4;
final=cat(2,play,play2);
sound(final,44100);
wavwrite(final,44100,32,'delyecho.wav') %%output file written to current directory
