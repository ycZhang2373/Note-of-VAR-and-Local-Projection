delete SW_Model.log
delete SW_Model.m
delete SW_Model_dynamic.m
delete SW_Model_results.mat
delete SW_Model_set_auxiliary_variables.m
delete SW_Model_static.m
delete('+SW_Model/*') % Dynare 4.6+
try
	rmdir('SW_Model/Output')
	rmdir('SW_Model','s')
	rmdir('+SW_Model') % Dynare 4.6+
catch
end
load polfunction
clc