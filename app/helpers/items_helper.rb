module ItemsHelper
	def movie(opts)
    iframe = content_tag(
      :iframe,
      '', # empty body
      width: 360,
      height: 215,
      src: "https://www.youtube.com/embed/#{opts[:movie.id]}",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end
end
