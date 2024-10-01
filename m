Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD598BE5F
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2024 15:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BA810E624;
	Tue,  1 Oct 2024 13:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YKqD4Ys/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32E10E624;
 Tue,  1 Oct 2024 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727790644;
 bh=Wrdy0e1dz6T5uwCE6i2Zj6+AsBKQNypB0lnUzsj5xCI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=YKqD4Ys/oGurqoWIOyx7Wn0hRTWDfyPPhsxJBv4liLaL79RWNITs6yYigoa9t0bYR
 apYOKXRQwcu6+xBYSMhtRzZYX8riNbY3jwGgx54B/mqtnC6ECCMjvF74G/KjKZbgVO
 RJzRdFANc0GPw4iUWTjgPb0VclImiN7kwj4rnOBg0+pqJjlWEITVsXj59SE2r7LUoj
 5BPDH1RBCLKq/QZ/2cqqNz0kemyYFg31AZl1ypfI77sHEXKV+OTQMPdPXhzsDquLmV
 MCPct2nkHj5eYZYOGgoLbN+JW1S3vLWHHoQv7M/X9CrsLunLU6HnxNWpHM5ZiXsYda
 Riy6fn3Jf9ZCg==
Received: from [192.168.50.250] (unknown [171.76.80.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F28B17E0FC0;
 Tue,  1 Oct 2024 15:50:39 +0200 (CEST)
Message-ID: <87fea8ea-fe9d-4114-b03c-7ec50a4be874@collabora.com>
Date: Tue, 1 Oct 2024 19:20:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/gpu: ci: update flake tests requirements
From: Vignesh Raman <vignesh.raman@collabora.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, mripard@kernel.org, rodrigo.vivi@intel.com,
 quic_abhinavk@quicinc.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930095255.2071586-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi amdgpu Maintainers,

On 30/09/24 15:22, Vignesh Raman wrote:
> Update the documentation to specify linking to a relevant GitLab
> issue or email report for each new flake entry. Added specific
> GitLab issue urls for amdgpu, i915, msm and xe driver.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #intel and xe
> Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # msm
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> v3:
> - Update docs to specify we use email reporting or GitLab issues for flake entries.
> 
> v4:
> - Add gitlab issue link for xe driver.
> 
> ---
>   Documentation/gpu/automated_testing.rst | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..6d7c6086034d 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -68,19 +68,25 @@ known to behave unreliably. These tests won't cause a job to fail regardless of
>   the result. They will still be run.
>   
>   Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +bug to the author of the affected driver or the relevant GitLab issue. The entry
> +must also include the board name or Device Tree name, the first kernel version
> +affected, the IGT version used for tests, and an approximation of the failure rate.
>   
>   They should be provided under the following format::
>   
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $LORE_URL_OR_GITLAB_ISSUE
>     # Board Name: broken-board.dtb
>     # Linux Version: 6.6-rc1
>     # IGT Version: 1.28-gd2af13d9f
>     # Failure Rate: 100
>     flaky-test
>   
> +Use the appropriate link below to create a GitLab issue:
> +amdgpu driver: https://gitlab.freedesktop.org/drm/amd/-/issues

Please could you ack this patch. Thanks.

> +i915 driver: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues
> +msm driver: https://gitlab.freedesktop.org/drm/msm/-/issues
> +xe driver: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
> +
>   drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>   -----------------------------------------------------------
>   

Regards,
Vignesh
