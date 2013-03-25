function newCellArray = combineCellArrays(base, el1, el2)

cellcombined = [base(:) el1(:) el2(:)];
celltranspose = cellcombined';
newCellArray = celltranspose(:)

end

