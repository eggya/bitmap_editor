# About
Ruby 2.0 program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

## Usage

```sh
  $ bundle exec bin/bitmap_editor
```

## Supported Commands

 - I M N - Create a new M x N image with all pixels coloured white (O).
 - C - Clears the table, setting all pixels to white (O).
 - L X Y C - Colours the pixel (X,Y) with colour C.
 - V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
 - H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
 - F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.
 - S - Show the contents of the current image
 - X - Terminate the session
 
## Example
    
```
> I 5 6
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> F 3 3 J
> V 2 3 4 W
> H 3 4 2 Z
> S
JJJJJ
JJZZJ
JWJJJ
JWJJJ
JJJJJ
JJJJJ
```

