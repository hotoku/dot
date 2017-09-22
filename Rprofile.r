options(repos="http://cran.ism.ac.jp")
if (interactive()) {
    if (capabilities("aqua")) {
        options(device="quartz")
    }
    setHook(packageEvent("grDevices", "onLoad"),
            function(...) {
                if (.Platform$OS.type == "windows")
                    grDevices::windowsFonts(sans ="MS Gothic",
                                            serif="MS Mincho",
                                            mono ="FixedFont")
                if (capabilities("aqua"))
                    grDevices::quartzFonts(
                        sans=grDevices::quartzFont(
                            c("Hiragino Kaku Gothic ProN W3",
                              "Hiragino Kaku Gothic ProN W6",
                              "Hiragino Kaku Gothic ProN W3",
                              "Hiragino Kaku Gothic ProN W6")),
                        serif=grDevices::quartzFont(
                            c("Hiragino Mincho ProN W3",
                              "Hiragino Mincho ProN W6",
                              "Hiragino Mincho ProN W3",
                              "Hiragino Mincho ProN W6")))
                                        # if (capabilities("X11"))
                                        #     grDevices::X11.options(
                                        #         fonts=c("-kochi-gothic-%s-%s-*-*-%d-*-*-*-*-*-*-*",
                                        #                 "-adobe-symbol-medium-r-*-*-%d-*-*-*-*-*-*-*"))
                grDevices::pdf.options(family="Japan1GothicBBB")
                grDevices::ps.options(family="Japan1GothicBBB")
            }
            )
    attach(NULL, name = "JapanEnv")
    assign("familyset_hook",
           function() {
               winfontdevs=c("windows","win.metafile",
                             "png","bmp","jpeg","tiff","RStudio")
               macfontdevs=c("quartz","quartz_off_screen","RStudio")
               devname=strsplit(names(dev.cur()),":")[[1L]][1]
               if ((.Platform$OS.type == "windows") &&
                   (devname %in% winfontdevs))
                   par(family="sans")
               if (capabilities("aqua") &&
                   devname %in% macfontdevs)
                   par(family="sans")
           },
           pos="JapanEnv")
    setHook("plot.new", get("familyset_hook", pos="JapanEnv"))
    setHook("persp", get("familyset_hook", pos="JapanEnv"))
                                        # http://d.hatena.ne.jp/kiwamu_i/20100808/
    setHook(packageEvent("lattice", "attach"),
            function(...) {
                lattice.options(default.args = list(as.table=TRUE))
                my.pdf.theme <- standard.theme("pdf", color=TRUE)
                my.pdf.theme$grid.pars <- list(fontfamily = "sans")
                my.pdf.theme$axis.text$fontfamily <- "sans"
                my.pdf.theme$axis.text$cex <- 1
                my.quartz.theme <- standard.theme("quartz", color=FALSE)
                my.quartz.theme$grid.pars <- list(fontfamily = "sans")
                my.quartz.theme$axis.text$fontfamily <- "sans"
                my.quartz.theme$axis.text$cex <- 1
                lattice.options(default.theme =
                                    function() {
                                        switch(EXPR = .Device,
                                               pdf = my.pdf.theme,
                                               my.quartz.theme)
                                    })
            })
}
