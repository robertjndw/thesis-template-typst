#import "/layout/fonts.typ": *

#let feedbacklog(
  titleEnglish: "",
  supervisor: "",
  advisors: (),
  author: "",
  presentationDate: datetime,
  feedbacklogSubmissionDate: datetime,
  body,
) = {
  // Set the document's basic properties.
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: "1",
    number-align: center,
  )

  // Set body font family.
  set text(
    font: fonts.body, 
    size: 12pt, 
    lang: "en"
  )
  
  align(center, text(font: fonts.sans, 1.7em, weight: 700, "Presentation Feedbacklog" + linebreak() + titleEnglish))

  v(7.5mm)

  align(center, text(font: fonts.sans, 1.2em, weight: 400, feedbacklogSubmissionDate.display("[day]. [month repr:long] [year]")))

  v(7.5mm)

  line(length: 100%, stroke: 0.5pt)

  let entries = ()
  entries.push(("Author: ", author))
  entries.push(("Supervisor: ", supervisor))
  // Only show advisors if there are any
  if advisors.len() > 0 {
    entries.push(("Advisors: ", advisors.join(", ")))
  }
  entries.push(("Presentation Date: ", presentationDate.display("[day].[month].[year]")))

  align(
    center,
    box(
      align(
        left,
        grid(
          columns: 2,
          gutter: 1em,
          ..for (term, desc) in entries {
            (strong(term), desc)
          }
        )
      )
    )
  )

  line(length: 100%, stroke: 0.5pt)

  body
}
