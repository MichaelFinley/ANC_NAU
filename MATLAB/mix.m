function [output,Fs] = mix(input1,input2,level1,level2)
%for our applcation, we are assuming we'll only deal with mono signals so
%we will develop our function to process all tracks like they are mono,
%when it receives a stereo track (with identical channels) it selects the 
%left channel and uses that as a "mono" channel

%take in audio files
[input1, Fs1] = audioread(input1);
[input2, Fs2] = audioread(input2);

%determine mono/stereo
[m1,n1] = size(input1);
[m2,n2] = size(input2);

if n1 == 2 %if two channels, parse
    input1_left = input1(:,1); %left channel
    input1_right = input1(:,2); %right channel, this gets ignored
elseif n1 == 1 %if one channel, match channels
    input1_left = input1;
    input1_right = input1;
end
if n2 == 2 %if two channels, parse
    input2_left = input2(:,1); %left channel
    input2_right = input2(:,2); %right channel, this gets ignored
elseif n2 == 1 %if one channel, match channels
    input2_left = input2;
    input2_right = input2;
end

%Resample at higher frequency
if Fs1 > Fs2
    input2_left = resample(input2_left, Fs1, Fs2);
    Fs = Fs1;
elseif Fs2 > Fs1
    input1_left = resample(input1_left, Fs2, Fs1);
    Fs = Fs2;
else 
    Fs = Fs1; %to guarantee output variable Fs is assigned
end

%determine which input is longer
size1 = numel(input1_left);
size2 = numel(input2_left);
%pad zeros accordingly
if size1 > size2
    padsize = size1 - size2;
    input2_left = padarray(input2_left,padsize,'post');
elseif size2 > size1
    padsize = size2 - size1;
    input1_left = padarray(input1_left,padsize,'post');
end

%dB levels converted to raw gain value
input1_level = 10^(level1/20);
input2_level = 10^(level2/20);

%mixing equation for output
output = (input1_left*input1_level) + (input2_left*input2_level);
end