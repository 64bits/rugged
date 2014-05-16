# encoding: UTF-8
require "test_helper"

class RepositoryStatusMiscTest < Rugged::TestCase
  include Rugged::TempRepositoryAccess
  def test_status_with_invalid_file_path
    invalid_file = "something_that_doesnt_exist"
    # "Attempt to get status of nonexistent file '#{invalid_file}'"
    assert_raises Rugged::InvalidError do
      @repo.status(invalid_file)
    end
  end
end

class LibgitRepositoryStatusTest < Rugged::SandboxedTestCase
  STATUSES = {
    "staged_changes" => [:index_modified],
    "staged_changes_file_deleted" => [:index_modified, :worktree_deleted],
    "staged_changes_modified_file" => [:index_modified, :worktree_modified],
    "staged_delete_file_deleted" => [:index_deleted],
    "staged_delete_modified_file" => [:index_deleted, :worktree_new],
    "staged_new_file" => [:index_new],
    "staged_new_file_deleted_file" => [:index_new, :worktree_deleted],
    "staged_new_file_modified_file" => [:index_new, :worktree_modified],
    "file_deleted" => [:worktree_deleted],
    "modified_file" => [:worktree_modified],
    "new_file" => [:worktree_new],
    "ignored_file" => [:ignored],
    "subdir/deleted_file" => [:worktree_deleted],
    "subdir/modified_file" => [:worktree_modified],
    "subdir/new_file" => [:worktree_new],
    "\xe8\xbf\x99" => [:worktree_new]
  }

  STATUSES.each do |file,expected_statuses|
    name = "test_" + file.gsub("/", "__")
    define_method name do
      actual_status = @repo.status file
      assert_equal expected_statuses, actual_status
    end
  end

  def setup
    super
    @repo = sandbox_init "status"
  end

  def test_status_with_callback
    actual_statuses = {}
    @repo.status do |file, status|
      assert_nil actual_statuses[file]
      actual_statuses[file] = status
      assert_equal STATUSES[file], actual_statuses[file]
    end
    assert_equal STATUSES, actual_statuses
  end

end
