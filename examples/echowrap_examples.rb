#NOTE this is a loose collection of examples for most of the Echowrap methods
#Some of the code is kinda ugly, but you can try adding your keys
#and then commenting and uncommenting the code you want to run:
#
#   $ ruby echowrap_example.rb
#
#
#
#
require 'echowrap'

Echowrap.configure do |config|
  config.api_key =       'YOUR_API_KEY'
  config.consumer_key =  'YOUR_CONSUMER_KEY'
  config.shared_secret = 'YOUR_SHARED_SECRET'
end

#beginning = Time.now
Echowrap.song_search(:key => 8,
                     :mode => 0,
                     :min_tempo => 87,
                     :max_tempo =>  93,
                     :artist_min_familiarity => 0.8,
                     :results => 100,
                     :sort => 'danceability-desc'
                     ).map do |song|
  puts "#{song.id} #{song.artist_id} #{song.artist_name} #{song.title}"
end
#puts "Time elapsed: #{Time.now - beginning} seconds."

#puts Echowrap.track_upload(:url => 'http://freedownloads.last.fm/download/552087758/Mars%2B%2528bonus%2529.mp3').inspect
#beginning = Time.now
 #Add path to local file on the next line
 #TRACK_NAME = "DOt_-_05_-_IMF.mp3"
 #MAX_ATTEMPTS = 5
 #attempts = 0
 #puts "uploading..."
 #begin
 #track = Echowrap.track_upload(:track => File.new(TRACK_NAME), :filetype => 'mp3')
 #puts track.inspect
 #rescue Echowrap::Error::ClientError
   #puts "retrying upload attempt(#{attempts.to_s})"
   #attempts += 1
   #retry if(attempts < MAX_ATTEMPTS)
 #end
 #puts "#{track.id} was uploaded"
 #puts "waiting for analysis..."
 #sleep(30)
 #puts "getting profile..."
 #begin
   #track = Echowrap.track_profile(:id => 'TRXDGYL140476CA0A8', :bucket => 'audio_summary')
   #puts track.inspect
   #puts track.inspect
 #rescue Echowrap::Error::ClientError
   #attempts += 1
   #puts "retrying profile attempt(#{attempts.to_s})"
   #retry if(attempts < MAX_ATTEMPTS)

 #end

 #puts "id: #{track.id}" + "\n\n"
 #puts "analysis_url: #{track.audio_summary.analysis_url}" + "\n\n"
 #puts "danceability: #{track.audio_summary.danceability}" + "\n\n"
 #puts "energy: #{track.audio_summary.energy}" + "\n\n"
 #puts "loudness: #{track.audio_summary.loudness}" + "\n\n"
 #puts "key: #{track.audio_summary.key}" + "\n\n"
 #puts "mode: #{track.audio_summary.mode}" + "\n\n"
 #puts "tempo: #{track.audio_summary.tempo}" + "\n\n"
#puts "Time elapsed: #{Time.now - beginning} seconds."
#track.audio_summary.attributes.each_pair{|k,v| puts "#{k.to_s}: #{v.to_s} \n\n"}
#puts Echowrap.track_analysis(:url => 'http://echonest-analysis.s3.amazonaws.com/TR/TRXDGYL140476CA0A8/3/full.json?AWSAccessKeyId=AKIAJRDFEY23UEVW42BQ&Expires=1375588509&Signature=gquPp7TyRMb6He9MxALhhLBGbJw%3D').inspect

#puts Echowrap.song_profile(:id=> 'SOCZMFK12AC468668F').inspect

