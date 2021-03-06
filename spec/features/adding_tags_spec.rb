feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'

    fill_in 'tag',  with: 'education'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tag',  with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    p link.tags.map(&:name)
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end

    scenario 'I can choose not to add a tag' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tag',  with: ''
    click_button 'Create link'
    link = Link.first
    expect(link.tags).to be_empty
  end

end