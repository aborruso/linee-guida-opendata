function Cite(el)
  if #el.citations == 1 then
    local citation = el.citations[1]
    local reqPattern = "^req%-(%d+)$"
    local reqNumber = citation.id:match(reqPattern)

    if reqNumber then
      local label = pandoc.utils.stringify(el.content)
      if #label == 0 then
        label = "Requisito " .. reqNumber
      end

      -- Crea un link manuale in formato HTML
      local htmlLink = string.format('<a href="#%s">%s</a>', citation.id, label)
      return pandoc.RawInline('html', htmlLink)
    end
  end
  return el
end
