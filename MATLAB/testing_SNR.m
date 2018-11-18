%Please excute testing_noise_cancel.m before testing SNR 
%Generate the Result.wav flie
result=noise_cancel('test_file.wav','10secatminute11.wav');
audiowrite('test_Result.wav', result, Fs);

%Metric for SNR before cancellation
SNR('spkr0.wav','test_file.wav');

%Metric for SNR after cancellation
SNR('spkr0.wav','test_Result.wav');




