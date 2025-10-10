clear; clc;

function text = decipher_for(cipher,key)

    keyNums = double(key);
    [keySorted, numbers] = sort(keyNums);
    
    k = 1;
    l = 1;
    for i = 1:size(cipher, 2)
        M_cipher(l, k) = cipher(i);
        l = l + 1;
        if mod(i, length(cipher)/length(key)) == 0
            k = k+1;
            l = 1;
        end
    end
    
    for i = 1:ceil(length(cipher)/length(key))
        for j = 1:length(key)
            M(i,j) = M_cipher(i,numbers(j));
        end
    end

    M = M';

    for k = 1:numel(M_cipher)
        text(1,k) = M(k);
    end

end

function text = decipher_task(cipher,key)
    % text = decipher_task(cipher, key)
    % cipher - zasifrovany text (pole char, radkovy vektor, delka delitelna delkou klice)
    % key - libovolny retezec (pole char), delka klice je delitelem delky cipher
    % text - vystupni retezec - desifrovany text - radkovy vektor
    keyNums = double(key);
    [~, numbers] = sort(keyNums);

    rows = length(cipher) / length(key);
    M_cipher = reshape(cipher, rows, []);
    M = M_cipher(:, numbers); 
    text = M';      
    text = text(:)';
end


key = 'STOLEK';
cipher = 'UESSDL KTUTMI OAEZIBGUKAARJ N ';

disp('Desifrovany vystup vasi funkce decipher_task(text,key):')
text = decipher_task(cipher, key);
disp(text)