#puts Echowrap.song_identify(:query => File.new('spec/fixtures/billie_jean_query.json')).inspect
 #fingerprint = "eJxVlIuNwzAMQ1fxCDL133-xo1rnGqNAEcWy_
               #ERa2aKeZmW9ustWVYrXrl5bthn_laFkzguNWpk
               #lEmoTB74JKYZSPlbJ0sy9fQrsrbEaO9W3bsbaW
               #OoK7IhkHFaf_ag2d75oOQSZczbz5CKA7XgTIBI
               #XASvFi0A3W8pMUZ7FZTWTVbujCcADlQ_f_WbdR
               #NJ2vDUwSF0EZmFvAku_CVy440fgiIvArWZZWoJ
               #7GWd-CVTYC5FCFI8GQdECdROE20UQfLoIUmhLC
               #7IiByF1gzbAs3tsSKctyC76MPJlHRsZ5qhSQhu
               #_CJFcKtW4EMrHSIrpTGLFqsdItj1H9JYHQYN7W
               #2nkC6GDPjZTAzL9dx0fS4M1FoROHh9YhLHWdRc
               #hQSd_CLTpOHkQQP3xQsA2-sLOUD7CzxU0GmHVd
               #Ixh46Oide0NrNEmjghG44Ax_k2AoDHsiV6WsiD
               #6OFm8y-0Lyt8haDBBzeMlAnTuuGYIB4WA2lEPA
               #WbdeOabgFN6TQMs6ctLA5fHyKMBB0veGrjPfP0
               #0IAlWNm9n7hEh5PiYYBGKQDP-x4F0CL8HkhoQn
               #RWN997JyEpnHFR7EhLPQMZmgXS68hsHktEVErr
               #anvSSR2VwfJhQCnkuwhBUcINNY-xu1pmw3PmBq
               #U9-8xu0kiF1ngOa8vwBSSzzNw==".gsub("\n", ' ')
 #puts Echowrap.song_identify(:code => fingerprint).inspect
#fingerprint = <<FINGERPRINT
#keJxVlIuNwzAMQ1fxCDL133-xo1rnGqNAEcWy_ERa2aKeZmW9ustWVYrXrl5bthn_laFkzguNWpklEmoTB74JKYZSPlbJ0sy9fQrsrbEaO9W3bsbaWOoK7IhkHFaf_ag2d75oOQSZczbz5CKA7XgTIBIXASvFi0A3W8pMUZ7FZTWTVbujCcADlQ_f_WbdRNJ2vDUwSF0EZmFvAku_CVy440fgiIvArWZZWoJ7GWd-CVTYC5FCFI8GQdECdROE20UQfLoIUmhLC7IiByF1gzbAs3tsSKctyC76MPJlHRsZ5qhSQhu_CJFcKtW4EMrHSIrpTGLFqsdItj1H9JYHQYN7W2nkC6GDPjZTAzL9dx0fS4M1FoROHh9YhLHWdRchQSd_CLTpOHkQQP3xQsA2-sLOUD7CzxU0GmHVdIxh46Oide0NrNEmjghG44Ax_k2AoDHsiV6WsiD6OFm8y-0Lyt8haDBBzeMlAnTuuGYIB4WA2lEPAWbdeOabgFN6TQMs6ctLA5fHyKMBB0veGrjPfP00IAlWNm9n7hEh5PiYYBGKQDP-x4F0CL8HkhoQnRWN997JyEpnHFR7EhLPQMZmgXS68hsHktEVErranvSSR2VwfJhQCnkuwhBUcINNY-xu1pmw3PmBqU9-8xu0kiF1ngOa8vwBSSzzNw==
#FINGERPRINT

#puts fingerprint


#query = '{
  #"metadata": {
    #"artist": "Michael jackson",
    #"release": "800 chansons des annes 80",
    #"title": "Billie jean",
    #"genre": "",
    #"bitrate": 192,
    #"sample_rate": 44100,
    #"duration": 294,
    #"filename": "../billie_jean.mp3",
    #"samples_decoded": 220598,
    #"given_duration": 20,
    #"version": 3.13
  #},
  #"code": "' + fingerprint + '"}'
#query = "{
  #\"metadata\":{
    #\"artist\":\"Michael jackson\",
    #\"release\": \"800 chansons des annes 80\",
    #\"title\": \"Billie jean\",
    #\"genre\": \"\",
    #\"bitrate\": 192,
    #\"sample_rate\": 44100,
    #\"duration\": 294,
    #\"filename\": \"../billie_jean.mp3\",
    #\"samples_decoded\": 220598,
    #\"given_duration\": 20,
    #\"version\": 3.13
  #},
  #\"code\": #{fingerprint}
