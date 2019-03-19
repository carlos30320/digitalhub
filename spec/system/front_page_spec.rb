require "rails_helper"

RSpec.describe "Front Page", :type => :system do
  it "enables me to view the front page" do
    new_page = create(:page)
    visit "/"
    expect(page).to have_text("MetroCommon 2050")
  end

  it "footer is accessible", js: true do
    create(:page)
    visit "/"
    expect(page).to be_accessible.within '.footer'
  end

  it "announcements carousel is accessible", js: true do
    create(:page)
    create(:announcement)
    visit "/"
    expect(page).to be_accessible.within '.announcements'
  end

  it "displays new content when I click an announcemnt button", js: true do
    create(:page)
    create(:announcement)
    announcement = create(:announcement)
    visit "/"
    within('.announcements__numbers') do
      click_on('2')
    end
    expect(page).to have_text(announcement.title)
  end

  it "goes to a link when I click the more information button", js: true do
    create(:page)
    announcement = create(:announcement)
    visit "/"
    expect(page).to have_link(href: announcement.link)
  end
end
