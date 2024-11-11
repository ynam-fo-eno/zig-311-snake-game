//importation of libraries needed for this game so far
const rl = @import("raylib");
const std = @import("std");
//What workaround do we get to make a dequeue in Zig?
//const deque = @import("deque");

//Imports done to make accessing certain fns a bit easier
const Vector2 = rl.Vector2;
const monImage = rl.Image;
const twoDTexture = rl.Texture2D;
const random = rl.getRandomValue;

//Variables that ultimately control screen size more efficiently.
const cellSize: u16 = 30;
const cellCount: u16 = 25;

//The strcut we use for making the food.
const foodObj = struct {
    const self = @This();
    //Note syntax for how you pass stuff to a strcut that already exists,
    //in this case in the Raylib libu.
    var foodPos: Vector2 = .{ .x = 5, .y = 6 };
    //const image1: monImage = ("F:/Timo's Post High School Stuff/2. UNIVERSITY/2.COURSEWORK/41. ACS 311 []/3. PERSONAL STUDY/2. zig_proj_1/snake_food_1.png");
    //var cartoonTexture: twoDTexture = twoDTexture(image1);
    //fn theImage() foodObj {
    //image1 = rl.LoadImage(image1);
    //cartoonTexture = rl.LoadTextureFromImage(image1);
    //rl.UnloadImage(image1);
    //}

    //hehehe...I'm tryna manually create a constructor and destructor in a struct...
    //how will that  go!?
    //fn egamIeht() foodObj {
    //rl.UnloadTexture(cartoonTexture);
    //}
    fn generateRandomPos(_: self) Vector2 {
        const x: f32 = @floatFromInt(random(0, (cellCount - 1)));
        const y: f32 = @floatFromInt(random(0, (cellCount - 1)));
        foodPos = .{ .x = x, .y = y };
        return foodPos;
    }

    fn chora(_: self) void {
        //return rl.drawTexture(cartoonTexture, @intFromFloat(foodPos.x * cellSize), @intFromFloat(foodPos.y * cellSize), rl.Color.white);

        rl.drawCircle(@intFromFloat(foodPos.x * cellSize), @intFromFloat(foodPos.y * cellSize), (cellSize / 2), rl.Color.green);
    }
};

const snakeObj = struct {
    const self = @This();
    //Below each Vector2 coordinate denotes the head, middle and tail respectively.
    var snakeBody: Vector2 = .{ .x = 6, .y = 9 };

    fn choraNyoka(_: self, snakeLen: u8) void {
        rl.drawRectangle(@intFromFloat(snakeBody.x * cellSize), @intFromFloat(snakeBody.x * cellSize), (cellSize * snakeLen), (cellSize), rl.Color.dark_green);
    }
};

pub fn main() !void {
    // Initialization of varibales controlling screen size.
    const screenWidth: u16 = (cellSize * cellCount);
    const screenHeight: u16 = (cellSize * cellCount);

    rl.initWindow(screenWidth, screenHeight, "Timo's Snake Game Adaptation");
    // Close window and OpenGL context
    //defer here means that the closing of the window only happens at the end
    //of the block it's in, in this case the main block. That's why it isn't executed
    //immediately. Only when while loop condition proves false.
    defer rl.closeWindow();

    // Set our game to run at 60 frames-per-second.
    //This setting  is necessary else if not explicitly specified
    //the animation would occur at the fastest speed the comp can render
    //which would surely impede functionality overall.
    rl.setTargetFPS(60);
    //This initializes the food we wanna make.
    var chakula: foodObj = .{};
    var snake: snakeObj = .{};
    _ = chakula.generateRandomPos();
    // Main game loop
    while (!rl.windowShouldClose()) {
        // Detect window close button or escape key
        // Updates constantly until conditions imemdiately above are met

        // todo: Add objects we'll eventually be making for the snake game
        //like the food the snake will eat, joka lenyewe etc...

        // Functions below are in Raylib for drawing. Immeidately below starts
        //the screen.
        rl.beginDrawing();
        defer rl.endDrawing();

        //This is what controls what color the background displays.
        rl.clearBackground(rl.Color.gray);
        //This draws the food wherever we want it to go.
        chakula.chora();
        snake.choraNyoka(3);

        //This function clearly allows text to be displayed.
        //From left to right is text you wanna write,
        //the x-coordinate your left-most text will take,
        //the y-coordinate your left-most text will take,
        // and what colour it should be displayed in.
        //(Makes you think of Java Swing or JavaFX a bit, eh? Hehehe, anyway...)
        //rl.drawText("Snake Game adapted from cpp coming soon...", 50, 300, 30, rl.Color.blue);
    }
}