#}"

#puts query
#puts Echowrap.song_identify(:query => query).inspect



#artists = Echowrap.artist_search(:name => 'macklemore', :bucket => ['artist_location', 'biographies'])
#puts artists.first.location.location

#puts Echowrap.artist_search(:name => 'daft', :results => 3).inspect

#puts Echowrap.artist_search(:name => 'daft punk', :bucket => ['hotttnesss', 'familiarity', 'artist_location', 'songs'], :results => 1).inspect

#puts Echowrap.artist_search(:description => 'quirky', :style => 'indie', :mood => 'chill^1.2', :results => 3).inspect

#puts Echowrap.artist_search(:style => '-country', :results => 3).inspect

#puts Echowrap.artist_search(:results => 3, :artist_start_year_after => '1970', :artist_end_year_before => 'present').inspect

##puts Echowrap.artist_search(:results => 3, :artist_location => 'boston', :bucket => 'artist_location').inspect
#
#puts Echowrap.artist_search(:artist_location => 'city:boston', :bucket => 'artist_location', :results => 3).inspect

#puts Echowrap.artist_search(:artist_location => 'country:brazil', :bucket => 'artist_location',:results => 3).inspect


#puts Echowrap.artist_search(:style => 'rock', :max_familiarity => 0.80, :min_familiarity => 0.10,
#:sort => 'hotttnesss-desc', :results => 3).inspect

#puts Echowrap.artist_biographies(:id => 'ARH6W4X1187B99274F', :results => 1).inspect

#puts Echowrap.artist_biographies(:name => "Daft Punk", :results => 1).inspect

#puts Echowrap.artist_blogs(:id => 'ARH6W4X1187B99274F', :results => 3).inspect

#puts Echowrap.artist_blogs(:name => 'Daft Punk', :results => 1).inspect

#puts Echowrap.artist_familiarity(:id => 'ARH6W4X1187B99274F').inspect

#puts Echowrap.artist_familiarity(:name => 'Daft Punk').inspect

#puts Echowrap.artist_hotttnesss(:id => 'ARH6W4X1187B99274F').inspect

#puts Echowrap.artist_hotttnesss(:name => 'Elvis Presley').inspect

#puts Echowrap.artist_images(:id => 'ARH6W4X1187B99274F', :results => 3).inspect

#puts Echowrap.artist_images(:name => 'Daft Punk', :results => 1).inspect

#puts Echowrap.artist_list_genres.inspect

#puts Echowrap.artist_list_terms(:type => 'mood').inspect

#puts Echowrap.artist_news(:id => 'ARH6W4X1187B99274F', :results => 1).inspect

#puts Echowrap.artist_reviews(:id => 'ARH6W4X1187B99274F', :results => 2).inspect
#
#puts Echowrap.artist_profile(:id => 'ARH6W4X1187B99274F').inspect

#puts Echowrap.artist_profile(:name=> 'Daft Punk').inspect

#puts Echowrap.artist_extract(:text => 'This is a story about Macklemore').inspect

#puts Echowrap.artist_songs(:id => 'ARH6W4X1187B99274F').inspect

#puts  Echowrap.song_search(:title => 'Fire', :artist => 'Kasabian', :bucket => 'audio_summary').inspect
#puts Echowrap.song_search(:style => 'rock',
                          #:results => 3,
                     #:sort => 'song-hotttnesss-desc').inspect
#song =  Echowrap.song_search(:artist => 'Macklemore', :bucket => 'audio_summary')
#song =  Echowrap.song_search(:artist => 'Macklemore', :results => 3)
#puts song.inspect
#puts song.first.audio_summary
#songs =  Echowrap.song_search(:artist => 'Macklemore', :bucket => ['artist_location'])
#songs = Echowrap.song_search(:artist => 'Macklemore',
                             #:bucket => ['audio_summary', 'artist_location'],
                             #:results => 1)
