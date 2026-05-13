#import "/template/init.typ": initialize
#import "/template/toc.typ": toc
#import "/template/cover.typ": cover
#import "/template/backcover.typ": backcover

#let date-format = "[year]年[month repr:numerical padding:none]月[day padding:none]日"

#let project(
  title: "",
  author: "筑波大学電気通信研究会",
  publisher: "筑波大学電気通信研究会",
  editor-chief: "電通タロウ",
  editions: ((date: datetime.today(), circulation: 128),),
  keywords: (),
  body,
) = {
  set document(
    title: title,
    author: author,
    date: editions.last().date,
    keywords: keywords,
  )
  show: initialize

  cover()
  toc()

  counter(page).update(1)
  body

  backcover(
    title: title,
    publisher: publisher,
    editor-chief: editor-chief,
    editions: editions,
  )
}
