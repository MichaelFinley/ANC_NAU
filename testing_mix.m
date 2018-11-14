clear;
clc;

[input1, Fs1] = audioread('spkr0.wav');
[input2, Fs2] = audioread('10secatminute11.wav');

[m1,n1] = size(input1);
[m2,n2] = size(input2);

if n1 == 2
    input1_left = input1(:,1); %left channel
    input1_right = input1(:,2); %right channel, this gets ignored
elseif n1 == 1
    input1_left = input1;
    input1_right = input1;
end
if n2 == 2
    input2_left = input2(:,1); %left channel
    input2_right = input2(:,2); %right channel, this gets ignored
elseif n2 == 1
    input2_left = input2;
    input2_right = input2;
end

%interpolation ratio determined by which audio file has greater Fs to ensure
%we upsample not downsample
if Fs1 > Fs2
    input2_left = resample(input2_left, Fs1, Fs2);
    Fs = Fs1;
elseif Fs2 > Fs1
    input1_left = resample(input1_left, Fs2, Fs1);
    Fs = Fs2;
else 
    Fs = Fs1; %to guarantee output variable Fs is assigned
end

size1 = numel(input1_left);
size2 = numel(input2_left);
if size1 > size2
    padsize = size1 - size2;
    input2_left = padarray(input2_left,padsize,'post');
elseif size2 > size1
    padsize = size2 - size1;
    input1_left = padarray(input1_left,padsize,'post');
end

level1 = 0;
level2 = 0;
%dB levels to raw gain value
input1_level = 10^(level1/20);
input2_level = 10^(level2/20);

%mixing equation for output
output = (input1_left*input1_level) + (input2_left*input2_level);

figure;
subplot(3,1,1)
plot(input1_left);
ylim([-1 1])
title('input1')
subplot(3,1,2)
plot(input2_left);
ylim([-1 1])
title('input2')
subplot(3,1,3)
plot(output);
ylim([-1 1])
title('output')

player = audioplayer(output,Fs);
play(player)
% player_orig_song = audioplayer(input1_left,Fs);
% play(player_orig_song)
