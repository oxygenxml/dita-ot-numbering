# DITA-OT PDF2 - Generate numbers before topic's title

A DITA-OT PDF2 customization plugin to generate numbers before the topic's title.

This plugin contributes two parameters to the PDF2 transformation:
* **numbers-before-title** (yes/no)

    Specifies whether or not this feature is enabled. The default value is `no`.

* **numbers-before-title-depth**

    Specifies the depth of the topics that will be numbered when the **numbers-before-title** option is enabled.

To use this PDF customization plugin, use one of the following methods:

* **From the Oxygen interface** - Follow these steps:
1. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
2. To install the plugin and transform it, follow the procedure found here: https://www.oxygenxml.com/doc/ug-editor/topics/dita-ot-install-plugin.html

* **From a command line** - Follow these steps:
1. Download **DITA-OT 2.4** 
2. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
3. Install the plugin by running the command ``dita-ot-dir/bin/dita --install=plug-in-zip``. See more details in the [Installing plug-ins](http://www.dita-ot.org/2.4/dev_ref/plugins-installing.html) topic from the DITA-OT documentation.
4. Invoke the PDF transformation using the **numbers-before-title** parameter in a command, as in the following example:
```
    dita.bat -f pdf2 -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -output=D:/workspace/userguide-private/DITA/out-pdf -Dnumbers-before-title=yes
```
Please note that this plugin was tested with **DITA-OT 2.4**.

Copyright and License
---------------------
Copyright 2018 Syncro Soft SRL.

This project is licensed under [Apache License 2.0](https://github.com/oxygenxml/dita-ot-numbering/blob/master/LICENSE)
