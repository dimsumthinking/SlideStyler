# SlideStyler

Experimental - Replacing CodeStyler with this. Removing CodeStyler from GitHub as the code portion works

This project parses the strings I use for code and converts it into Swift types that I can then use to render for slides.

You are welcome to use this without any warranty to its usefulness or correctness but I warn you that this is customized to the quirky way that I encode and present my code in my books and slides.

I do not like syntax highlighting in the code I present. I don't think syntax highlighting communicates what I'm trying to get across.

I use <strong></strong> tags around code that I want to call out because it is being added or discussed.

I use <del></del> tags around code that the reader needs to delete to get from this step to the next.

I use <em></em> confusingly to de-emphasize the code in comments.

I've added <hidden></hidden> tags for slides to hide code that I will later add during a build in a slide explanation to keep the visible code from being repositioned as the slide builds.

I may adjust later - but for now nested styles are not allowed. I know this is a pain for hidden and comments.

This is not a validator - there is no check that the open and close tags match. i.e. <del>something</strong> does not throw an error. This may be adjusted later.



