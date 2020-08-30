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
1. cloud computing resources (Bowdoin's high performance computing grid),
2. Jupyter notebooks (an open platform for storing and documenting all ideas, 
code, and results), and 
3. GitHub Classroom (for collaboration and tracking iterations).

While perhaps dauting at first, using GitHub will make collaboration much
easier.  You can quickly push iterations of your Jupyter notebooks
(including any error messages) to a space where you control exactly who
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
continue to be this way even after our massive experiment 
in remote learning is over.

# What does a workflow look like?

## Jupyter notebooks

Jupyter notebooks (`.ipynb`) will be the main way
information is stored. Jupyter notebooks are
*awesome* because:
1. they can store text, images, code, error messages and more all in one file,
2. with the thoughts and results stored in the same file, that single file can be shared between people who are working remotely, and
3. all you need to see and interact with this file is a web browser.

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
(from link in Blackboard/e-mail),
2. pulling your copy of the template to cloud computing 
resources (all the software is preinstalled and all 
the data is already there),
3. putting your own work into the template,
4. (optionally) pushing changes (at any stage in the work) 
to GitHub Classroom for sharing,
5. uploading the final result to Blackboard.

***

# Step 1: Logging in

1. Ensure you are logged onto the VPN.  You may need 2-factor authentification with `Push` as your second password.

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

# Step 3: GitHub - pulling assignment templates



***

# Step 4: GitHub - pushing your work for collaboration

***

# Step 5: Arithmetic operations in Python and 1-dimensional data

***

# Step 6: Loading NetCDF data and 2-dimensional data

***
