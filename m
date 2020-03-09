Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01F17E0CF
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Mar 2020 14:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53D66E43A;
	Mon,  9 Mar 2020 13:10:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1106E43A
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Mar 2020 13:10:37 +0000 (UTC)
Received: from localhost (121.sub-174-234-136.myvzw.com [174.234.136.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CE302072A;
 Mon,  9 Mar 2020 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583759436;
 bh=wpeTVCNZjU6JdZ20tL+V8udIJstH6x4xAceRr5Hq9oY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=yII5XcBVmq3Qi+0quYQUXP0PEXz01N9Bzd3AymQUFuVQiEu5FgcmgtuXN0YGTd5Hp
 osusYKxrJkWGXjJ89wng3Yi4w5JGADHfp407nZFirO3ylGzkNU1qIeGGdcUtGXSC7T
 jaQTG6GpCQkNs87EjSL140IGyqyrunsATBuevOb4=
Date: Mon, 9 Mar 2020 08:10:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Prike Liang <Prike.Liang@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: fix pre-check condition for
 setting clock range
Message-ID: <20200309131034.GA64875@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583290538-30426-1-git-send-email-Prike.Liang@amd.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan.quan@amd.com,
 ray.huang@amd.com, linux-kernel@vger.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 10:55:37AM +0800, Prike Liang wrote:
> This fix will handle some MP1 FW issue like as mclk dpm table in
> renoir has a reverse dpm clock layout and a zero frequency dpm level
> as following case.
> 
> cat pp_dpm_mclk
> 0: 1200Mhz
> 1: 1200Mhz
> 2: 800Mhz
> 3: 0Mhz
> 
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
>  drivers/gpu/drm/amd/powerplay/smu_v12_0.c  | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> index e3398f9..d454493 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -214,7 +214,7 @@ int smu_set_soft_freq_range(struct smu_context *smu, enum smu_clk_type clk_type,
>  {
>  	int ret = 0;
>  
> -	if (min <= 0 && max <= 0)
> +	if (min < 0 && max < 0)

This change causes the following Coverity warning because min and max
are both unsigned:

int smu_set_soft_freq_range(struct smu_context *smu, enum smu_clk_type clk_type,
                            uint32_t min, uint32_t max)

>>>     CID 1460516:  Integer handling issues  (NO_EFFECT)
>>>     This less-than-zero comparison of an unsigned value is never true. "min < 0U".
225             if (min < 0 && max < 0)
226                     return -EINVAL;

>  		return -EINVAL;
>  
>  	if (!smu_clk_dpm_is_enabled(smu, clk_type))
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
