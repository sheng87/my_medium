class Api::UtilsController < Api::BaseController
    IMAGE_EXT = [".gif",".jpeg",".jpg",".png",".svg"]
    def upload_image
        f = params[:file]

        ext = File.extname(f.original_filename)
        raise 'Not allowed' unless IMAGE_EXT.include?(ext)
        blob = ActiveStorage::Blob.create_after_upload!(
            io:f,
            filename: f.original_filename,
            content_type: f.content_type
        )
        render json: { link:url_for(blob) }
    }
    end