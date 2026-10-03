clear; clc;

T = fft64_dif_types('FxPt');  

% DESIGN PARAMETERS
N       = 64;          
nSeeds  = 10000;      

errors = zeros(1, nSeeds);      
sqnr_values = zeros(1, nSeeds); 

% -----------------------------
% Open files once (binary dump)
% -----------------------------
fid_in_real  = fopen('real_input.txt',  'w');
fid_in_imag  = fopen('imag_input.txt',  'w');
fid_out_real = fopen('real_output.txt', 'w');
fid_out_imag = fopen('imag_output.txt', 'w');

for seed = 1:nSeeds
    rng(seed);

    % Generate random complex signal
    x   = randn(N,1) + 1i*randn(N,1);
    xfi = cast(x, 'like', T.x);

    % --- Only dump first 50 seeds ---
    if seed <= 50
        % Write input data in binary
        for k = 1:N
            fprintf(fid_in_real, '%s\n', get_bin(real(xfi(k))));
            fprintf(fid_in_imag, '%s\n', get_bin(imag(xfi(k))));
        end
    end

    % --- Build MEX on first iteration ---
    if seed == 1
        buildInstrumentedMex fft64_dif -args {xfi, T};
    end

    % --- Run quantized FFT ---
    X = fft64_dif_mex(xfi, T);

    % --- Only dump outputs for first 50 seeds ---
    if seed <= 50
        for k = 1:N
            fprintf(fid_out_real, '%s\n', get_bin(real(X(k))));
            fprintf(fid_out_imag, '%s\n', get_bin(imag(X(k))));
        end
    end

    br = bitrevorder(1:N);
    X = X(br);

    % --- MATLAB reference FFT ---
    X_expected = fft(x);

    % --- Error + SQNR ---
    errors(seed) = norm(double(X) - X_expected);
    sig_pow = sum(abs(X_expected).^2);
    noise_pow = sum(abs(double(X) - X_expected).^2);
    sqnr_values(seed) = 10*log10(sig_pow/noise_pow);


end

% Close all files AFTER loop
fclose(fid_in_real);
fclose(fid_in_imag);
fclose(fid_out_real);
fclose(fid_out_imag);

% --- Average SQNR ---
avg_sqnr = mean(sqnr_values);
fprintf('Average SQNR : %.2f dB\n', avg_sqnr);

% --- Plot SQNR ---
figure;
plot(1:nSeeds, sqnr_values, 'b-', 'LineWidth', 1.5);
xlabel('Test case index (seed)');
ylabel('SQNR (dB)');
title('SQNR vs Seed');
grid on;

% --- Plot Error ---
figure;
plot(1:nSeeds, errors, 'r-', 'LineWidth', 1.5);
xlabel('Test case index (seed)');
ylabel('Error');
title('Error vs Seed');
grid on;

function bin_str = get_bin(value)
    if isfi(value)
        % Fixed-point numbers: direct bin string
        bin_str = value.bin;
    elseif isfloat(value)
        % Floating-point: pack bytes -> binary
        bytes = typecast(value, 'uint8');
        bin_str = reshape(dec2bin(bytes,8).',1,[]);
    else
        % Integers
        bin_str = dec2bin(value);
    end
end
