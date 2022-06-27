{----Part 1----}

{-Takes 3 positive integer values which define the height, width and number of steps. 
Adds up the width of a step with each new step it creates-}

steps:: Int -> Int -> Int -> String
steps h w s = printstep 1 h
    where
        printrow 0 = "\n"
        printrow x = '*' : (printrow (x-1))
        printstep n 0
            | n==s = ""
            | otherwise = printstep (n+1) h
        printstep n x = (printrow (w*n)) ++ (printstep n (x-1))


{----Part 2----}

{-Takes a positive integer n which => 5 and uses it to create a flag with nxn dimension -}

flagpattern:: Int -> String
flagpattern n
    | n < 5 = error "The number given should be greater than or equal to 5"
    | otherwise = printflag 0
        where
            printrow x i
                | i==0 || x==i || x==n-i-1 = '*' : (printrow x (i+1))
                | i==n-1 = "*\n"
                | otherwise = ' ' : (printrow x (i+1))
            printflag x
                | x==0 = (take n (repeat '*'))++"\n" ++ printflag (x+1)
                | x==n-1 = (take n (repeat '*'))++"\n"
                | otherwise = (printrow x 0) ++ printflag (x+1)


{----Part 3----}

{-Takes 3 string values (one of which is some kind of a sentence) and replaces 
the first string, which is included in the sentence, with a second string-}

swapwords:: String -> String -> String -> String
swapwords a b [] = ""
swapwords a b l
    | f = b ++ swapwords a b t
    | otherwise = (head l) : swapwords a b t
    where
        (f,t) = findword a l
        findword [] t = (True,t)
        findword (a:as) (t:ts)
            | a==t = findword as ts
            | otherwise = (False,(tail l))


{----Part 4----}

compatibility:: String -> String -> String
compatibility a b = (compat a b (length ra))++" and "++(compat b a (length rb))++"\n"
    where
        (ra,rb) = removestring a b
        compat s t n
            | n `mod` 4==0 = s++" is indifferent to "++t
            | n `mod` 4==1 = s++" loves "++t
            | n `mod` 4==2 = s++" is physical towards "++t
            | n `mod` 4==3 = s++" hates "++t
        removestring [] s = ([],s)
        removestring (c:cs) s
            | f = removestring cs r
            | otherwise = concatfst c $ removestring cs r
            where
                (f,r)=removechar c s
        removechar c [] = (False,[])
        removechar c (a:as)
            | c==a = (True,as)
            | otherwise = concatsnd a $ removechar c as
        concatsnd c (a,b)= (a,c:b)
        concatfst c (a,b)= (c:a,b)
divide:: Eq a => [a] -> a -> [[a]]
divide l i = divide1 [] l
    where
        divide1 a [] = [reverse a]
        divide1 a (j:r)
            | i==j && a/=[] = (reverse a) : divide1 [] r
            | i==j && a==[] = divide1 [] r
            | otherwise = divide1 (j:a) r


{----Part 5----}

{-Takes a list of numbers or a tring of characters and splits it into 
list of lists that partitions the original list when encounters the second argument-}

split:: Eq a => [a] -> a -> [[a]]
split l i = split1 [] l
    where
        split1 a [] = [reverse a]
        split1 a (j:r)
            | i==j && a/=[] = (reverse a) : split1 [] r
            | i==j && a==[] = split1 [] r
            | otherwise = split1 (j:a) r