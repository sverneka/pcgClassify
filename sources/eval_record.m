function classifyResult = eval_record(recordName)

features  = extractFeatures(recordName);
save('features.mat','features');

%k = 'Classifying with XGBoost'
%[status,classifyResult] = system('python sources/xgBoostClassifyPCG.py')
end
