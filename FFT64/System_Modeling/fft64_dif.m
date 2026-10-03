function X = fft64_dif(x, T) %#codegen
% N = 64 FFT (DIF radix-2)
% coder.extrinsic('hex')

% ---- Twiddle Factors ----
W = cast(exp(-1j * 2 * pi * (0:31)/64), 'like', T.W);

% % Print real/imag in hex (two’s complement)
% for k = 1:length(W)
%     Wr = hex(real(W(k)));
%     Wi = hex(imag(W(k)));
%     fprintf('W%d = Re: %s, Im: %s\n', k-1, Wr, Wi);
% end
% ---------------- Stage 1 ----------------
stg1 = cast(complex(zeros(64,1)), 'like', T.stg1);
for n = 1:32
    stg1(n)    = x(n) + x(n+32);
    stg1(n+32) = (x(n) - x(n+32)) * W(n);
end

% ---------------- Stage 2 ----------------
stg2 = cast(complex(zeros(64,1)), 'like', T.stg2);
for k = 0:1
    base = k*32;
    for n = 1:16
        stg2(base+n)    = stg1(base+n) + stg1(base+n+16);
        stg2(base+n+16) = (stg1(base+n) - stg1(base+n+16)) * W((n-1)*2+1);
    end
end

% ---------------- Stage 3 ----------------
stg3 = cast(complex(zeros(64,1)), 'like', T.stg3);
for k = 0:3
    base = k*16;
    for n = 1:8
        stg3(base+n)    = stg2(base+n) + stg2(base+n+8);
        stg3(base+n+8)  = (stg2(base+n) - stg2(base+n+8)) * W((n-1)*4+1);
    end
end

% ---------------- Stage 4 ----------------
stg4 = cast(complex(zeros(64,1)), 'like', T.stg4);
for k = 0:7
    base = k*8;
    for n = 1:4
        stg4(base+n)    = stg3(base+n) + stg3(base+n+4);
        stg4(base+n+4)  = (stg3(base+n) - stg3(base+n+4)) * W((n-1)*8+1);
    end
end

% ---------------- Stage 5 ----------------
stg5 = cast(complex(zeros(64,1)), 'like', T.stg5);
for k = 0:15
    base = k*4;
    for n = 1:2
        stg5(base+n)    = stg4(base+n) + stg4(base+n+2);
        stg5(base+n+2)  = (stg4(base+n) - stg4(base+n+2)) * W((n-1)*16+1);
    end
end

% ---------------- Stage 6 ----------------
stg6 = cast(complex(zeros(64,1)), 'like', T.stg6);
for k = 0:31
    base = k*2;
    stg6(base+1) = stg5(base+1) + stg5(base+2);
    stg6(base+2) = stg5(base+1) - stg5(base+2);
end

X = stg6;  


end
