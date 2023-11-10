-- Replace selected text with an improved version of GPT
function gptGrammarly()
    -- Press copy
    hs.timer.doAfter(0.2, function()
        hs.eventtap.keyStroke({"cmd"}, "c")

        hs.timer.doAfter(0.2, function()
            -- Read content of clipboard
            local clipboard = hs.pasteboard.getContents()
            -- print(hs.inspect(clipboard))

            -- Send it to the server
            hs.http.asyncPost("http://localhost:8787", hs.json.encode({
                ['message'] = clipboard
            }), {
                ["Content-Type"] = "application/json; charset=UTF-8"
            }, function(http_number, body, headers)
                -- print("HERE 2")
                -- print(http_number)
                -- print(body)
                if http_number == 200 then
                    -- print("Valid response so we can use it to paste it")
                    hs.pasteboard.setContents(body)
                    hs.timer.doAfter(0.3, function()
                        hs.eventtap.keyStroke({"cmd"}, "v")
                    end)
                end

            end)
        end)
    end)
end

HOTKEY.bind(HYPER, "c", gptGrammarly)
