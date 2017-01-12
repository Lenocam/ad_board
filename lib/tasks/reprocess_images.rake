desc "Reprocesses images after adding versions in file uploader for CarrierWave"
task :reprocess_images do
  Image.all.each do |image|
    image.file.recreate_versions!
    image.save!
  end
  puts "Images repcrocessed Reed!"
end
