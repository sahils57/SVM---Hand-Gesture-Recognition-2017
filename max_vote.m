function prediction = max_vote(test_sam)
[test_sam_row, test_sam_col] = size(test_sam);
prediction1 = zeros(test_sam_row,1);
for i = 1:test_sam_row
    [value, predic] = max(test_sam(i,:));
    prediction1(i,1) = predic;
end

prediction = prediction1;

        
        