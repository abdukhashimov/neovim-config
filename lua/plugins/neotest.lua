return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "marilari88/neotest-vitest",
            "V13Axel/neotest-pest",
        },
        opts = {
            output = {
                open_on_run = true, -- Opens the output window when a test run completes
            },
            adapters = {
                ["neotest-vitest"] = {},
                ["neotest-pest"] = {
                    -- pest_cmd = { "./vendor/bin/pest" }, -- default
                    -- sail_enabled = false,
                },
                -- The adapter itself comes from the lang.go extra; this only turns on
                -- testify support, which is off by default. Without it a suite method
                -- like `func (s *storeSuite) TestFoo()` is invisible to neotest, since
                -- it is not a top-level `func TestFoo(t *testing.T)`.
                ["neotest-golang"] = {
                    testify_enabled = true,
                },
            },
        },
    },
}
