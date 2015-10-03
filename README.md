# About
Ruby 2.0 program that simulates a basic interactive bitmap editor. Bitmaps are represented as an M x N matrix of pixels with each element representing a colour.

## Usage

```sh
  $ bundle exec bin/bitmap_editor
```

## Supported Commands

**Create:**
Create a new INT M x INT N image with all pixels coloured white (O).
Accepted range is between 1 to 250.
```sh
    > I M N
```

**Show image:**
Show the contents of the current image.
```sh
    > S
```


**Clears table:**
Clears the table, setting all pixels to white (O).
```sh
    > C
```

**Colour pixel:**
Colours the pixel (INT X, INT Y) with colour STR C.
Accepted range is from 1 to max canvas width/height.
Accepted colour is a single capital letter of A - Z.
```sh
    > L X Y C
```

**Vertical segment colouring:**
Draw a vertical segment of colour STR C in column INT X between rows INT Y1 and INT Y2 (inclusive).
Accepted range is from 1 to max canvas width/height.
Accepted colour is a single capital letter of A - Z.
```sh
    > V X Y1 Y2 C
```

**Horizontal segment colouring:**
Draw a horizontal segment of colour STR C in row INT Y between columns INT X1 and INT X2 (inclusive).
Accepted range is from 1 to max canvas width/height.
Accepted colour is a single capital letter of A - Z.
```sh
    > H X1 X2 Y C
```

**Fill regions:**
Fill the region R with the colour STR C. R is defined as: Pixel (INT X, INT Y) belongs to R. Any other pixel which is the same colour as (INT X, INT Y) and shares a common side with any pixel in R also belongs to this region.
Accepted range is from 1 to max canvas width/height.
Accepted colour is a single capital letter of A - Z.
```sh
    > F X Y C
```

**Terminate program:**
Terminate the session.
```sh
    > X
```

## New Feature

### Additional commands

**Rotate bitmap:**
Rotates the bitmap clockwise by 90&deg;.
```sh
    > R
```

**Mirror bitmap:**
Vertical mirror of the existing bitmap.
```sh
    > M
```

**Draw square:**
Draw square outlines by providing 2 corners location(top left and bottom right) and colour.
```sh
    > K X1 Y1 X2 Y2 C
```


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
    > R
    > S
    JJJJJJ
    JJWWJJ
    JJJJZJ
    JJJJJJ
    > M
    > S
    JJJJJJ
    JJWWJJ
    JZJJJJ
    JJJJJJ
    > K 1 1 6 5 C
    > S
    CCCCCC
    CJWWJC
    CZJJJC
    CCCCCC
```

