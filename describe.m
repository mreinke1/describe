function [sum_stat, column_drop] = describe(array)
%function [sum_stat] = describe(array)
% Returns a table with column wise summary statistics of the input matrix
% or table.
% Important: summary statistics are performed column wise.
%
% Syntax:
%	- sum_stat = describe(array)
%
% Input:
%	- array: (nObs-by-var) data matrix or table with numeric values
%
% Output:
%	- sum_stat (var-by-8): summary statistic for each model pair. 
%   Function returns the following summary statistics:
%   count, mean, std, min, 25%, 50%, 75% and max values
%   - column_drop: contains the column indices of the column which has been
%   droped in the summary statistic because the variables where not
%   numeric. Only returned if table is input.

  % Check input type
  if and(~isa(array,'double'), ~isa(array,'table'))
      
      msg = 'Input type needs to be a double or table.';
      error(msg)
      
  end

  if isa(array,'table')
         
      % Only calculate summary statistics for numeric values
      idx_numeric = cellfun(@isnumeric,table2cell(array(1,:)));
      
      column_drop = find(idx_numeric == 0);
      
      % Drop columns which do not contain numeric values
      array(:,idx_numeric == 0) = [];          
      
      % Extract variable names
      array_var_name = array.Properties.VariableNames;
      
      % Convert to matrix
      array = table2array(array);
      
      % Calculate column wise summary statistics
      sum_stat = table(sum(~isnan(array),1)', mean(array,1,'omitnan')', nanstd(array,1)', nanmin(array,[],1)',...
                    quantile(array,0.25,1)',...
                    quantile(array,0.5,1)',...
                    quantile(array,0.75,1)',...
                    nanmax(array,[],1)');
      
      % Add variables names back to results table
      sum_stat.Properties.RowNames = array_var_name;
      sum_stat.Properties.VariableNames = {'Count','Mean','Std','Min', '25%', '50%', '75%','Max'};


  elseif isa(array,'double')
      
      % Calculate column wise summary statistics of matrix
      sum_stat = table(sum(~isnan(array),1)', mean(array,1,'omitnan')', nanstd(array,1)', nanmin(array,[],1)',...
                    quantile(array,0.25,1)',...
                    quantile(array,0.5,1)',...
                    quantile(array,0.75,1)',...
                    nanmax(array,[],1)');

      sum_stat.Properties.VariableNames = {'Count', 'Mean','Std','Min', '25%', '50%', '75%','Max'};
      
  end
