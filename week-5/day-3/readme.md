# Image Uploading

If you would like to add image, or attachment, uploading to your application we will use a gem. In this case it is the [Shrine gem](https://github.com/janko-m/shrine)

## Getting started

We will be using the [shrine](https://github.com/janko-m/shrine) gem for handling uploads.

### Add the gem

Like most features we add via a `gem` the first step is to add the gem to our `Gemfile`

Open the `Gemfile` in your rails application and add this line:

```ruby
gem 'shrine'
gem 'shrine-sql'
gem 'roda'
```

And then `bundle`

### Configure the gem

Shrine requires configuration to set where the uploaded files are stored. Shrine supports many methods for storing files including: local directory and S3 (Amazon's Simple Storage Service)

We are going to store our images in the database for simplicity.

To configure `shrine` we will create a file `config/initializers/shrine.rb` to store it's configuration.

```ruby
require "shrine"
require "shrine/storage/file_system"

require "shrine/storage/sql"
require "sequel"

DB = Sequel.connect(ActiveRecord::Base.connection_config)
Shrine.storages = {
 cache: Shrine::Storage::Sql.new(database: DB, table: :files),
 store: Shrine::Storage::Sql.new(database: DB, table: :files)
}
Shrine.plugin :download_endpoint, storages: [:store], prefix: "attachments"

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
```

Now we create a table to store the uploads/attachments

```console
rails generate migration CreateFiles content:binary metadata:text
```

Finally we must add this line within the `do ... end` block in our `config/routes.rb`

```ruby
  mount Shrine::DownloadEndpoint => "/attachments"
```

### Adding attachment/images to a model

Lets say the model we are adding the image to is `Item` so we will generate a migration to add the image data to the model.

```console
rails generate migration AddImageDataToItems image_data:text
```

*NOTE* -- if you already had a column named `image_url`, or `image` -- you will want to *generate a migration to remove those columns*

Then let's migrate our database:

```console
rails db:migrate
```

### Creating a model to represent the uploader

Shrine requires us to create a model to represent the upload process. It is here we would configure anything to be done during the upload (e.g. resizing images)

Create the file `app/models/image_uploader.rb`

```ruby
class ImageUploader < Shrine
  # plugins and uploading logic
end
```

### Updating the model

Still assuming we are working with the `Item` model, lets visit `app/models/item.rb`

Add the line

```ruby
  include ImageUploader[:image]
```

### Updating the form to allow an upload field

Still assuming we are working with the `Item` model, lets visit `app/views/items/_form.html.erb` (or `_form.html.haml`)

Add fields for the `image_data`

ERB:
```erb
<%= f.hidden_field :image, value: @item.cached_image_data %>
<%= f.file_field :image %>
```

HAML:
```ruby
= f.hidden_field :image, value: @item.cached_image_data
= f.file_field :image
```

(Don't forget to match any existing style such as Bootstrap)

### Allow the image param

In the controller (in this example `app/controllers/items_controller.rb`) we must update the `items_params` method to add the `:image` field.

## How do we use the upload/image?

If we wanted to show the uploaded image for our `Item` we could do it like this in a view:

ERB:
```erb
<%= image_tag(@item.image_url) %>
```

HAML:
```ruby
= image_tag(@item.image_url)
```

## Processing uploads

- If you are going to use image processing, first:

```sh
brew install imagemagick
```

See [shrine's documentation](https://github.com/janko-m/shrine#processing) for details on processing (e.g. resizing) uploads


