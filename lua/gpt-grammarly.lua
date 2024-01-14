--- DEPRECATED ---

local timer = hs.timer
local eventtap = hs.eventtap
local http = hs.http
-- Please replace the selected text with an improved version of GPT
-- print("gptGrammarly Module Loaded")

function gptGrammarly()
    -- print("gptGrammarly")
    -- Press copy
    timer.doAfter(0.3, function()
        eventtap.keyStroke({"cmd"}, "c")

        timer.doAfter(0.3, function()
            -- Read content of clipboard
            local clipboard = hs.pasteboard.getContents()
            print(hs.inspect(clipboard))

            -- Send it to the server
            http.asyncPost("http://localhost:8787", hs.json.encode({
                ['message'] = clipboard
            }), {
                ["Content-Type"] = "application/json; charset=UTF-8"
            }, function(http_number, body, headers)
                print("Local server called")
                print(body)
                -- print(http_number)
                -- print(body)
                if http_number == 200 then
                    -- print("Valid response so we can use it to paste it")
                    hs.pasteboard.setContents(body)
                    timer.doAfter(0.3, function()
                        eventtap.keyStroke({"cmd"}, "v")
                    end)
                end
            end)
        end)
    end)
end

function gptGrammarlyAll()
    -- print("Select text")
    eventtap.keyStroke({"cmd"}, "a")
    gptGrammarly()
end

HOTKEY.bind(HYPER, "c", gptGrammarly)
HOTKEY.bind(HYPER, "s", gptGrammarlyAll)
