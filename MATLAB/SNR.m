function snr=SNR(Orisignal,Sout)
% SNR 
%By default all audio is mono, if stereo, only consider left channel
% snr=10*log(sigma2(I2)/sigma2(I2-I1))

%take audio file
[input1,fs1]=audioread(Orisignal);

%determine mono/stereo
[m1,n1] = size(input1);
if n1 == 2 %if two channels, parse
    input1_left = input1(:,1); %left channel
    input1_right = input1(:,2); %right channel, this gets ignored
elseif n1 == 1 %if one channel, match channels
    input1_left = input1;
    input1_right = input1;
end

%signal power
Ps=sum(input1_left.^2);

%Phase inv for original singal
Inv1=-1* input1;
audiowrite('InvOrisignal.wav', Inv1, fs1);

%Obtain noise by mixing Inv Original singal and Sout 
Pn=sum((mix(Sout,'InvOrisignal.wav',0,0)).^2); %noise power

 %metric for SNR
snr=10*log10(Ps/Pn);
disp(['SNR =',num2str(snr),'dB']);

