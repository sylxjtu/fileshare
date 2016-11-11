module GroupsHelper
  def document_url_path(document)
    '/uploads/' + String(document.id) + File.extname(document.filename)
  end
end
