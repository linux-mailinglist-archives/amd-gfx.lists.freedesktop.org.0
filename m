Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69777302710
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Jan 2021 16:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35DA6E12D;
	Mon, 25 Jan 2021 15:46:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C12E6E12D
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 15:46:09 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id j8so3368949oon.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1UgX9fWVFnZwYT76RTGJattcj+aM4gHVPVeJOG15L5c=;
 b=YSHYJOafQzPYyJbloSIPWr5aAzo+UbNZcOtJZqjfuzyPCed/1Oa+th/cqgGtpWVGYW
 nEdwUL+dA+wF30d0eYv7Lqti9in34LYTrr3YXn0BFzfsIP6tvI17qiYkWe1dBR54eW31
 2F4nBtL0M1ft+1L0h1KwLpBzHANgg0HgPhQ6lIVkkfSljlXRq5i1MqP+azVmxHjSurmv
 BmJNtZLWo/bta+gZc1OtLafNkdCGISZTbc9WdT15VhF3ba0qu5GKzXAnJlZl2DFrrw4d
 BCJLLfdIDGOeQMS9IFUMW/H5sY1Nv9XHfs0ApCNgGA257ZR3SOkDxMMuOcuIkNcgjq/R
 cbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1UgX9fWVFnZwYT76RTGJattcj+aM4gHVPVeJOG15L5c=;
 b=Z7hnzVC3SijRnciJ9BNVIsgxTrD3bffmgfUsnn8mmMICB7CvgmW3tbwhU4GV5z2Qdk
 Wsr6Cp28alOx7v306lxuhck8ZUs2TrZnNvL8J1qJpViwP54PCnlpd/wMAMvmWdQbSbHG
 sZoJsMl2/NN0Kz44Lk0oY61985dIw+L1eVWmgPFu65HIzCY9zz+6i+8xa0VnZ7sqRmYl
 ce6tOAXodl4rNdDVzr1GU7Tu5RYWR2k7JOYwoS5ANwRQJOwiDgCSjgMmIs3guvp0YA3a
 iP/pO2RNBkIIPiGIDmIf76v1rNsY4FAwDwb6yQdvVhWo82krqlIazGlLpAG0Usz3ygxm
 lOBA==
X-Gm-Message-State: AOAM530DGWd+f4wZkLKWFu9yz1bqO/WjHKgqgsojuwkDODO0Cl89reYw
 mwUpumIJAMbpe81xf6OXXgNzw4OGm2HtV4LIzPk=
X-Google-Smtp-Source: ABdhPJzKtbC/VXeE50ejjuNIdIGvT08dlV86T6wYd2L8w0N+Vc//0iw7icZhOPSjRbIHhJAQOFchRbetfAlsUT8787Y=
X-Received: by 2002:a4a:6c45:: with SMTP id u5mr873512oof.61.1611589568669;
 Mon, 25 Jan 2021 07:46:08 -0800 (PST)
MIME-Version: 1.0
References: <YA6FFK+F1XbGbYVJ@mwanda>
In-Reply-To: <YA6FFK+F1XbGbYVJ@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 10:45:57 -0500
Message-ID: <CADnq5_MUs2fzVHTMo=zxtg8L7QaCvg0knJy=i2EuEj5r6uEuqA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix a potential NULL dereference
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Melissa Wen <melissa.srw@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Anson Jacob <anson.jacob@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 David Airlie <airlied@linux.ie>, Wyatt Wood <wyatt.wood@amd.com>,
 kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Jaehyun Chung <jaehyun.chung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>, George Shen <george.shen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 3:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The debug printk dereferences "link->link_enc" before we have ensured
> that it is non-NULL.  Fix this potential NULL derefence by moving the
> printk after the check.
>
> Fixes: 1975b95ad4e7 ("drm/amd/display: Log link/connector info provided in BIOS object table")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c16af3983fdb..4d31b2fae1f9 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1525,13 +1525,13 @@ static bool dc_link_construct(struct dc_link *link,
>         link->link_enc =
>                 link->dc->res_pool->funcs->link_enc_create(&enc_init_data);
>
> -       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> -
>         if (!link->link_enc) {
>                 DC_ERROR("Failed to create link encoder!\n");
>                 goto link_enc_create_fail;
>         }
>
> +       DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
> +
>         link->link_enc_hw_inst = link->link_enc->transmitter;
>
>         for (i = 0; i < 4; i++) {
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
