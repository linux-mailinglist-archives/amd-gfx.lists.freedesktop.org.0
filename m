Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E9F4F639
	for <lists+amd-gfx@lfdr.de>; Sat, 22 Jun 2019 16:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89FC6E057;
	Sat, 22 Jun 2019 14:34:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 614 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jun 2019 06:12:34 UTC
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4F16E95F
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 06:12:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,403,1557180000"; d="scan'208";a="311051050"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jun 2019 08:02:16 +0200
Date: Sat, 22 Jun 2019 08:02:16 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Mao Wenan <maowenan@huawei.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
In-Reply-To: <20190622030314.169640-1-maowenan@huawei.com>
Message-ID: <alpine.DEB.2.21.1906220801210.3253@hadrien>
References: <20190622030314.169640-1-maowenan@huawei.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-406165930-1561183337=:3253"
X-Mailman-Approved-At: Sat, 22 Jun 2019 14:34:27 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David1.Zhou@amd.com, airlied@linux.ie, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-406165930-1561183337=:3253
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 22 Jun 2019, Mao Wenan wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c: In function ‘amdgpu_pmu_init’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:249:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>   int ret = 0;
>       ^
>
> It is never used since introduction in 9c7c85f7ea1f ("drm/amdgpu: add pmu counters")
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> index 0e6dba9..0bf4dd9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> @@ -246,12 +246,10 @@ static int init_pmu_by_type(struct amdgpu_device *adev,
>  /* init amdgpu_pmu */
>  int amdgpu_pmu_init(struct amdgpu_device *adev)
>  {
> -	int ret = 0;
> -
>  	switch (adev->asic_type) {
>  	case CHIP_VEGA20:
>  		/* init df */
> -		ret = init_pmu_by_type(adev, df_v3_6_attr_groups,
> +		init_pmu_by_type(adev, df_v3_6_attr_groups,
>  				       "DF", "amdgpu_df", PERF_TYPE_AMDGPU_DF,
>  				       DF_V3_6_MAX_COUNTERS);

Maybe it would be better to use ret?

If knowing whether the call has failed is really useless, then maybe the
return type should be void?

julia


>
> --
> 2.7.4
>
>
--8323329-406165930-1561183337=:3253
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--8323329-406165930-1561183337=:3253--
