
import Sound.File.Sndfile
import System.Environment

main :: IO ()
main = do
    [inFile] <- getArgs
    hIn <- openFile inFile ReadMode defaultInfo

    let info = hInfo hIn
    putStrLn $ "format: "      ++ (show $ format info)
    putStrLn $ "sample rate: " ++ (show $ samplerate info)
    putStrLn $ "channels: "    ++ (show $ channels info)
    putStrLn $ "frames: "      ++ (show $ frames info)

    contents <- hGetBuffer hIn (frames info)
    case contents of
        Nothing -> return ()
        Just buffer -> putStrLn "Hi!"

    hClose hIn
