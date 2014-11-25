puts-step "Installing Pelican"
pip install -U --use-mirrors pelican | indent

puts-step "Installing Markdown"
pip install --use-mirrors Markdown | indent
