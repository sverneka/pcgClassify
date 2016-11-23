function markovFeatures  = getMarkovFeatures(recordName, noOfFeatures, featThresh)
load('Springer_B_matrix.mat');
load('Springer_pi_vector.mat');
load('Springer_total_obs_distribution.mat');

springer_options   = default_Springer_HSMM_options;
[PCG, Fs1, nbits1] = wavread([recordName '.wav']);  % load data
PCG_resampled      = resample(PCG,springer_options.audio_Fs,Fs1); % resample to springer_options.audio_Fs (1000 Hz)

%% Running runSpringerSegmentationAlgorithm.m to obtain the assigned_states
[assigned_states] = runSpringerSegmentationAlgorithm(PCG_resampled, springer_options.audio_Fs, Springer_B_matrix, Springer_pi_vector, Springer_total_obs_distribution, false);

features  = extractFeaturesMatForEachHeartBeat(assigned_states,PCG_resampled, noOfFeatures, featThresh);
encodedFeat = getEncodedFeat(features);

noOfStates = power(2,noOfFeatures);
markovFeatures = getMarkovTransProb(encodedFeat,noOfStates);
end
