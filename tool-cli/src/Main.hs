{-# LANGUAGE OverloadedStrings #-}
module Main where

{- Parser and Parameters -}
import Turtle

{- Data and Version of Program -}
import Paths_tool_cli (version)
import Data.Version (showVersion)

main :: IO ()
main = join (options "Cli-Tool Help: " parser)

parser :: Parser (IO ())
parser = parserMain <|> parserVersion <|> parserPrint

{- Main -}
parserMain :: Parser (IO ())
parserMain = pure mainSubRoutine

mainSubRoutine :: IO ()
mainSubRoutine = echo "Welcome to cli-tool!"

{- Version -}
version' :: IO ()
version' = putStrLn (showVersion version)

verboseVersion :: IO ()
verboseVersion = do
  version'
  echo "Verbose version information"

parserVersion :: Parser (IO ())
parserVersion = subcommand "version" "Show current version" (pure verboseVersion)

{- Print TEXT TIMES -}
printText :: (Int, Text) -> IO()
printText (i, text) = replicateM_ i (print text)

printArgs :: Parser (Int, Text)
printArgs = (,) <$> argInt "times" "Number of Times"
  <*> argText "text" "Text to print"

parserPrint :: Parser (IO ())
parserPrint = fmap printText
  (subcommand "print" "Print specified text a number of times" printArgs)