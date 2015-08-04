require 'rspec'
require 'family'

RSpec.describe Family do
    # lookup(a)
    # list_members
    # add_parentage(ab), add_parentage(bc), list_members
    # add_parentage(ab),  list members, find_or_create(a), lookup(b)
    # lookup(a), find_or_create(a), list_members, lookup(a), find_or_create(a)
end
