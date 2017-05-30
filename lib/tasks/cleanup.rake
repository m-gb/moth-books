namespace :cleanup do
  desc "Delete unused carts"
  task delete_unused_carts: :environment do
    Cart.cleanup
  end
end
