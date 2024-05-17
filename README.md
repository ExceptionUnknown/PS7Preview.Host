
# PS7Preview.Host

**PS7Preview.Host** (*PowerShell 7 Preview - Independent Host*) is a PowerShell 7 Script Module that aims to create an independent environment to run PowerShell 7 Preview within, independent of sister copies of PowerShell 7 that may be installed on the same system.

***Disclaimer:***
This Project was initially taken on for my own Personal use cases, as I was merely wanting to have a separate environment for the base version of PowerShell 7, primarily for testing/experimentation purposes. I wasn't entirely certain at first if I could pull it off, because on the surface there's seemingly nothing that says this can be done. Then again, there's also nothing I found that explicitly stated it *CANNOT* be done, either. So, I tinkered around and found a reasonable solution, that requires very few workarounds to make it tick. I'm still getting familiar with PowerShell, so this was more of a learning experience than anything, and the final result is a work in progress, proof of concept. Thank you.

## Current & Planned Features

### Currently Working

* Creates new property entries within the existing `$Profile` Variable, `$Profile.PreviewCurrentUser`, and `$Profile.PreviewAllUsers`, which target new Profile Paths specific to instances of PowerShell 7 Preview. 

* Enables PowerShell 7 Preview to be leveraged as if it were an entirely separate PowerShell Host from PowerShell 7 and Windows PowerShell.

### Planned Features

* Find a smoother and more efficient/effective workaround for launching an instance of PowerShell 7 Preview in '-NoProfile' mode, that results in the 7-Preview Profiles being auto-loaded, instead of having to manually dot source them each time.

* Pre-packaged customized PowerShell 7 Preview Shortcuts, to make the illusion more believable.

* General clean up.

## How it Works

**PS7Preview.Host** accomplishes the goal of, more or less, creating a separate run environment for PowerShell 7 Preview, in a similar fashion to the separation between PowerShell 7 and Windows PowerShell, with just a few very simple tricks. Most of which is slight of hand, really. 

**In order for this Module to function properly, first, the following must be done to ensure everything loads correctly:**

> * Create a new Shortcut to the PowerShell 7 Preview executable.
> * Append the -NoProfile Argument to Shortcut Launch Parameters.
> * **Run As Administrator**, and Install/Import the Module. As of now, this part is a bit clunky as it requires the Module be manually Imported each time the custom 7-Preview Shortcut is launched. A workaround for this that makes this a smoother process is in the works.

Once the Module is Imported, the new entries are added to `$Profile`, and you may create either of the new Profile Scripts via the same method as you would any other. *For Example*: 

`New-Item $Profile.PreviewCurrentUser -ItemType File` 

This one-liner will create the file *'Microsoft.PowerShellPreview_profile.ps1'*, which is stored in the newly created Directory **~\Documents\PowerShell\7-preview\\**

The only issue from this point is the requirement that this, and all subsequent times, 7-preview Profile Scripts must be manually dot sourced into the session, *like so*:

`. $Profile.PreviewCurrentUser`

Despite being a bit janky to use at the moment, everything seems to work as intended, for the most part. Of course, should you discover any bugs, broken features, or have any suggestions for improvement, feel free to [Contribute to This Project]().
