# frozen_string_literal: true

module Nknm
  module Lists
    describe Directory do
      let(:path) { File.join(File.dirname(__FILE__), "directory", "example") }
      subject { described_class.new(path) }

      describe "#items" do
        let(:paths) { subject.items.map(&:to_s) }
        let(:words) { subject.items.map(&:to_word) }

        context "entire directory" do
          it "finds all files+directories from the path" do
            expect(paths).to match_array [
              File.join(path, "File 1.txt"),
              File.join(path, "file 2.txt"),
              File.join(path, "directory_a"),
              File.join(path, "Directory_B"),
              File.join(path, "directory_c")
            ]
          end

          it "can translate the entries into words" do
            expect(words).to match_array [
              "file 1.txt",
              "file 2.txt",
              "directory_a",
              "directory_b",
              "directory_c"
            ]
          end
        end

        context "files only" do
          subject { described_class.new(path, include_subdirs: false) }

          it "finds all files+directories from the path" do
            expect(paths).to match_array [
              File.join(path, "File 1.txt"),
              File.join(path, "file 2.txt")
            ]
          end

          it "can translate the entries into words" do
            expect(words).to match_array [
              "file 1.txt",
              "file 2.txt"
            ]
          end
        end

        context "subdirectories only" do
          subject { described_class.new(path, include_files: false) }

          it "finds all files+directories from the path" do
            expect(paths).to match_array [
              File.join(path, "directory_a"),
              File.join(path, "Directory_B"),
              File.join(path, "directory_c")
            ]
          end

          it "can translate the entries into words" do
            expect(words).to match_array [
              "directory_a",
              "directory_b",
              "directory_c"
            ]
          end
        end

        context "nothing" do
          subject { described_class.new(path, include_files: false, include_subdirs: false) }

          it "finds nothing at all" do
            expect(paths).to be_empty
          end

          it "has no words" do
            expect(words).to be_empty
          end
        end
      end

      describe "#matches_for" do
        it "will respond to #matches_for, and that's good enough" do
          expect(subject).to respond_to :matches_for
        end
      end
    end
  end
end
