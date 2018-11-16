%signals
[audio1, Fs1] = audioread('10secat6_45.wav');
[audio2, Fs2] = audioread('10secatminute11.wav');
[audio3, Fs3] = audioread('10secatminute13.wav');
[audio4, Fs4] = audioread('spkr0.wav'); %this is a mono signal, 16kHz 
audio1_left = audio1(:,1);
audio1_right = audio1(:,2);
audio2_left = audio2(:,1);
audio2_right = audio2(:,2);
audio3_left = audio3(:,1);
audio3_right = audio3(:,2);

ytop = 22050;
                   
T = 1/Fs1;             % Sampling period       
L = length(audio1_left);             % Length of signal
data_fft = fft(audio1_left);
P2 = abs(data_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,3,1)
semilogy(f,P1) 
title('Single-Sided Amplitude Spectrum of Sample 1')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 ytop ])

T = 1/Fs1;             % Sampling period       
L = length(audio2_left);             % Length of signal
data_fft = fft(audio2_left);
P2 = abs(data_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,3,2)
semilogy(f,P1) 
title('Single-Sided Amplitude Spectrum of Sample 2')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 ytop ])

T = 1/Fs1;             % Sampling period       
L = length(audio3_left);             % Length of signal
data_fft = fft(audio3_left);
P2 = abs(data_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
subplot(2,3,3)
semilogy(f,P1) 
title('Single-Sided Amplitude Spectrum of Sample 3')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 ytop ])


subplot(2,3,4)
spectrogram(audio1_left,1000,500,1000,Fs1)
subplot(2,3,5)
spectrogram(audio2_left,1000,500,1000,Fs2)
subplot(2,3,6)
spectrogram(audio3_left,1000,500,1000,Fs3)

