function T = fft64_dif_types(dt)
% Type table for fft8_dit signals

switch dt
    case 'double'
        % Input
        T.x    = double([]);
        
        % Twiddle factors
        T.W    = double([]);
        
        % Stage 1 signals
        T.stg1 = double([]);
        
        % Stage 2 signals
        T.stg2 = double([]);

        % Stage 3 signals
        T.stg3 = double([]);
        
        % Stage 4 signals
        T.stg4 = double([]);

        % Stage 5 signals
        T.stg5 = double([]);
        
        % Stage 6 signals
        T.stg6 = double([]);
        
        % Output
        T.X    = double([]);
        
    case 'single'
        % Input
        T.x    = single([]);
        
        % Twiddle factors
        T.W    = single([]);
        
        % Stage 1 signals
        T.stg1 = single([]);
        
        % Stage 2 signals
        T.stg2 = single([]);

        % Stage 3 signals
        T.stg3 = single([]);
        
        % Stage 4 signals
        T.stg4 = single([]);

        % Stage 5 signals
        T.stg5 = single([]);
        
        % Stage 6 signals
        T.stg6 = single([]);

        % Output
        T.X    = single([]);

    case 'FxPt'
        % Input
        T.x    = fi([], 1, 4 + 8, 8);
        
        % Twiddle factors
        T.W    = fi([], 1, 2 + 10, 10);
        
        % Stage 1 signals
        T.stg1 = fi([], 1, 4 + 8, 8);
        
        % Stage 2 signals
        T.stg2 = fi([], 1, 5 + 7, 7);
  
         % Stage 3 signals
        T.stg3 = fi([], 1, 5 + 7, 7);
        
        % Stage 4 signals
        T.stg4 = fi([], 1, 6 + 6, 6);

        % Stage 5 signals
        T.stg5 = fi([], 1, 6 + 6, 6);
        
        % Stage 6 signals
        T.stg6 = fi([], 1, 7 + 5, 5);  
        
        % Output
        T.X    = fi([], 1, 7 + 5, 5); 
end

end