#puts songs.inspect
#puts songs.first.title
#puts songs.first.audio_summary.tempo
#puts songs.first.artist_location.location
#puts Echowrap.artist_similar(:name => "Vampire Weekend").map(&:name).join(", ").inspect
#puts Echowrap.artist_songs(:name => 'Jay-Z',:results => 10).inspect
#puts Echowrap.artist_suggest(:name => "Daft Pu", :results => 3).inspect

 #puts Echowrap.artist_terms(:name => "Daft Punk").inspect

 #puts Echowrap.artist_top_hottt(:genre => "hip hop").inspect

 #puts Echowrap.artist_top_terms.inspect

  #puts Echowrap.artist_twitter(:name => 'Kanye West').inspect
 #puts Echowrap.artist_urls(:name => 'Daft Punk').inspect

 #puts Echowrap.artist_video(:name => 'radiohead', :results => 3).inspect

#puts Echowrap.artist_similar(:id => 'ARH6W4X1187B99274F', :results => 3).inspect
#puts Echowrap.artist_similar(:name => 'Daft Punk', :results => 3).inspect
#puts Echowrap.playlist_basic(:artist => 'Vampire Weekend', :results => 3).inspect

#puts Echowrap.playlist_static(:artist => 'Empire of the Sun', :results => 3).inspect

#puts Echowrap.playlist_dynamic_create(:artist => 'Daft Punk').inspect

# playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
#
 #puts Echowrap.playlist_dynamic_restart(:artist => 'MGMT', :session_id => '8dd625f20b134c189b277c84324b392e').inspect

# playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
#
 #puts Echowrap.playlist_dynamic_next(:session_id => '8dd625f20b134c189b277c84324b392e').inspect

# playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
#
# song = Echowrap.playlist_dynamic_next(:session_id => playlist.session_id).songs.first
#
 #puts Echowrap.playlist_dynamic_feedback(:session_id => '8dd625f20b134c189b277c84324b392e', :favorite_song => 'SOACYKQ13F4A044137').inspect

 # playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
 # puts playlist.session_id
#
# song = Echowrap.playlist_dynamic_next(:session_id => playlist.session_id).songs.first
#
 #puts Echowrap.playlist_dynamic_steer(:session_id => '8dd625f20b134c189b277c84324b392e', :min_danceability => 0.5).inspect

# playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
 #puts Echowrap.playlist_dynamic_info(:session_id => '8dd625f20b134c189b277c84324b392e').inspect



# playlist = Echowrap.playlist_dynamic_create(:artist => 'Daft Punk')
 #puts Echowrap.playlist_dynamic_delete(:session_id => '8dd625f20b134c189b277c84324b392e').inspect

 #puts Echowrap.taste_profile_create(:name => "Tim's new profile", :type => 'general').inspect

# taste_profile = Echowrap.taste_profile_create(:name => "Tim's new profile #{(0...50).map{ ('a'..'z').to_a[rand(26)] }.join}", :type => 'song')
 #data = <<DATA
 #[{"item": {
     #"item_id": "NewCat-SODJXOA1313438FB61",
     #"song_id": "SODJXOA1313438FB61"
 #}}]
#DATA
#
#
#
# puts data
#
#puts Echowrap.taste_profile_update(:id => 'CAUCTMD1404B479E02', :data=> data).inspect
#

#puts Echowrap.taste_profile_create(:name => 'My new playlist', :type => 'song').inspect

#
 #puts Echowrap.taste_profile_keyvalues(:id => 'CAUCTMD1404B479E02').inspect

# puts Echowrap.taste_profile_list.inspect


# taste_profiles = Echowrap.taste_profile_list
# puts taste_profiles.inspect
# taste_profiles.each do |taste_profile|
#   puts "DELETING: #{taste_profile.name}"
   #puts Echowrap.taste_profile_delete(:id => 'CAUCTMD1404B479E02').inspect
