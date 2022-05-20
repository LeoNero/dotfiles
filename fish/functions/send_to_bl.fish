function send_to_bl
rsync -azP --delete --exclude=.git/ /Users/nerone/Documents/Projects/Classes/CIS571/lc4-labs/ nerone@big23.seas.upenn.edu:/home1/n/nerone/lc4-labs
end
