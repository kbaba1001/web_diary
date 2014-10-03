require 'active_support/core_ext/string/strip'

module TagHelpers
  def twitter_button_tag
    <<-HTML.strip_heredoc
    <a href="https://twitter.com/share" class="twitter-share-button" data-via="kbaba1001">Tweet</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
    HTML
  end

  def google_search_tag
    <<-HTML.strip_heredoc
      <script>
        (function() {
          var cx = '009648452684402972615:iwnrxlh_rw8';
          var gcse = document.createElement('script');
          gcse.type = 'text/javascript';
          gcse.async = true;
          gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
              '//www.google.com/cse/cse.js?cx=' + cx;
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(gcse, s);
        })();
      </script>
      <gcse:search></gcse:search>
    HTML
  end

  def gravator_image_tag
    gravator_url = 'http://www.gravatar.com/avatar/b49aa473d5cd7f08cdce3d56ef837f29?s=100'
    tag(:img, src: gravator_url, alt: 'kbaba1001 profile photo')
  end
end
