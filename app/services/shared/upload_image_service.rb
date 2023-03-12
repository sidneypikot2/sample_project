#!/usr/bin/ruby
# Should be transfered to utitilies
class Shared::UploadImageService < ApplicationService

  def call
    attacher_class = Object.const_get(context.attacher_class)
    record         = Object.const_get(context.record_class).find(context.record_id) # if using Active Record
    attacher = attacher_class.retrieve(model: record, name: context.name, file: context.file_data)
    attacher.atomic_promote
  rescue Shrine::AttachmentChanged, ActiveRecord::RecordNotFound
  end
end