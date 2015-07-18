require 'faraday'
require 'json'

describe "api access to posts" do
  let(:conn) {Faraday.new(url: "http://localhost:3000")}

  it "gets a list of posts" do
    resp = conn.get("/posts")

    posts = JSON.parse(resp.body)
    expect(posts.size).to eq(1)

    post = posts.first
    expect(post["title"]).to eq("json-server")
    expect(post["author"]).to eq("typicode")
  end

  it "gets a single post" do
    resp = conn.get("/posts/1")

    post = JSON.parse(resp.body)
    expect(post["title"]).to eq("json-server")
    expect(post["author"]).to eq("typicode")
  end
end
