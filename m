Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C508748EB12
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jan 2022 14:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BEB10E46C;
	Fri, 14 Jan 2022 13:50:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CDB10E3FD
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 13:50:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso7371134wmj.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jan 2022 05:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QlfUyIUz6TZ7yZAydMTFa8R0n21bBwrBoXg4y4T/PnQ=;
 b=aL473+zaFEgZEU1qAMYwu8+xpeSxu6FTrMOFKzXZgG0VdHjzov+RUaN6rfHXuxwdzk
 ai7hzyNum+WCNexRntHJ2SgghSC3itCGotJoQQ12ywEgOjOf+mbrtKbnEF5+CVJn/wGx
 01Y24PA3V+kq0oTmhLhIh7tboMEPrLKLPCsL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QlfUyIUz6TZ7yZAydMTFa8R0n21bBwrBoXg4y4T/PnQ=;
 b=gptNRKZIaaKdqvWnchlwnrwykFFnrkYlvqbra2bWHagiHZJy3MjswnDZG0urMUQvyp
 6vJX2/wkJem7YImT7T7bOVdCxTm9B0L7C+nOyK3XUnwPeH67SvbMTLWPmvR2NYm0F2v/
 w/e2Hn/0+v57P+Joq9Ntqqfsuy+dldrs5onC3ucv+prlSmIl/NC4x42vqn6yFk85+0GH
 VQTnLq04y6stja1xq+oJI1rigPmILT2HeHuYVwD1/PqXFPAnjcEcar1Uy+fjenuDGr/r
 nuZQ+1shwuinLkF2LapAmBdpCjLr79XRm6qPxvqkDFW+IENFHQCT+CPbZWqz/w9WO8YS
 ELwg==
X-Gm-Message-State: AOAM533IYA17WY0vgOlG/8KyM9Hanj1ELPIYbT1K5YcjA8syPTUqRUhR
 LS9Vy3wYbBesVgf4NpIsaN/XAQ==
X-Google-Smtp-Source: ABdhPJznrmGvxDxG4pjsYtRUoBmrx4I/PxegzCDv1ubNeIeMu9gkrbGXAO1gogcweN4TSpfmh3slGA==
X-Received: by 2002:a05:600c:4e4b:: with SMTP id
 e11mr8383007wmq.28.1642168230917; 
 Fri, 14 Jan 2022 05:50:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm10160303wmq.31.2022.01.14.05.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 05:50:29 -0800 (PST)
Date: Fri, 14 Jan 2022 14:50:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu, amdkfd drm-next-5.17
Message-ID: <YeF/oxPpNcc3doV4@phenom.ffwll.local>
References: <20220113030537.5758-1-alexander.deucher@amd.com>
 <YeF2+htNyJ7/hp3l@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeF2+htNyJ7/hp3l@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.vetter@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 14, 2022 at 02:13:30PM +0100, Daniel Vetter wrote:
> On Wed, Jan 12, 2022 at 10:05:37PM -0500, Alex Deucher wrote:
> > Hi Dave, Daniel,
> > 
> > Fixes for 5.17.
> > 
> > The following changes since commit cb6846fbb83b574c85c2a80211b402a6347b60b1:
> > 
> >   Merge tag 'amd-drm-next-5.17-2021-12-30' of ssh://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-12-31 10:59:17 +1000)
> > 
> > are available in the Git repository at:
> > 
> >   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-5.17-2022-01-12
> > 
> > for you to fetch changes up to 5eb877b282fecc8b8a6ac6d4ce0d5057f9d3bad0:
> > 
> >   drm/amdkfd: Fix ASIC name typos (2022-01-11 15:44:28 -0500)
> 
> The baseline you picked here is a bit funny because you have a bugfix here
> for a problem which is only in 5.16, and your branch isn't including 5.16.
> 
> Maybe add this dim check to your script?
> 
> dim: f38b0d48cae8 ("drm/amd/pm: keep the BACO feature enabled for suspend"): Fixes: SHA1 in not pointing at an ancestor:
> dim:     daf8de0874ab5b ("drm/amdgpu: always reset the asic in suspend (v2)")
> 
> Anyway pulled into drm-next, thanks.

Ok I lied, it fails to compile on 32bit arm at least:

ERROR: modpost: "__bad_udelay" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
make[1]: *** Deleting file 'modules-only.symvers'
make: *** [Makefile:1761: modules] Error 2
make: *** Waiting for unfinished jobs....

Dropping the pull.
-Daniel

