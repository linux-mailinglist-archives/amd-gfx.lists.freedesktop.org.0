Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7687A75D9
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Sep 2023 10:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138510E456;
	Wed, 20 Sep 2023 08:27:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C93010E14B;
 Tue, 19 Sep 2023 21:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=f5/fMBSIznIr+vGvXU4rmAhmq+8j0wlA0K01HLKQFAk=; b=vLQ7y4GRj4HN8CPHKXs7DDUYk7
 Sd7EIIkAz3j/advHMGwNIZ/P8P5y7lt/s7IAHQK5W9SLtqj984StvmdcIoAqi+S1k/8Lnr6kpcyXo
 Y00GBqfbkvVQ/aBLQx1y1/dKzBrjU1A60/TSsH2cDIw6V2VVliTksjLwM2lSEGpnDZEhko9SjUn/T
 ggKhpRhTEzyLWqK8RagH9DQ8589VzHUXlc7+2IEFvmXrU3FG3bhJu/J3yxnWQe1A3AuVgWhyF7giM
 Ep28IzN6HTN6pnmLwRgkzTi4pSTuiI9XyW8VUQEnFUMSdfub5Yg5ceWb9kdFTXD5cDPZdk5zSlmsN
 mDjYu8cg==;
Received: from [2601:1c2:980:9ec0::9fed]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qiifx-001K5G-10; Tue, 19 Sep 2023 21:54:33 +0000
Message-ID: <e1294905-b867-4141-87ff-2b7202476e59@infradead.org>
Date: Tue, 19 Sep 2023 14:54:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: drm: amd: display: fix kernel-doc warnings
Content-Language: en-US
To: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 20 Sep 2023 08:27:40 +0000
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 9/19/23 02:33, Swarup Laxman Kotiaklapudi wrote:
> Fix kernel-doc warnings discovered in AMD gpu display driver.
> Fixes these warnings:
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'overlap_only'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'bottom_gain_mode'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
> Function parameter or member 'background_color_bpc'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'top_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'bottom_inside_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
> warning: Function parameter or member 'bottom_outside_gain'
> not described in 'mpcc_blnd_cfg'.
> 
> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>

Thanks for fixing these kernel-doc warnings.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> index 8d86159d9de0..61a2406dcc53 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
> @@ -91,6 +91,12 @@ enum mpcc_alpha_blend_mode {
>   * @global_gain: used when blend mode considers both pixel alpha and plane
>   * alpha value and assumes the global alpha value.
>   * @global_alpha: plane alpha value
> + * @overlap_only: whether overlapping of different planes is allowed
> + * @bottom_gain_mode: blend mode for bottom gain setting
> + * @background_color_bpc: background color for bpc
> + * @top_gain: top gain setting
> + * @bottom_inside_gain: blend mode for bottom inside
> + * @bottom_outside_gain:  blend mode for bottom outside
>   */
>  struct mpcc_blnd_cfg {
>  	struct tg_color black_color;	/* background color */

-- 
~Randy
