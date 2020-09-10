params = load('debugParams.mat');
params = params.params;

contrast = 1;
bulk_in = 2.073e-6;
bulk_out = 6.35e-6;

% matlabEngineCaller_customXY(params,contrast,funcName,funcPath,bulkIn,bulkOut)
funcName = 'DPPC_gaus_mod_as_custLay_resample';
[output,subrough] = matlabEngineCaller_customLayers(params,1,funcName,pwd,bulk_in,bulk_out);

figure(1); clf
plot(output(:,1),output(:,2));
