Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD11A6A2D
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2020 18:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130A68997E;
	Mon, 13 Apr 2020 16:46:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from freki.datenkhaos.de (freki.datenkhaos.de [81.7.17.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B164B8997E
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2020 16:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by freki.datenkhaos.de (Postfix) with ESMTP id 24492276C9E7;
 Mon, 13 Apr 2020 18:46:21 +0200 (CEST)
Received: from freki.datenkhaos.de ([127.0.0.1])
 by localhost (freki.datenkhaos.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H33757ZjMHT2; Mon, 13 Apr 2020 18:46:18 +0200 (CEST)
Received: from latitude (x4e36eca3.dyn.telefonica.de [78.54.236.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by freki.datenkhaos.de (Postfix) with ESMTPSA;
 Mon, 13 Apr 2020 18:46:18 +0200 (CEST)
Date: Mon, 13 Apr 2020 18:46:13 +0200
From: Johannes Hirte <johannes.hirte@datenkhaos.de>
To: Prike Liang <Prike.Liang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix the hw hang during perform system reboot
 and reset
Message-ID: <20200413164613.GA2148@latitude>
References: <1586790530-19464-1-git-send-email-Prike.Liang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586790530-19464-1-git-send-email-Prike.Liang@amd.com>
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
Cc: Xinhui.Pan@amd.com, Rahul.Kumar1@amd.com, ray.huang@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2020 Apr 13, Prike Liang wrote:
> Unify set device CGPG to ungate state before enter poweroff or reset.
> 
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> Tested-by: Mengbing Wang <Mengbing.Wang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 87f7c12..bbe090a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2413,6 +2413,8 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
>  {
>  	int i, r;
>  
> +	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
> +	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
>  
>  	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>  		if (!adev->ip_blocks[i].status.valid)
> -- 
> 2.7.4
> 

I can confirm that this fixes the shutdown/reboot hang on my raven.

-- 
Regards,
  Johannes Hirte

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
