Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD2F1E635E
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2020 16:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF806E148;
	Thu, 28 May 2020 14:08:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06D0A6E575
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2020 13:54:57 +0000 (UTC)
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
 by smtp.ispras.ru (Postfix) with ESMTP id 9F9E6201D0;
 Thu, 28 May 2020 16:54:54 +0300 (MSK)
Date: Thu, 28 May 2020 16:54:54 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] Revert "drm/amd/display: disable dcn20 abm feature for
 bring up"
In-Reply-To: <20200528134807.5665-1-harry.wentland@amd.com>
Message-ID: <alpine.LNX.2.20.13.2005281652440.18802@monopod.intra.ispras.ru>
References: <20200528134807.5665-1-harry.wentland@amd.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 14:08:39 +0000
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
Cc: Anthony Koo <Anthony.Koo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 amd-gfx@lists.freedesktop.org, Michael Chiu <Michael.Chiu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On Thu, 28 May 2020, Harry Wentland wrote:

> This reverts commit 96cb7cf13d8530099c256c053648ad576588c387.
> 
> This change was used for DCN2 bringup and is no longer desired.
> In fact it breaks backlight on DCN2 systems.

Reported-and-tested-by: Alexander Monakov <amonakov@ispras.ru>

Thanks.

> Cc: Alexander Monakov <amonakov@ispras.ru>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Anthony Koo <Anthony.Koo@amd.com>
> Cc: Michael Chiu <Michael.Chiu@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ddc979e3eebe..acd4874e0743 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1356,7 +1356,7 @@ static int dm_late_init(void *handle)
>  	unsigned int linear_lut[16];
>  	int i;
>  	struct dmcu *dmcu = NULL;
> -	bool ret = false;
> +	bool ret;
>  
>  	if (!adev->dm.fw_dmcu)
>  		return detect_mst_link_for_all_connectors(adev->ddev);
> @@ -1377,13 +1377,10 @@ static int dm_late_init(void *handle)
>  	 */
>  	params.min_abm_backlight = 0x28F;
>  
> -	/* todo will enable for navi10 */
> -	if (adev->asic_type <= CHIP_RAVEN) {
> -		ret = dmcu_load_iram(dmcu, params);
> +	ret = dmcu_load_iram(dmcu, params);
>  
> -		if (!ret)
> -			return -EINVAL;
> -	}
> +	if (!ret)
> +		return -EINVAL;
>  
>  	return detect_mst_link_for_all_connectors(adev->ddev);
>  }
> 
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
