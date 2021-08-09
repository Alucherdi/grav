grav = -400

box = {
    x = 50,
    y = 0,
    w = 10,
    h = 10,
    vy = grav,
    onFloor = false,
    update = function(self, t, dt)
        self.vy = self.onFloor and 0 or grav
        self.y = self.y - self.vy * dt

        if self.x + self.w > t.x and
            self.x < t.x + t.w and
            self.y + self.h > t.y and
            not self.onFloor then
            self.onFloor = true
            self.y = t.y - self.h
        else
            self.onFloor = false
        end
    end
}

terrain = {
    x = 20,
    y = 300,
    w = 50,
    h = 30
}

function love.load()
end

function love.update(dt)
    box.update(box, terrain, dt)

    if love.keyboard.isDown("a") then
        box.x = box.x - 1
    end

    if love.keyboard.isDown("d") then
        box.x = box.x + 1
    end
end

function love.draw()
    love.graphics.rectangle("fill", box.x, box.y, box.w, box.h)
    love.graphics.rectangle("fill", terrain.x, terrain.y, terrain.w, terrain.h)
end
