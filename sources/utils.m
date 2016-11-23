recordName = '/home/shady/pcg/training/training-a/a0008'

[PCG, Fs1, nbits1] = wavread([recordName '.wav']);  % load data
PCG_resampled      = resample(PCG,springer_options.audio_Fs,Fs1); % resample to springer_options.audio_Fs (1000 Hz)

testData = (PCG_resampled - mean(PCG_resampled))/std(PCG_resampled);
w_pcg = findDetails(testData);
plot(w_pcg(4,1:5000))
figure;
plot(PCG_resampled(1:5000))



x=PCG_resampled
L=length(x);
fs=1000; 
NFFT=2048;	 	 
X=fft(x,NFFT);	 	 
Px=X.*conj(X)/(NFFT*L); %Power of each freq components	 	 
fVals=fs*(0:NFFT/2-1)/NFFT;	 	 
plot(fVals,Px(1:NFFT/2),'b','LineSmoothing','on','LineWidth',1);	 	 
title('One Sided Power Spectral Density');	 	 
xlabel('Frequency (Hz)')	 	 
ylabel('PSD');
