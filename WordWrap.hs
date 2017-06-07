module WordWrap (wrap)
where

quebra :: Int -> String -> [String]
quebra n str = if length str <= n then [str] else (take n str) : quebra n (drop n str)

wrap :: String -> Int -> String
wrap str n = if length str <= n then str
    else tail $ foldl (\s1 s2 -> s1 ++ "\n" ++ s2) "" $ map (\s -> wrap s n) ws
        where
            ws = foldl (++) [] $ map (quebra n) (words str)
            

