require 'rails_helper'

RSpec.describe "Posts", type: :system do
  include LoginMacros

  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }
  let(:dish) { create(:dish) }
  let(:area_tag) { create(:area_tag) }
  let(:genre_tag) { create(:genre_tag) }
  let(:taste_tag) { create(:taste_tag) }
  let(:outher_tag) { create(:outher_tag) }
  let(:post) { create(:post, user: user, dish: dish, area_tags: [ area_tag ], genre_tags: [ genre_tag ], taste_tags: [ taste_tag ], outher_tags: [ outher_tag ]) }

  describe "ログイン前" do
    describe "ページ遷移確認" do
      context "記事作成ページにアクセス" do
        it "記事作成ページへのアクセスが失敗する" do
          visit new_post_path
          expect(current_path).to eq login_path
        end
      end

      context "記事編集ページにアクセス" do
        it "記事編集ページへのアクセスが失敗する" do
          visit edit_post_path(post)
          expect(current_path).to eq login_path
        end
      end

      context "記事詳細ページにアクセス" do
        it "記事詳細ページへのアクセスが成功する" do
          visit post_path(post)
          expect(page).to have_content post.title
          expect(current_path).to eq post_path(post)
        end
      end
    end
  end

  describe "ログイン後" do
    before { login_as(user) }

    describe "記事作成" do
      context "フォームの入力値が正常" do
        it "記事の作成が成功する" do
          visit new_post_path
          fill_in "料理名", with: "ごはん"
          attach_file "メイン画像", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/1.jpg")
          fill_in "出典", with: "出典A"
          fill_in "店舗情報", with: "店A"
          fill_in "詳細用紹介文", with: "しょうさいせつめい"
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: "エリアA,エリアB"
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          # text_field_tagを使っている場合は、fill_inで指定する名前も実際の名前に合わせる必要がある
          click_button "登録"
          expect(page).to have_content "記事の作成をしました"
          expect(current_path).to eq user_posts_path(user)
        end
      end

      context "料理名が未入力" do
        it "記事の作成が失敗する" do
          visit new_post_path
          fill_in "料理名", with: ""
          attach_file "メイン画像", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/1.jpg")
          fill_in "出典", with: "出典A"
          fill_in "店舗情報", with: "店A"
          fill_in "詳細用紹介文", with: "しょうさいせつめい"
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: "エリアA,エリアB"
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          click_button "登録"
          expect(page).to have_content "記事の作成に失敗しました"
          expect(page).to have_content "料理名を入力してください"
          expect(current_path).to eq posts_path
          # render :new実行後はnew_post_pathではなくposts_path
        end
      end

      context "メイン画像が未入力" do
        it "記事の作成が失敗する" do
          visit new_post_path
          fill_in "料理名", with: "ごはん"
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/1.jpg")
          fill_in "出典", with: "出典A"
          fill_in "店舗情報", with: "店A"
          fill_in "詳細用紹介文", with: "しょうさいせつめい"
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: "エリアA,エリアB"
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          click_button "登録"
          expect(page).to have_content "記事の作成に失敗しました"
          expect(page).to have_content "メイン画像を入力してください"
          expect(current_path).to eq posts_path
        end
      end

      context "詳細用紹介文が未入力" do
        it "記事の作成が失敗する" do
          visit new_post_path
          fill_in "料理名", with: "ごはん"
          attach_file "メイン画像", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/1.jpg")
          fill_in "出典", with: "出典A"
          fill_in "店舗情報", with: "店A"
          fill_in "詳細用紹介文", with: ""
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: "エリアA,エリアB"
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          click_button "登録"
          expect(page).to have_content "記事の作成に失敗しました"
          expect(page).to have_content "詳細用紹介文を入力してください"
          expect(current_path).to eq posts_path
        end
      end

      context "エリアタグが未入力" do
        it "記事の作成が失敗する" do
          visit new_post_path
          fill_in "料理名", with: "ごはん"
          attach_file "メイン画像", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/1.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/1.jpg")
          fill_in "出典", with: "出典A"
          fill_in "店舗情報", with: "店A"
          fill_in "詳細用紹介文", with: "しょうさいせつめい"
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: ""
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          click_button "登録"
          expect(page).to have_content "タグが入力されてません"
          expect(current_path).to eq posts_path
        end
      end
    end

    describe "記事編集" do
      context "フォームの入力値が正常" do
        it "記事の編集が成功する" do
          visit edit_post_path(post)
          fill_in "料理名", with: "パン"
          attach_file "メイン画像", Rails.root.join("spec/fixtures/files/susi.jpg")
          attach_file "サブ画像１", Rails.root.join("spec/fixtures/files/susi.jpg")
          attach_file "サブ画像２", Rails.root.join("spec/fixtures/files/susi.jpg")
          fill_in "出典", with: "出典B"
          fill_in "店舗情報", with: "店B"
          fill_in "詳細用紹介文", with: "しょうさいせつめいB"
          fill_in "post[post_area_tags_attributes][0][area_tag_attributes][name]", with: "エリアA,エリアB"
          fill_in "post[post_genre_tags_attributes][0][genre_tag_attributes][name]", with: "ジャンルA,ジャンルB"
          fill_in "post[post_taste_tags_attributes][0][taste_tag_attributes][name]", with: "味A,味B"
          fill_in "post[post_outher_tags_attributes][0][outher_tag_attributes][name]", with: "その他A,その他B"
          # text_field_tagを使っている場合は、fill_inで指定する名前も実際の名前に合わせる必要がある
          click_button "更新"
          expect(page).to have_content "更新しました"
          expect(current_path).to eq user_posts_path(user)
        end
      end
    end
  end
end
