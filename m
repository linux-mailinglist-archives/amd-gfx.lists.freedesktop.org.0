Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7E1A5B9E
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Apr 2020 02:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D246E027;
	Sun, 12 Apr 2020 00:04:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 507 seconds by postgrey-1.36 at gabe;
 Sun, 12 Apr 2020 00:04:12 UTC
Received: from freki.datenkhaos.de (freki.datenkhaos.de [81.7.17.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295806E027
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Apr 2020 00:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by freki.datenkhaos.de (Postfix) with ESMTP id 24D08275D300;
 Sun, 12 Apr 2020 01:55:43 +0200 (CEST)
Received: from freki.datenkhaos.de ([127.0.0.1])
 by localhost (freki.datenkhaos.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZQMjz_wzVdw; Sun, 12 Apr 2020 01:55:40 +0200 (CEST)
Received: from latitude (x4d0d581f.dyn.telefonica.de [77.13.88.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by freki.datenkhaos.de (Postfix) with ESMTPSA;
 Sun, 12 Apr 2020 01:55:40 +0200 (CEST)
Date: Sun, 12 Apr 2020 01:55:34 +0200
From: Johannes Hirte <johannes.hirte@datenkhaos.de>
To: Prike Liang <Prike.Liang@amd.com>
Subject: Re: [PATCH v2] drm/amdgpu: fix gfx hang during suspend with video
 playback (v2)
Message-ID: <20200411235534.GA1930@latitude>
References: <1586265256-8824-1-git-send-email-Prike.Liang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586265256-8824-1-git-send-email-Prike.Liang@amd.com>
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
Cc: Alexander.Deucher@amd.com, ray.huang@amd.com, evan.quan@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2020 Apr 07, Prike Liang wrote:
> The system will be hang up during S3 suspend because of SMU is pending
> for GC not respose the register CP_HQD_ACTIVE access request.This issue
> root cause of accessing the GC register under enter GFX CGGPG and can
> be fixed by disable GFX CGPG before perform suspend.
> 
> v2: Use disable the GFX CGPG instead of RLC safe mode guard.
> 
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> Tested-by: Mengbing Wang <Mengbing.Wang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2e1f955..bf8735b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2440,8 +2440,6 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
>  {
>  	int i, r;
>  
> -	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
> -	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
>  
>  	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>  		if (!adev->ip_blocks[i].status.valid)
> @@ -3470,6 +3468,9 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>  		}
>  	}
>  
> +	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
> +	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
> +
>  	amdgpu_amdkfd_suspend(adev, !fbcon);
>  
>  	amdgpu_ras_suspend(adev);


This breaks shutdown/reboot on my system (Dell latitude 5495). 

-- 
Regards,
  Johannes Hirte

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