> -Daniel
> 
> > 
> > ----------------------------------------------------------------
> > amd-drm-next-5.17-2022-01-12:
> > 
> > amdgpu:
> > - SR-IOV fixes
> > - Suspend/resume fixes
> > - Display fixes
> > - DMCUB fixes
> > - DP alt mode fixes
> > - RAS fixes
> > - UBSAN fix
> > - Navy Flounder VCN fix
> > - ttm resource manager cleanup
> > - default_groups change for kobj_type
> > - vkms fix
> > - Aldebaran fixes
> > 
> > amdkfd:
> > - SDMA ECC interrupt fix
> > - License clarification
> > - Pointer check fix
> > - DQM fixes for hawaii
> > - default_groups change for kobj_type
> > - Typo fixes
> > 
> > ----------------------------------------------------------------
> > Charlene Liu (1):
> >       drm/amd/display: Add check for forced_clocks debug option
> > 
> > Evan Quan (1):
> >       drm/amd/pm: keep the BACO feature enabled for suspend
> > 
> > Felix Kuehling (3):
> >       drm/amdkfd: Use prange->list head for insert_list
> >       drm/amdkfd: Use prange->update_list head for remove_list
> >       drm/amdkfd: Fix DQM asserts on Hawaii
> > 
> > Greg Kroah-Hartman (2):
> >       drm/amdgpu: use default_groups in kobj_type
> >       drm/amdkfd: use default_groups in kobj_type
> > 
> > Guchun Chen (1):
> >       drm/amdgpu: use spin_lock_irqsave to avoid deadlock by local interrupt
> > 
> > Harry Wentland (1):
> >       drm/amdgpu: Use correct VIEWPORT_DIMENSION for DCN2
> > 
> > James Yao (1):
> >       drm/amdgpu: add dummy event6 for vega10
> > 
> > Jiasheng Jiang (1):
> >       drm/amdkfd: Check for null pointer after calling kmemdup
> > 
> > Jiawei Gu (1):
> >       drm/amdgpu: Clear garbage data in err_data before usage
> > 
> > Jos� Exp�sito (1):
> >       drm/amd/display: invalid parameter check in dmub_hpd_callback
> > 
> > Kent Russell (1):
> >       drm/amdkfd: Fix ASIC name typos
> > 
> > Leslie Shi (1):
> >       drm/amdgpu: Unmap MMIO mappings when device is not unplugged
> > 
> > Lukas Bulwahn (1):
> >       drm/amdkfd: make SPDX License expression more sound
> > 
> > Mario Limonciello (4):
> >       drm/amdgpu: explicitly check for s0ix when evicting resources
> >       drm/amdgpu: don't set s3 and s0ix at the same time
> >       drm/amd/display: explicitly set is_dsc_supported to false before use
> >       drm/amd/display: reset dcn31 SMU mailbox on failures
> > 
> > Mikita Lipski (1):
> >       drm/amd/display: introduce mpo detection flags
> > 
> > Nicholas Kazlauskas (2):
> >       drm/amd/display: Don't reinitialize DMCUB on s0ix resume
> >       drm/amd/display: Add version check before using DP alt query interface
> > 
> > Nirmoy Das (4):
> >       drm/amdgpu: do not pass ttm_resource_manager to gtt_mgr
> >       drm/amdkfd: remove unused function
> >       drm/amdgpu: do not pass ttm_resource_manager to vram_mgr
> >       drm/amdgpu: recover gart table at resume
> > 
> > Peng Ju Zhou (1):
> >       drm/amdgpu: Enable second VCN for certain Navy Flounder.
> > 
> > Prike Liang (1):
> >       drm/amdgpu: not return error on the init_apu_flags
> > 
> > Rajneesh Bhardwaj (1):
> >       Revert "drm/amdgpu: Don't inherit GEM object VMAs in child process"
> > 
> > Tao Zhou (1):
> >       drm/amd/pm: only send GmiPwrDnControl msg on master die (v3)
> > 
> > Tom St Denis (1):
> >       drm/amd/amdgpu: Add pcie indirect support to amdgpu_mm_wreg_mmio_rlc()
> > 
> > Wenjing Liu (1):
> >       drm/amd/display: unhard code link to phy idx mapping in dc link and clean up
> > 
> > Yi-Ling Chen (1):
> >       drm/amd/display: Fix underflow for fused display pipes case
> > 
> > yipechai (1):
> >       drm/amdkfd: enable sdma ecc interrupt event can be handled by event_interrupt_wq_v9
> > 
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   7 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   1 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   5 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  36 ++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   6 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c           |  84 +-----------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   3 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c        |  17 +--
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  14 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  12 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   7 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  11 ++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h            |  12 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   9 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |   5 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |  40 +++---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c              |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c              |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c              |   3 +-
> >  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |  17 ++-
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  11 ++
> >  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   2 +
> >  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   3 +
> >  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   6 +-
> >  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   9 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   1 +
> >  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |   3 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  23 ++--
> >  drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |   4 -
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  44 ++++++-
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
> >  .../drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c   |   6 +
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 145 +++++++++------------
> >  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  33 +++++
> >  .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |   7 +-
> >  .../amd/display/dc/dcn31/dcn31_dio_link_encoder.c  | 114 +++++++++++++---
> >  .../gpu/drm/amd/display/dc/dcn31/dcn31_resource.c  |   2 +-
> >  drivers/gpu/drm/amd/display/dc/dm_cp_psp.h         |   4 +-
> >  drivers/gpu/drm/amd/display/dc/inc/resource.h      |   1 +
> >  drivers/gpu/drm/amd/display/modules/inc/mod_hdcp.h |   2 +-
> >  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   8 +-
> >  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c |  16 ++-
> >  include/uapi/linux/kfd_sysfs.h                     |   2 +-
> >  46 files changed, 422 insertions(+), 330 deletions(-)
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
