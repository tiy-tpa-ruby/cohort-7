
json.tag do
  json.name @tag_name
end

json.notes do
  json.array! @api_notes, partial: 'api/notes/api_note', as: :api_note
end

# {
#   "tag" : {
#     "name" : "funny"
#   },
#   "notes" : [
#     {
#       "title" : "My awesome post",
#       "body" : "My awesome body of a post",
#       "created_at" : "<timestamp>",
#       "updated_at" : "<timestamp>",
#       "tags" : [
#         { "name" : "awesome" },
#         { "name" : "funny" },
#         { "name" : "spiffy" }
#       ]
#     },
#     {
#       "title" : "My awesome second post",
#       "body" : "My awesome body of a second post",
#       "created_at" : "<timestamp>",
#       "updated_at" : "<timestamp>",
#       "tags" : [
#         { "name" : "not_so_awesome" },
#         { "name" : "funny" },
#         { "name" : "not_at_all_spiffy" }
#       ]
#     }
#   ]
# }
