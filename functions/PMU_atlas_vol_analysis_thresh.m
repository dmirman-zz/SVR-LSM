function [atlas_aal_roi, atlas_ba_roi] = PMU_atlas_vol_analysis_thresh(parameters, variables, p_map, threshold)
%[atlas_aal_roi, atlas_ba_roi] = PMU_atlas_vol_analysis_thresh(parameters, variables, p_map, threshold)
%based on PMU_atlas_vol_analysis
%does same thing except instead of using FDR threshold, this one uses a
%user-specified p-threshold
    inv_q_map = zeros(size(p_map));
    inv_q_map(variables.l_idx) = 1-p_map(variables.l_idx);
    q_idx = find(inv_q_map <= 1-threshold);
    inv_q_map(q_idx) = 0;
    inv_q_map = remove_scatter_clusters(inv_q_map, parameters.min_cluster_size);
    mask_idx = find(inv_q_map > 1-threshold);
%     inv_p_map = zeros(size(p_map));
%     inv_p_map(variables.l_idx) = 1-p_map(variables.l_idx);
%     mask_idx = find(inv_p_map > 1-variables.q_fdr); 
    [atlas_aal_roi, atlas_ba_roi] = get_significant_roi(variables, mask_idx);

    % output the AAL atlas area name and significant voxel number for highlited ROIs
    fid = fopen([variables.atlas_aal_roi_filename, '_pthresh.txt'], 'w');
    fprintf(fid, '============ Threshold: p < %7.4f \n', threshold);
    if(size(atlas_aal_roi,1) == 0)
        fprintf(fid, '\nNone\n');
    else
        fprintf(fid, 'index | %15s    | \t voxel number\n', 'atlas_name');
        for ni=1:size(atlas_aal_roi,1)
            fprintf(fid, ' %3d, %20s, %6d out of %6d voxels\n', atlas_aal_roi(ni,1), variables.atlas_aal.name{atlas_aal_roi(ni,1)}, atlas_aal_roi(ni,2), atlas_aal_roi(ni,3));
        end
    end
    fclose(fid);

    % output the Brodmann Area name and significant voxel number for highlited ROIs
    fid = fopen([variables.atlas_ba_roi_filename, '_pthresh.txt'], 'w');
    fprintf(fid, '============ Threshold: p < %7.4f \n', threshold);
    if(size(atlas_ba_roi,1) == 0)
        fprintf(fid, '\nNone\n');
    else
        fprintf(fid, 'index | voxel number\n', 'atlas_name');
        for ni=1:size(atlas_ba_roi,1)
            fprintf(fid, ' %3d, %6d out of %6d voxels\n', atlas_ba_roi(ni,1), atlas_ba_roi(ni,2), atlas_ba_roi(ni,3));
        end
    end
    fclose(fid);        
end
