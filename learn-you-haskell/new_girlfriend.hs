import System.IO     
    
main = do     
    withFile "girlfriend.txt" ReadMode (\handle -> do  
        contents <- hGetContents handle     
        putStr contents)

        -- withFile function, has a type signature of withFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a. It takes a path to a file, an IOMode and then it takes a function that takes a handle and returns some I/O action. What it returns is an I/O action that will open that file, do something we want with the file and then close it.