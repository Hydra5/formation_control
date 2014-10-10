  %inside_outside_array  = evalin('base', 'inside_outside_array');
  
  X  = evalin('base', 'X');
  Y  = evalin('base', 'Y');
  
  %formation_x = evalin('base', 'formation_x');
  %formation_y = evalin('base', 'formation_y');
  
  %array_length = length(formation_x);
  
  %dist_to_agents matrisini alalim
dist_to_agents = evalin('base', 'dist_to_agents');

  force_matrix = evalin('base', 'force_matrix');
  
  km  = evalin('base', 'km');
 
  n = evalin('base', 'n');
  

  force_matrix(:,3,:) = 0 ; % intermember force sutununu sifirlayalim
  for i = 1 : 1 : n
    for j = 1 : 1 : n
      if(i~=j)
        force_matrix(1,3,i) = force_matrix(1,3,i) + ((X(i) - X(j)) / (dist_to_agents(i,j))^3);
        force_matrix(2,3,i) = force_matrix(2,3,i) + ((Y(i) - Y(j)) / (dist_to_agents(i,j))^3);
      end
    end
    force_matrix(1,3,i) = force_matrix(1,3,i) * km;
    force_matrix(2,3,i) = force_matrix(2,3,i) * km;
  end
  
 assignin('base', 'force_matrix', force_matrix);

