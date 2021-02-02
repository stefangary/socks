# Why workflow?

We are learning in a totally new way. For the very 
first step, I want to explicitly outline 
1. big picture motivations, 
2. expectations, and 
3. how \#1 and \#2 set the components of our course workflow.

## 1 - Motivations

There is no doubt that learning about our Earth's 
climate, and the role of the ocean in particular, 
is an important topic for our times.  As we shall
see, processes in the ocean store and release
Earth's heat and carbon.  The slower speed yet
greater bulk of the ocean, compared to the atmosphere,
means that the ocean has a longer "memory". 
An overarching hypothesis of climate science is that
the ocean plays an essential role on the longer
(e.g. annual and greater) timescales.

There is also profound injustice in
1. who is most impacted by climate change,
2. who has access to the data and tools for assessing these injustices, and
3. how those data are used to make global-scale decisions. 

Developing fluency in the language of computing
will empower *your* voice in what is becoming an
increasingly data-driven field.  "Data-driven"
does *not* mean decisions are objective; [systemic
racism is in computing](https://www.nytimes.com/2019/12/19/technology/facial-recognition-bias.html).  Your work
and critical thinking in an environment of open
source and open platforms will allow you to more
easily share your work while also empowering others.

## 2 - Expectations

The core aspirations in this classroom are:
1. inclusivity
2. engagement
3. growth
4. critical thinking
   - subdividing big things into parts
   - examining the parts
   - making choices and evaluations
   - documenting those choices.

I am *not* looking for, or expecting perfection,
either from myself or from you.  Rather, this
process is highly **iterative** where it is
important to first think about breaking up
big challenges into smaller steps and even
substeps and subsubsteps...  Progress
is made, patiently, one step at a time.

It is also essential to clarify that
jumping into this computational environment
is no easy task; you will be learning a
new language.  The introduction to this
language is spread over several weeks and **the
first week of class will be devoted to building
confidence in this new environment and class
community.**

## 3 - Main workflow components

Here, we will use:
1. **Bowdoin's high performance computing (HPC) grid:** cloud computing resources,
2. **Jupyter notebooks:** executable documents that store text, code, results, plots, comments, and error messages all in the same place,
3. **Python:** the computer language in the Jupyter notebook,
4. **Blackboard:** the place where course links and files are archived, and
3. **GitHub Classroom:** for distributing starter/template code, collaboration and tracking iterations.

While perhaps dauting at first, using GitHub will make collaboration much
easier.  You can quickly push iterations of your code
(including any plots, results, and error messages) to a space where you control exactly who
sees your data.  All iterations are tracked so you can be confident that you
know exactly which one is the current version and if something breaks,
you can display the differences between versions to compare them
and/or revert to a previous version.  [This repository is an example of
tracking iterations from my own work](https://github.com/stefangary/larval-parameter-sweep/network).

The tools and concepts used here lie at the core of the Internet. 
1. International teams of scientists and commerical developers
use GitHub as one of the *de facto* standards for collaboration. 
2. The vast majority of artifical intelligence and data science 
teaching and research is shared via Jupyter notebooks. 
3. Cloud computing is likely to be the main, and most environmentally 
responsible, way to interact with large commerical or scientific 
data sets. 
This is the way things were before COVID-19 and it will likely
continue to be this way even after our experiment 
in remote learning is over.

# What does a workflow look like?

## Jupyter notebooks

Jupyter notebooks (`.ipynb`) will be the main way
information is stored. Jupyter notebooks are
*awesome* because:
1. they can store text, images, code, error messages and more all in one file,
2. with the thoughts and results stored in the same file, that single file can be shared between people who are working remotely, and
3. all you need to see, edit, and run the code in this file is a web browser.

## A **workflow** is the series of steps that go from
1. getting the starting materials (e.g. assignment instructions),
2. putting those materials in a working environment (e.g. a computer),
3. doing the work,
4. (optionally) sharing the work in intermediate or final form (e.g. collaboration), and
5. pushing the finished product to a final destination (e.g. handing in an assignment).

## A typical workflow could look like:
1. downloading a template from Blackboard,
2. opening the template on your computer/tablet,
3. putting your own work into the template,
4. (optionally) emailing a copy to a friend for feedback,
5. uploading the final result to Blackboard.

## The possible roadblocks with the above workflow for climate science and oceanography are:
+ you will need to install specialized software (and maybe it's not even available for your platform, e.g. there's no app available for it for your tablet)
+ you will need large, additional data sets that will take up precious bandwidth and space on your local device, and
+ sharing of intermediate results for collaboration is clunky (e.g. which e-mail with which attachment is the right one? Did you share all the necessary files? Did any files get garbled because your collaborator doesn't have exactly the right version/setup of the software on their computer?).

## To address the issues above, I propose the following workflow:
1. creating a copy of the template on GitHub Classroom
(from link in Blackboard),
2. pulling your copy of the template to cloud computing 
resources (all the software is preinstalled and all 
the data is already on the Bowdoin HPC grid),
3. putting your own work into the template,
4. *optionally* pushing changes (at any stage in the work) 
to GitHub Classroom for sharing,
5. uploading the final result to Blackboard.

More details are provided below about the core concepts/steps that underlie this workflow.

***

# Step 1: Logging in

1. Ensure you are logged onto the VPN.  You may need 2-factor authentification with `Push` as your second password if you use the Duo app.  If instead of using the Duo app you get codes by SMS, type `SMS` as your second password.  If instead of using the Duo app you get a phone call, type `Phone` as your second password.

2. Then go to the [JupyterHub portal](https://jupyter.bowdoin.edu), enter your username and password, and select the default notebook.  Access to bigger resources is available, but it is very unlikely you will need them in this class.

(Note: Click only *one time* on the start button.  If you click more than
once, you will get a 400 error page.  This is no problem, just wait a minute
or so for your instance to spawn, then click on `Home` and then click on 
`My Server` to get to the main landing page.)

3. After logging in, you will have a view of your home directory on your cloud resource.  Either select a Jupyter notebook (`.ipynb`) file that already exists or create a new file.  When creating a new file, use the `Python 3.6` option.

4. A new tab opens with your Jupyter notebook.  The notebook is structured as a series of cells which can be viewed as a way to organize your thoughts into coherent logical steps.  Cells can be code that tells the computer to do stuff or they can display your notes, images, and other relevant content.  The beauty of notebooks is that *nearly everything is in one file*.

5. After you are done working, for submitting your assignments, save your work by clicking on the floppy disk icon in the toolbar and download the Jupyter notebook as a `.pdf` and upload the `.pdf` to the specific assignment in Blackboard.  This allows for you to keep a record of your submissions and I can provide feedback by annotating and grading your submissions directly in Blackboard.

6. You can always go back to the original landing tab to select other files to view/edit within your cloud computing instance.

7. The original landing tab can also be used to open a terminal where
you can issue commands directly to the underlying operating system of
your cloud computing instance.  As we shall see later, the terminal
is how we will pull and push our work from GitHub.

***

# Step 2: Markdown

1. Markdown is a way to annotate text files so that they have formatted
headings, bold and italic text, lists, images, and even equations.
Markdown is like a simple word processor embedded in a Jupyter notebook.

2. Since the beauty of a Jupyter notebook is the way that it can store
writing, code, and output all in one file, Markdown acts to help make
all the writing components of the notebook more readable.

3. By default, a new Jupyter notebook cell is classified as a `Code` cell.
You can change the cell to a Markdown cell by clicking on the
`Cell` -> `Cell Type` menu item and selecting the `Markdown` option.

4. Specific characters in the text will result in certain types of
formatting.  For example, headings are created with \#, subheadings
with \##, and subsubheadings with \###.  Click on the `Run` button
in the toolbar, or on `Cell` -> `Run Cells` from the menubar and the
special formatting will appear.

5. *Italic* and **bold** and ***bold-italic*** text can be created too!

6. Lists are a great way to organize thoughts and can be created
with numbers (e.g. 1.) or bullets (-).

7. This is just a starter covering the essentials of what you'll
probably need in class; if you are curious and want to embellish,
[there are many more **optional** Markdown commands](https://www.markdownguide.org/basic-syntax).

***

# Step 3: Using the terminal

We will mainly use the terminal for navigating the directories (i.e. folders)
of your space on Bowdoin's HPC grid and directly copying code from GitHub
Classroom to the HPC grid.  "Directly" means we can sidestep the hoops of
mounting network drives, downloading files, and dragging files to the right
location on the network drives.

Here are some useful tips:

1. Typing `cd` on the command line will always take you back to your home directory, no matter where you are.
2. Typing `pwd` on the command line will tell you where you are; it is short for "present working directory".
3. Typing `ls` on the command line will give you a list of files and directories in the present working directory.
4. To change to a new directory, type `cd` followed by the path of the directory you wish to go to.  For example,
```bash
cd LAB01-intro-stefangary
```
5. The `.` is shorthand for the present working directory, so `cd .` won't do anything; you'll just stay where you are.
6. The `..` is shorthand for the directory that contains the present working directory (i.e. it is "above") so `cd ..` will move you up a level.

There are many many more things that can be done with these terminal
commands but this list probably contains the only things you'll need to know
for this course.

***

# Step 4: GitHub - pulling assignment templates

GitHub Classroom will be used to store templates (e.g. starter code)
for your assignments.  It's actually pretty easy to copy this starter code
right to the HPC grid!

I will post a link to activate your assignment on Blackboard.  When you
click on this assignment link, you will go to GitHub classroom and then
you'll have the chance to accept the assignment.  When you accept the
assignment, a special directory is created that has your very own copy
of the starter code/template for the assignment.  This special directory
is called a **repository**.

When your repository is created, you'll be taken to a new webpage; this
webpage's address (i.e. URL) is very important so take note of it. It will
have the form: github.com/ORGANIZATION-NAME/REPOSITORY-NAME where the organization name will be your course (e.g. Bowdoin-EOS1505-S21)
and the repository name will be the name of the assignment followed by
your GitHub username.

To copy your repository to the Bowdoin HPC grid, you just need to open a
terminal and type `git clone <URL-of-your-repository>`.  For example,
```bash
git clone https://github.com/Bowdoin-EOS1505-S21/LAB01-intro-stefangary
```

By default, your repository is private so GitHub will ask you
to enter your *GitHub* username and password.  Note that in a
terminal, *no characters appear when you enter your password.*
(This is analogous to dots covering up the characters when you
enter your password at login.bowdoin.edu, except the terminal
is much less sophisticated - it just doesn't display any
characters.  If you make any mistakes while entering your password,
you can use the delete key.  So, if you enter your password
and don't see any characters appearing, that's totally OK.
The terminal is not frozen; it's just protecting your password.)

Now, you're done with the terminal for now. Go back to the JupyterHub
landing page to select the appropriate files to start working!

***

# Step 5: GitHub - pushing your work for collaboration

Although you're not required to upload your code to GitHub, if you
do, it will be much easier to share your notebooks when they are
in progress and when they are done with your peers.  When you're
ready to commit a version of your code to GitHub,

1. Save your Jupyter notebook
2. Open a terminal on the HPC grid and navigate to the folder that
contains your code (i.e. the repository) and make that folder your
present working directory.
3. Type the following at the command line while inside your repository 
folder:
```bash
git add .
git commit -m "Put a short description of the commit here."
git push origin
```

You will likely need to enter your GitHub username and password
and then the code will be copied up to the repository on a GitHub
server.  You can now change the settings for your repository by going
to your repository's URL (that includes choosing to allow your peers
to see your code). Git will keep track of all versions of the code 
that have been committed.

***
