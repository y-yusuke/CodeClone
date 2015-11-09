select CODE_FRAGMENT.CODE_FRAGMENT_ID,CODE_FRAGMENT_GENEALOGY_LINK_ELEMENT.CODE_FRAGMENT_GENEALOGY_ID,
		CRD.TYPE,REPOSITORY.REPOSITORY_ROOT_URL,FILE.FILE_PATH,CODE_FRAGMENT.START_LINE,CODE_FRAGMENT.END_LINE,REVISION.REVISION_IDENTIFIER,
		CODE_FRAGMENT_LINK.BEFORE_COMBINED_REVISION_ID,CODE_FRAGMENT_LINK.AFTER_COMBINED_REVISION_ID,
		CODE_FRAGMENT.START_COMBINED_REVISION_ID,CODE_FRAGMENT.END_COMBINED_REVISION_ID
from ((((((
	CODE_FRAGMENT_LINK INNER JOIN CODE_FRAGMENT_GENEALOGY_LINK_ELEMENT
	ON CODE_FRAGMENT_LINK.CODE_FRAGMENT_LINK_ID = CODE_FRAGMENT_GENEALOGY_LINK_ELEMENT.CODE_FRAGMENT_LINK_ID
	)INNER JOIN CODE_FRAGMENT
	ON CODE_FRAGMENT_LINK.AFTER_ELEMENT_ID = CODE_FRAGMENT.CODE_FRAGMENT_ID
	)INNER JOIN CRD
	ON CODE_FRAGMENT.CRD_ID = CRD.CRD_ID
	)INNER JOIN FILE
	ON CODE_FRAGMENT.OWNER_FILE_ID = FILE.FILE_ID
	)INNER JOIN REPOSITORY
	ON CODE_FRAGMENT.OWNER_REPOSITORY_ID = REPOSITORY.REPOSITORY_ID
	)INNER JOIN REVISION
	ON CODE_FRAGMENT_LINK.AFTER_COMBINED_REVISION_ID = REVISION.REVISION_ID
)
where CODE_FRAGMENT_LINK.AFTER_COMBINED_REVISION_ID = 4