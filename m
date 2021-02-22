Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB63322281
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Feb 2021 00:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA8C6E7DA;
	Mon, 22 Feb 2021 23:05:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4381D6E250
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Feb 2021 23:05:33 +0000 (UTC)
Date: Mon, 22 Feb 2021 23:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1614035130;
 bh=mD7inEEpBWky59qWI7tHe8UlQANiZKAGuft09L0bkr8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=O9pobkWKoTsS0sHKYQpi2lbk/t0vLnzpL32ZQ4kiZks0MFXd57WL/chx9c/LaTFDT
 oEX5EY/hFrTNZ8iA9ydQhRINGJcOD8mTG68GEvosLRNtLJp8suww8rdRM92hVVuN2f
 9N2NO29jPBlGfXV6pl3nc1eNndNyH32XKDyunutj9ac9o5wux+CI1Zl0oR4REpiS9c
 w3mqDtkIjbmxThnqQ/FWpo7Dgtc5RVXRCM3DNNBGBg79Lx6m+/ZfJBpwzxNV4N5qFk
 icmI6jbA72yGfdLJHq4i5kLPiHfUwSV6m4vsCzAO8HP+MCn6RslWFNt+EkjnPnOaBI
 hwxjy+d7JjlQA==
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
Message-ID: <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
In-Reply-To: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, airlied@linux.ie,
 aurabindo.pillai@amd.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 bas@basnieuwenhuizen.nl, alexander.deucher@amd.com, harry.wentland@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder <jrdr.linux@gmail.com> wrote:

> >> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
> >> warning: variable 'i' is uninitialized when used here
> >> [-Wuninitialized]
>                            timing  = &edid->detailed_timings[i];
>                                                              ^
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
> note: initialize the variable 'i' to silence this warning
>            int i;
>                 ^
>                  = 0
>    1 warning generated.
>
> Initialize the variable 'i'.

Hm, I see this variable already initialized in the loop:

    for (i = 0; i < 4; i++) {

This is the branch agd5f/drm-next.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a22a53d..e96d3d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9717,7 +9717,7 @@ static bool parse_hdmi_amd_vsdb(struct amdgpu_dm_connector *aconnector,
>  void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  					struct edid *edid)
>  {
> -	int i;
> +	int i = 0;
>  	struct detailed_timing *timing;
>  	struct detailed_non_pixel *data;
>  	struct detailed_data_monitor_range *range;
> --
> 1.9.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
