function markovFeatures = getMarkovTransProb(encodedFeat,noOfStates)

markovMatrix = zeros(noOfStates, noOfStates);

for i=1:length(encodedFeat)-1
	ip = encodedFeat(i);
	ip1 = encodedFeat(i+1);
	markovMatrix(ip,ip1) = markovMatrix(ip,ip1) + 1;
end


%markovMatrix = markovMatrix./max(1.0,1.0*sum(markovMatrix,2));
markovMatrix = bsxfun(@rdivide,markovMatrix,sum(markovMatrix,2));
markovMatrix(isnan(markovMatrix)) = 0;
markovFeatures = zeros(1,noOfStates*noOfStates);

for i=1:noOfStates
	markovFeatures((i-1)*noOfStates+1:i*noOfStates) = markovMatrix(i,:);
end
end
