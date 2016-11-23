function encodedFeat = getEncodedFeat(features)

[m,n] = size(features);
encodedFeat = zeros(m,1);
for i=1:n
	encodedFeat = encodedFeat + (features(:,i)*power(2,n-i));
end

encodedFeat = encodedFeat+1;
end
