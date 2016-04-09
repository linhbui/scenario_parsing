# Turning scenarios into scenario tables (sort of...)

Doing repetitive stuffs (turning scenario into scenario tables is a great example) drives me nuts, so I wrote this little thing. Hopefully it will make your life easier. Any contribution is welcomed.

This will parse the txt file you give it and you have the number, subject, actions columns done, but you will still have to do 'Other Data/Objects' and 'Object Acted Upon' columns

# Precondition
Your scenarios have to be written in a very structured format for this to work. The recommended format is:
```
[subject, all lowercase, singular] [verb, 3rd person] [other data/objects] with/to [object acted upon]
```

# How to use:

0. Download and install ruby (if your computer doesn’t have it, which I doubt) 
[Instruction here for Windows] (http://corlewsolutions.com/articles/article-19-install-ruby-on-windows-7-32-bit-or-64-bit)

1. Download the file and save it into a folder (let’s say folder scenario_homework)

2. Create a new text file (let’s say, uc05.txt) and copy the scenario you wrote onto the file

3. Open terminal (or run cmd in Windows), navigate to folder scenario_homework

   [Instructions] (http://stackoverflow.com/questions/5576321/need-to-navigate-to-a-folder-in-command-prompt) here for Windows user.
 
   For mac and linux user: [Instructions] (http://askubuntu.com/questions/232442/how-do-i-navigate-between-directories-in-terminal)
 
4. Run this in your command line:
  ```
  ruby scenario_parsing.rb [scenario file name] [destination csv file name]
  ```
  for example
  ```
  ruby scenario_parsing.rb uc05.txt uc05.csv
  ```

5. The uc05.csv is for  you to enjoy. Use excel, google spreadsheet or whatever to do the last 2 columns
