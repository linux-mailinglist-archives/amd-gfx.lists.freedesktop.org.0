Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411702ECC3C
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Jan 2021 10:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A2F6E416;
	Thu,  7 Jan 2021 09:04:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7193A6E420
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 09:04:17 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id y23so4861372wmi.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 Jan 2021 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=enb4Nt3fTLMHrulGqTJpjJIRVO21F5Z7R2GigQ0UdLw=;
 b=PccwS+g2JWld3SUsy2YbbLhonB7wbu/PfugysVeKA4JPTpxkznKcb6H/ZfHM7ZSjgk
 mBVPr46pfMZCEI5Rn+ohmfK0FfOep/uJZ30iRY4HHgAj6l3YvXPhHalBb8cgi098WsXi
 J6IzRxLTESVpH7HfLzTspHtlewle7L5bsxNFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enb4Nt3fTLMHrulGqTJpjJIRVO21F5Z7R2GigQ0UdLw=;
 b=NV5DH0Xb13jk4SQ9ye1jjYvlPAafJqB6pVu+rfOvys57oH+pklTF1J0IZP9BiC50fd
 BhQuWD+zJWTKeJZxZ85PRSZ98jeIy4Yt5HnwfEcaW/GOlR14qfLunwde5hYBokQ1F87i
 dZKCZBGevY8A4r2++xgAdZc6hGE864ay+7T5HQvOVQCiL0+uBqtqe4OEeEmFBVCr9B2O
 8HgoTxAxVwlhCURKQRqfL2PDcWjy5afjha9RMgkT9D51tHKwLRPCV280VpB3eh7ssuy0
 SBLp1oJf11U7nfzbzVHywyfK00MDTTBGnaPKGBAaUSmbIO1q6/pDnwZbEGBGqOPTpgMW
 h0MA==
X-Gm-Message-State: AOAM531mXYPQYAu5hAlzpJu+Yx8DLxZVKaQs6TfNY2uqanVog89aEABM
 IHcGWQXxjhykExZ77x37GhsW2g==
X-Google-Smtp-Source: ABdhPJw+qmglJkV0NOIpNmij4HcaJMBpyEzUaoO6nO4MqvkWOt2ySIbGX3XQ2ir97hhtWNvatOX18Q==
X-Received: by 2002:a05:600c:274d:: with SMTP id
 13mr7145629wmw.77.1610010255838; 
 Thu, 07 Jan 2021 01:04:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q143sm6567737wme.28.2021.01.07.01.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:04:14 -0800 (PST)
Date: Thu, 7 Jan 2021 10:04:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [pull] amdgpu drm-fixes-5.11
Message-ID: <X/bOjcOWcFFwf+q8@phenom.ffwll.local>
References: <20210106222721.3934-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106222721.3934-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 05:27:21PM -0500, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> New URL.  FDO ran out of disk space, so I'm attempting to move to gitlab.
> Let me know if you run into any issues.

Worked fine. Did you puing linux-next to update your tree location? Also
legacy fd.o git seems back in shape, at least I can push.
-Daniel

> 
> Thanks
> 
> The following changes since commit 5b2fc08c455bbf749489254a81baeffdf4c0a693:
> 
>   Merge tag 'amd-drm-fixes-5.11-2020-12-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-12-24 10:31:16 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.11-2021-01-06
> 
> for you to fetch changes up to 5efc1f4b454c6179d35e7b0c3eda0ad5763a00fc:
> 
>   Revert "drm/amd/display: Fix memory leaks in S3 resume" (2021-01-06 16:25:06 -0500)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-5.11-2021-01-06:
> 
> amdgpu:
> - Telemetry fix for VGH
> - Powerplay fixes for RV
> - Powerplay fixes for RN
> - RAS fixes for Sienna Cichlid
> - Blank screen regression fix
> - Drop DCN support for aarch64
> - Misc other fixes
> 
> ----------------------------------------------------------------
> Alex Deucher (2):
>       drm/amdgpu/display: drop DCN support for aarch64
>       Revert "drm/amd/display: Fix memory leaks in S3 resume"
> 
> Arnd Bergmann (1):
>       drm/amd/display: Fix unused variable warning
> 
> Dennis Li (3):
>       drm/amdgpu: fix a memory protection fault when remove amdgpu device
>       drm/amdgpu: fix a GPU hang issue when remove device
>       drm/amdgpu: fix no bad_pages issue after umc ue injection
> 
> Hawking Zhang (1):
>       drm/amdgpu: switched to cached noretry setting for vangogh
> 
> Jiawei Gu (1):
>       drm/amdgpu: fix potential memory leak during navi12 deinitialization
> 
> John Clements (2):
>       drm/amd/pm: updated PM to I2C controller port on sienna cichlid
>       drm/amdgpu: enable ras eeprom support for sienna cichlid
> 
> Kevin Wang (1):
>       drm/amd/display: fix sysfs amdgpu_current_backlight_pwm NULL pointer issue
> 
> Xiaojian Du (4):
>       drm/amd/pm: correct the sensor value of power for vangogh
>       drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
>       drm/amd/pm: fix the failure when change power profile for renoir
>       drm/amd/pm: improve the fine grain tuning function for RV/RV2/PCO
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  25 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |   8 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c            |   2 +-
>  drivers/gpu/drm/amd/display/Kconfig                |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   7 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  |   2 +-
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile    |  21 ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      |   7 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   7 -
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   7 -
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile      |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   5 -
>  drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |   4 -
>  drivers/gpu/drm/amd/display/dc/dcn302/Makefile     |   4 -
>  drivers/gpu/drm/amd/display/dc/dml/Makefile        |   4 -
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile        |   4 -
>  drivers/gpu/drm/amd/display/dc/os_types.h          |   4 -
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c   | 166 +++++++++++++++++++--
>  .../gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h   |   3 +
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |   3 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c    |   1 +
>  drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c     |   1 +
>  27 files changed, 200 insertions(+), 113 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
