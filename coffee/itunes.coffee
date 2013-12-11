getCoverColors = (cover)->
    canvas = $("<canvas></canvas>").get 0
    context = canvas.getContext "2d"
    imgW = cover.width()
    imgH = cover.height()
    canvas.width = imgW
    canvas.height = imgH
    image = cover.get(0)
    context.drawImage(image, 0, 0, imgW, imgH)
    pixels = context.getImageData(0, 0, imgW, imgH)
    rawColorData = pixels.data
    colorData = {}
    colorTable = {}
    i = 0
    while i < rawColorData.length
        r = rawColorData[i]
        g = rawColorData[i+1]
        b = rawColorData[i+2]
        colorInt = rgbToInt r, g, b
        colorData[colorInt] = if colorData[colorInt] then colorData[colorInt] + 1 else 1
        colorTable[colorInt] = [r, g, b] unless colorTable.hasOwnProperty [r, g, b]
        i = i + 500
    colorData = getTopColors colorData
    topColors = (colorTable[color[0]] for color in colorData by 3)
    # #The second and third colors seems to be always real close one to another, so we remove the third.
    topColors[2] = topColors[3]
    topColors[3] = [rawColorData[0], rawColorData[1], rawColorData[2], rawColorData[3]] #This is always the first pixel, so we can use them at the background
    topColors

getTopColors = (colors) ->
    sortable = []
    for own color of colors
        sortable.push [color, colors[color]]
    sortable.sort (a, b) -> 
                    b[1] - a[1]
    return sortable.slice 0, 12


rgbToInt = (r, g, b) ->
    r = colorRound r
    g = colorRound g
    b = colorRound b
    color = 256*256*r+256*g+b
  
colorRound = (value) ->
    rounded = Math.round(value / 85) * 85
    rounded
    
componentToHex = (c) ->
  hex = c.toString(16)
  (if hex.length is 1 then "0" + hex else hex)
rgbToHex = (rgb) ->
  "#" + componentToHex(rgb[0]) + componentToHex(rgb[1]) + componentToHex(rgb[2])

styleAlbumSection = (albumId) ->
    albumId = "#" + albumId
    albumColors = getCoverColors $(".cover img", albumId)
    $(albumId).css("backgroundColor", rgbToHex(albumColors[3]))
    $(".title", albumId).css("color", rgbToHex(albumColors[1]))
    $(".list", albumId).css("color", rgbToHex(albumColors[2]))
    return

$('body').load ->
    $(".album").each ->
        styleAlbumSection $(this).attr "id"
        return
    return
