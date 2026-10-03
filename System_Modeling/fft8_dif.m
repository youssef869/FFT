function X = fft8_dif(x, T) %#codegen
% N = 8 FFT (DIF radix-2)
% Natural-order input, natural-order output (via bit reversal)

% coder.extrinsic('hex');

% ---- Twiddle Factors ----
W = cast([1, ...
          0.707 - 0.707j, ...
          -1j, ...
          -0.707 - 0.707j], 'like', T.W);

% % Print real/imag in hex (two’s complement)
% for k = 1:length(W)
%     Wr = hex(real(W(k)));
%     Wi = hex(imag(W(k)));
%     fprintf('W%d = Re: %s, Im: %s\n', k-1, Wr, Wi);
% end



% ---------------- Stage 1 ----------------
stg1 = cast(complex(zeros(8,1)), 'like', T.stg1);

stg1(1) = x(1) + x(5);
stg1(5) = (x(1) - x(5)) * W(1);

stg1(2) = x(2) + x(6);
stg1(6) = (x(2) - x(6)) * W(2);

stg1(3) = x(3) + x(7);
stg1(7) = (x(3) - x(7)) * W(3);

stg1(4) = x(4) + x(8);
stg1(8) = (x(4) - x(8)) * W(4);

% ---------------- Stage 2 ----------------
stg2 = cast(complex(zeros(8,1)), 'like', T.stg2);

stg2(1) = stg1(1) + stg1(3);
stg2(3) = (stg1(1) - stg1(3)) * W(1);

stg2(2) = stg1(2) + stg1(4);
stg2(4) = (stg1(2) - stg1(4)) * W(3);

stg2(5) = stg1(5) + stg1(7);
stg2(7) = (stg1(5) - stg1(7)) * W(1);

stg2(6) = stg1(6) + stg1(8);
stg2(8) = (stg1(6) - stg1(8)) * W(3);

% ---------------- Stage 3 ----------------
stg3 = cast(complex(zeros(8,1)), 'like', T.X);

stg3(1) = stg2(1) + stg2(2);
stg3(2) = stg2(1) - stg2(2);

stg3(3) = stg2(3) + stg2(4);
stg3(4) = stg2(3) - stg2(4);

stg3(5) = stg2(5) + stg2(6);
stg3(6) = stg2(5) - stg2(6);

stg3(7) = stg2(7) + stg2(8);
stg3(8) = stg2(7) - stg2(8);

% ---------------- Bit-reversal ----------------
X = stg3;

end
