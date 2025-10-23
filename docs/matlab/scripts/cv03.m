clc; close;
function Y = VecBubbleSort(X)
% Zde vlozte naprogramovanou funkci bublinkoveho razeni vektoru
% X - nesetridena vstupni matice
% Y - algoritmem setridena vystupni matice
Y = X;
for i = 1:size(Y, 2)-1 % sloupce % optimalizace a zrychleni kodu pomoci -1 a -i
    for j = 1:size(Y, 2)-i % sloupce
        for k = 1:size(Y, 1) % radky
            if Y(k, j) > Y(k, j + 1) % podminka pokud je prvni sloupec vetsi nez ten druhy (nasledujici)
                % logika bubble sortu, temp = pomocná proměnná temporary 
                temp = Y(:,j);
                Y(:, j) = Y(:, j + 1);
                Y(:, j + 1) = temp;
                break % násilné ukonceni cyklu
            end
            if Y(k, j) < Y(k, j + 1) % pokud je menši tak at se cyklus ihned ukonci
                break
            end
        end
    end
end
end


B = round(randn(5,10));
disp('vstupní pole')
B
B_sorted = VecBubbleSort(B);
disp('seřazené pole')
B_sorted