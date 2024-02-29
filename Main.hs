import System.Directory.Internal.Prelude (getArgs, exitFailure)
main :: IO()
main = do arg <- getArgs
          putStrLn (my_rule "  *  " "")

my_rule :: [Char] -> [Char] -> [Char]
my_rule (' ':'*':' ':res) line = my_rule('*':' ':res) (line ++ "*")
my_rule ('*':'*':'*':res) line = my_rule('*':'*':res) (line ++ " ")
my_rule ('*':'*':' ':res) line = my_rule('*':' ':res) (line ++ " ")
my_rule ('*':' ':'*':res) line = my_rule(' ':'*':res) (line ++ " ")
my_rule ('*':' ':' ':res) line = my_rule(' ':' ':res) (line ++ "*")
my_rule (' ':' ': ' ':res) line = my_rule (' ':'*':res) (line ++ " ")
my_rule (' ':' ': '*':res) line = my_rule ('*':' ':res) (line ++ "*") 
my_rule (_:_:_res) line = line
