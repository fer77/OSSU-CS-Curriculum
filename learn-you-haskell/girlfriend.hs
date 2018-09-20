import System.IO  
  
main = do  
    handle <- openFile "girlfriend.txt" ReadMode  
    contents <- hGetContents handle  
    putStr contents  
    hClose handle  

-- openFile. :t openFile :: FilePath -> IOMode -> IO Handle. 
-- openFile takes a file path and an IOMode and returns an I/O action that will open a file and have the file's associated handle encapsulated as its result.

-- hGetContents: takes a file handle which tells it which file to read from.

-- hClose, a handle that closes the file. File needs to be closed after opening it with openFile!