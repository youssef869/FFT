function T = fft8_dif_types(dt)
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
        
        % Output
        T.X    = fi([], 1, 5 + 7, 7);
end

end
