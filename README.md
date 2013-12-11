# JS Image Color Scanner
Since iTunes updated to the eleventh version, the thing I liked the most was the new Album View.

![image](http://i.imgur.com/awJm7cC.png)

I wanted to study Canvas and CoffeeScript, so I took this as an oportunity to create an algorithm capable of replicating this effect.

![image](http://i.imgur.com/Yi4aIOP.png)

##Things I need to improve

So, as you can see in the demo, the script doesn't handle colors that well. It will print dark color on a dark background and I think I can scan the image for the colors in a more efficient way. I'll update this script soon with anything I improve :)

## What this is not

This is not, yet at least, intended as a library or to be used for production. You can, however, clone this repository and experiment with it and, if you decide do use it on your project or make any modification you think would be worth mentioning here, let me know. You are welcome to open a pull request.

### Browsers

I've tested this script in the following browsers:

Chrome 31.0.1650.63 - Works as expected
Safari 7.0 - Does not work. This seems to be a bug with the jQuery handling of the image. I'll try to ditch the jQuery (at least for this) in the next version.

If you test this in other browser, please, open an issue with the following pattern:

[Browser Test] - <Browser Name and Version> - <Result>
<Description, if needed>

######Example
[Browser Test] - Chrome 31.0.1650.63 - Works as expected

Thanks.


####Dependencies

jQuery 2.x