# end

 #puts Echowrap.taste_profile_list.inspect
# taste_profile = Echowrap.taste_profile_create(:name => "Tim's Second Test Profile", :type => 'song')
# puts taste_profile.inspect
#Tim's Test Profile
#CAVSCUQ13EBDDD2DB9
#Tim's Second Test Profile
#CAUMJHW13EBF7904AE

 #puts Echowrap.taste_profile_profile(:id => 'CAUCTMD1404B479E02').inspect

# 5 songs
# ['B.O.B', "That's the joint", 'Push it', 'Me, Myself and I', 'California Love'].each do |song_name|
 # puts Echowrap.song_search(:title => 'Me, Myself, and I', :artist => 'De La Soul').inspect
# end

#['SOMYUOW1311AFD8144',
#'SOJWGUN12AB0180CC9',
#'SOCEHOV136F247B1D2',
#'SOMSFTP1377AC0A711',
#'SOBCDNJ1377548716B']

#data = <<DATA
#[
  #{"item":
    #{
      #"item_id": "NewItem-SOMYUOW1311AFD8144",
      #"song_id": "SOMYUOW1311AFD8144"
    #}
  #},

  #{"item":
    #{
      #"item_id": "NewItem-SOJWGUN12AB0180CC9",
      #"song_id": "SOJWGUN12AB0180CC9"
    #}
  #},

  #{"item":
    #{
      #"item_id": "NewItem-SOCEHOV136F247B1D2",
      #"song_id": "SOCEHOV136F247B1D2"
    #}
  #},

  #{"item":
    #{
      #"item_id": "NewItem-SOMSFTP1377AC0A711",
      #"song_id": "SOMSFTP1377AC0A711"
    #}
  #},

  #{"item":
    #{
      #"item_id": "NewItem-SOBCDNJ1377548716B",
      #"song_id": "SOBCDNJ1377548716B"
    #}
  #}


#]
#DATA



# puts data
#
# puts Echowrap.taste_profile_update(:id => 'CAUMJHW13EBF7904AE', :data=> data).inspect

#  ticket = 'CAUMJHW13EBF7904AED13DFDEE0CDC4A'
# #
  #puts Echowrap.taste_profile_status(:ticket => 'CAUCTMD1404B479E023314231A25E348').inspect

 #puts Echowrap.taste_profile_read(:id => 'CAUCTMD1404B479E02', :item_id => 'NewCat-SOYRTFI1374C384A00').inspect

 #puts Echowrap.taste_profile_play(:id => 'CAUCTMD1404B479E02', :item => 'NewCat-SOYRTFI1374C384A00').inspect

#puts Echowrap.taste_profile_skip(:id => 'CAUCTMD1404B479E02', :item => 'NewCat-SOYRTFI1374C384A00', :skips => 5).inspect

#puts Echowrap.taste_profile_ban(:id => 'CAUCTMD1404B479E02', :item => 'NewCat-SOYRTFI1374C384A00').inspect

#puts Echowrap.taste_profile_favorite(:id => 'CAUCTMD1404B479E02', :item => 'NewCat-SOYRTFI1374C384A00').inspect

 #puts Echowrap.taste_profile_rate(:id => 'CAUCTMD1404B479E02', :item => 'NewCat-SOYRTFI1374C384A00', :rating => 7).inspect

 #puts Echowrap.taste_profile_feed(:id => 'CAUCTMD1404B479E02').inspect

  #puts Echowrap.taste_profile_similar(:id => 'CAUCTMD1404B479E02').inspect
 #puts Echowrap.taste_profile_predict(:id => 'CAUCTMD1404B479E02', :category => 'adventurousness').inspect


 #puts Echowrap.sandbox_list(:sandbox => 'emi_gorillaz', :results => 3).inspect



#puts Echowrap.sandbox_access(:sandbox => 'emi_gorillaz', :id => 'a0ce7e489bb28be4842b81d444d6bd0f').inspect

#puts Echowrap.oauth_timestamp.inspect

