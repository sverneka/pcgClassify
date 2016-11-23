import numpy as np
import scipy.io as sio
import xgboost as xgb
import sys

#model1 = xgb.Booster(model_file='model1_mix_0.5.model')
#model2 = xgb.Booster(model_file='model2_mix_0.8.model')
#model3 = xgb.Booster(model_file='model3_mix_0.7.model')
#model4 = xgb.Booster(model_file='model4_mix_0.6.model')
model = xgb.Booster(model_file='pcg_new.model')

test = sio.loadmat('features.mat')
test = test['features']
test = np.array(test)
xgtest = xgb.DMatrix(test)
pred = model.predict(xgtest)

#print pred[0]
#print sys.argv[1]+',1,'+str(pred[0])
if(pred>0.5):
	print sys.argv[1]+',1'
else:
	print sys.argv[1]+',-1'

