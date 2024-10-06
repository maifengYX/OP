local players = game:GetService("Players")
local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textLabel = Instance.new("TextLabel")

-- 创建一个ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlashingScreenGui"
screenGui.DisplayOrder = 100 -- 确保它在最前面
screenGui.Parent = game:GetService("CoreGui")

-- 设置ScreenGui
gui.Name = "FlashingScreen"
gui.Parent = game:GetService("CoreGui")

-- 设置Frame
frame.Name = "FlashingFrame"
frame.Parent = gui
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BorderSizePixel = 0
frame.ZIndex = 10

-- 设置TextLabel
textLabel.Name = "CustomText"
textLabel.Parent = frame
textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
textLabel.Position = UDim2.new(0.25, 0, 0.45, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 0.5
textLabel.TextColor3 = Color3.new(255, 255, 255)
textLabel.Font = Enum.Font.ArialBold
textLabel.TextSize = 24
textLabel.Text = "臭傻逼叫你开挂了吗" -- 你可以在这里自定义文字

-- 闪烁频率（秒）
local flashRate = 1 -- 1秒闪烁一次，可以根据需要修改这个值

-- 闪烁效果
local isBlack = true
local connection = game:GetService("RunService").Heartbeat:Connect(function()
    frame.BackgroundColor3 = isBlack and Color3.new(0, 0, 0) or Color3.new(255, 255, 255)
    isBlack = not isBlack
    frame.BackgroundTransparency = isBlack and 0 or 1
end)

-- 当玩家加入游戏时显示GUI
players.PlayerAdded:Connect(function(player)
    gui.Parent = player:WaitForChild("PlayerGui")
end)

-- 当玩家离开游戏时移除GUI
players.PlayerRemoving:Connect(function(player)
    gui:Destroy()
end)

-- 清理连接
game:BindToClose(function()
    connection:Disconnect()
end)