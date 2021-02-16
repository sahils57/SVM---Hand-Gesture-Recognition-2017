%%
clear all
%data initialization
load('MNIST_data.mat')
confusion_matrix = zeros(10,10);
x_test= test_samples;
y_test= test_samples_labels;
y_test(y_test == 0)=10; 
[x_row, x_col] = size(x_test);
voting_mat = zeros(x_row, 10);
vote_ker = zeros(10,10);



 

% replace the label for '0' in the data with '10' as the label

% make a matrix for w and b for each classification


tic;

% Train Classifier i ->j
for classifier_i = 1:9 %label of the first classifier
    for classifier_j = classifier_i+1:10 %label of the second classifier
        % the above for loop is such that the pairs don't get repeated and
        % only on on one comparison is done only once
        x = train_samples;
        y = train_samples_labels;
        y(y == 0) = 10;
        
        
        %Remove unnecessary elements for training
        idx = [];
        for i = 1: length(train_samples_labels)
            if y(i)== classifier_i %select class to be 1
                y(i) = 1;
            elseif y(i)== classifier_j %select another class to be -1
                y(i) = -1;
            else
                idx(i) = i; %record the index of the rest of the classes
            end
        end
        
        % the next step just changes the data set to be such that it has
        % teh values from only the two required classes
        idx = idx(idx~=0);
        y(idx) = [];
        x(idx,:) = [];
        if 
        
        
       
        m =size(y); %this finds out the number of total labels under consideration
        
        f = -ones(m(1),1); %creates an array of -1's with te same size as y
        mat_of_kernel = [];
        gama = 0.2;
        for first_x = 1:m(1)
            for second_x = 1:m(1)
                dist_square_each = (norm(x(first_x,:) - x(second_x,:)))^2;
                exp_each = exp(-1*gama*dist_square_each);
                mat_of_kernel(first_x, second_x) = exp_each;
            end
        end
        
        H = (mat_of_kernel).*(y*y'); %Kernel Matrix
        A = -eye(m(1));
        a = zeros(m(1),1);
        B = [y';zeros(m(1)-1,m(1))]; %this is a aquare matrix for size of H woth first row as y
        b = zeros(m(1),1);
        C = zeros(m(1),1)*100;
        stable_term = eye(m(1))*0.001; %use common technique to help otpmization
        alpha = quadprog (H + stable_term,f,A,a,B,b); %maximize alpha
        [alpha_max, ind_alpha_max] = max(alpha);
        
        w = (alpha.*y)'*x; %calculate w for decision boundary
        b = 1/y(ind_alpha_max)-x(ind_alpha_max,:)*w'; %calculate b for decision boundary
       
        
        
        idx_test = [];
        y_p = x_test*w'+b;
        
        for i = 1: length(test_samples_labels)
            %prediction of label
            
            if y_p(i) > 0
                ind_to_add = classifier_i;
                
            else
                ind_to_add = classifier_j;
                
            end
            voting_mat(i, ind_to_add) = voting_mat(i, ind_to_add) + 1;
        end
        
        %adding votes to confusion matrix, note confusion matrix 1->0, 2->1,
        %etc...
        
        
        
        
        
    end
    
    
        
        
end
%%
test_size = size(test_samples);
prediction = max_vote(voting_mat);

for test_ind = 1 : test_size(1)
        y_conf_inx = y_test(test_ind,1);
        x_conf_inx = prediction(test_ind,1);
        confusion_matrix(y_conf_inx,x_conf_inx) = confusion_matrix(y_conf_inx,x_conf_inx) + 1;
end
sum_ii = 0;
for for_acc = 1:10
    sum_ii = sum_ii + confusion_matrix(for_acc, for_acc);
end
acc = 100*sum_ii / 1000;
disp("accuracy is");
disp(acc);
disp(confusion_matrix);
cpu_time=toc; %calculate cpu run-time
%**************************************************************************










