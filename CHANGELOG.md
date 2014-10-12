
*   Update to the latest libgit2 version (bd62dc6fdde123339844dc199a6c3b8ba0630afa).

    *Arthur Schreiber*

*   Add `Repository#merge_bases`.

    This returns an array containing all merge bases between one or
    multiple commits.

    *Arthur Schreiber*

*   Add submodule support.

    Expose git submodules functionality through `Rugged::Submodule` and
    `Rugged::SubmoduleCollection`.

    *Nikolai Vladimirov*

*   Add `Rugged::Walker#push_range`.

    *Evgeniy Sokovikov*

## Rugged 0.21.1b2 (October 1, 2014) ##

*   Update to the latest libgit2 version (9f57fd64436b6441684ce5e6641a0e390304224d).

    *Vicent Martí*

*   Implement `Rugged::Blob::HashSignature` and `Rugged::Blob#hashsig`.

    Allows similarity detection of `Rugged::Blob` instances against other blobs or
    arbitrary strings.

    *Vicent Martí*

## Rugged 0.21.1b1 (September 17, 2014) ##

*   Update to the latest libgit2 version (ecef28d55c7d72dda0e33649614f2b20db482cd6).

    *Arthur Schreiber*


## Rugged 0.21.1b0 (September 11, 2014) ##

*   Update to the latest libgit2 version (31e752b6546537bbeee89b6d2f3027cf0eff9a53).

    *Vicent Martí*

*   Add `Rugged::Repository#attributes`.

    This method allows accessing the attributes for different path names as
    specified by `.gitattributes` files.

    *Vicent Martí*

*   Add `Rugged::TagCollection#create_annotation`.

    This method allows the creation of a tag object, but without creating
    a tag reference.

    *Charlie Somerville*

*   Add `Rugged::Repository#cherrypick`.

    *Arthur Schreiber*

*   Add `Rugged::Repository#descendant_of?`

    *Jake Douglas*

*   `Rugged::Index#read_tree` now actually checks that the given object is a
    `Rugged::Tree` instance.

    Fixes #401.

    *Andy Delcambre*

*   Add `Rugged::Repository#expand_oids`.

    This allows expanding a list of shortened SHA1 strings, optionally restricting
    the expansion to a specific object type.

    *Vicent Martí*

*   Add `Rugged::Remote#check_connection`.

    This is useful if one needs to check if it is possible to fetch/push
    from/to the remote.

    Basically, it is analogue to `git fetch --dry-run` and `git push --dry-run`.

    *Dmitry Medvinsky*

*   Remove defunct `Rugged::Diff::Line#hunk` and `Rugged::Diff::Line#owner`.

    Fixes #390.

    *Arthur Schreiber*

*   Remove `Rugged::Diff#tree` and change `Rugged::Diff#owner` to return the
    repository that the `Rugged::Diff` object belongs to.

    We need to keep a reference from the `Rugged::Diff` to the repository to
    ensure that the underlying libgit2 data does not get freed accidentally.

    Fixes #389.

    *Arthur Schreiber*

*   Add `#additions` and `#deletions` to `Rugged::Patch`.

    *Mindaugas Mozūras*
