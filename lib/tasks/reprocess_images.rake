desc "Reprocesses images after adding versions in file uploader for CarrierWave"
task reprocess_images: :environment do
  puts "Reprocessing Images. Chill out for a couple minutes.  ¯\_(ツ)_/¯"
  i = 0
  Image.all.each do |image|
    image.file.recreate_versions!
    image.save!
    i = i + 1
    puts "#{i} Images Re-Processed!"
  end
  puts "Reed!"
  puts "It's done!"
  puts "Get back to work!"
end
