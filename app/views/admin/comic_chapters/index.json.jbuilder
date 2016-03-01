json.array!(@comic_chapters) do |comic_chapter|
  json.extract! comic_chapter, :id, :number, :subtitle, :total_point
  json.url comic_chapter_url(comic_chapter, format: :json)
end
