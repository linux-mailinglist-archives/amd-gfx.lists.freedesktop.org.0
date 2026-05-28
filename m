Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBKaJI+RGGr9lAgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 21:03:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF05F6D48
	for <lists+amd-gfx@lfdr.de>; Thu, 28 May 2026 21:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8610F593;
	Thu, 28 May 2026 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TyIpD5Qb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36710F593
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2026 19:03:38 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-304d4e57d33so93527eec.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 May 2026 12:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779995017; cv=none;
 d=google.com; s=arc-20240605;
 b=cUV7RF70KltJy0GUNovLssCLym7ml3Iye6O5ecCAwfwNcAyqDfN+M4bPoLP6KfOuA2
 vyjFarqtaIoB7PChcppM7bsga9zHZGN7dn4KOKn7ehIqSinCfXIQ8TlM4XcEcaaOzMoi
 uuBvpQC5rdpL7jHpP9Fyl/Gd2bn1URZhLP1W3nUdKFxB31OQKN/eYM5TpR6hIa2TLB4U
 9Ezwbv5lMjMI6OKlT3hHHMvSFFmsvEObujU/t5OTFntoQ7+RhjJC6x/npGQEFcEYhfBp
 AaxmmMxGDmmOcWy0L+r50vTjUNWjr3vQ9uMsZI9Wc+Djxj+S+nklxm4SU9KhFvwdHetV
 Me7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8A2SN4X3OFcTcNOFQSoYJ/Kcbx3sV02TXx8ZftUXyl8=;
 fh=5nkg2EldE+u8CS39S6pBov+old8nvhjjm+lOjvDl0xA=;
 b=Zhv18/zioM0pRlkKhNSvn+xqOs+Rr2MtNBikFUTTrDzNNQzIiMLdg9P1K6gtm2wkmm
 4aaRgOUOqWr/Tcq9zj84F8kc2KyZHL+VZxad9k37FxY6FJXKi4qpz8wwWjZSSxr9JuDx
 p3JlkciLGQvBKKwWUNPfCHPXruwiSoQhwq76AKYS5/WycCJakx3wAfIgMCI8TpiGUzGc
 62D8LeqjKC2Rtq9eemdpBkmcL68vxGKc+VKQwNy+UZrc15l9a9FCFcZ7CVJfxKymtgZG
 I1V+CmJNiSHsF9OBE7hOxYmRnf2EJKsq6EC5Fz1OhD6VTsOSXpzXeA38szzxE8v0vn+3
 jyBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779995017; x=1780599817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8A2SN4X3OFcTcNOFQSoYJ/Kcbx3sV02TXx8ZftUXyl8=;
 b=TyIpD5QbVD5fCwY2iSrhayJl6wmpkUelg1xeaAJ5Iq28cgaoO6h6dQqp0wU7HE6LoP
 EJMjiLBgyXztCrSHygB+MF0JzYtRqUUy2aOaaj5PJI//xwfzReYVGJBpme4PatYhSneh
 G+QTY2sbcuFrfs4bq4IEKSBGHKfJCQTnWxIuWoNRqzMny9VkmpUZJRqtnuH9GtdzM9Nq
 zfw90a5jMYI4s2LcVNv/EbmutWQ7HOc+kxVB7AVTQfXJJjl/+J87gJFtyOwpwkBiOwR7
 MBdO3H5XddMAsQAad9wN3ukF2Moe1w6L+wi7/Xj/BJ5fNzuANdq+XfTj3q+QT5aZTrvh
 Mcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779995017; x=1780599817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8A2SN4X3OFcTcNOFQSoYJ/Kcbx3sV02TXx8ZftUXyl8=;
 b=H9EWOEJ06a9zzHTITrMP/E3kJf3XlgvQZsrAAYDTRqgJZHM7BtVsWVUJVecacCxoeZ
 kLsrII9d/dtr2pP4HR9Qq0YuiRkFWxc24nLtcOjcDyojMM5GVrsSnLeFspJyeQRiBmaR
 0K+IGS58fV7VrmHdX+sDLmLtrmXJIAbo5N9rR58KVFxtjmEQRODs87phL+63uuwbM2n5
 DbUHh/hRzPMy0e3QriAeaSiZm1/cxI1/kMuda63uBueBs4AjrWCf6zzuR8CwQeYU/Zpp
 zocuCm1P/kOOyADd6DyrDQGYNkfh2wM3C0bTtZ/LlDixnwQe8VklLwz6WX1TXA3VSOPx
 9HDg==
X-Gm-Message-State: AOJu0YyJkv3FXdInPldcSPAeCQGXdhYpqIVs3NU2Jer3ZPca63BhGTKt
 EuDXeuAnJbkza7yv9zCJzeT0iU0UvmLYZ478wmfxkAlmheELTSP8ghIygEdxI8lAldV8+WYlfFv
 EwSqyq2RD4yNeanE7Ds6+Vd3ng+dAfmc=
X-Gm-Gg: Acq92OHCTql+TG6zLU6T+ik+wh9bFLD5xppQT1GjnEJ44Ck5uq2LgHZvGVrxoAoFu3B
 Q37flw9fb7iWjxTjQVdHPtw4aRQi1RBUYkvuV0C22w7dwyFjv9zYpo4zOLcRmE1qIUgLFforj3v
 Tx99RELMz8nIpU2Ld4wVnaMQ6ZyPhHOw48KqNVpG3eAScX0XLmotTtIylikYMST5BMxJYCDvkcc
 EuxjIMileXiQ2j3gL3FZs/KKU36EZxcGjtzqCTWOsvvKaD94kbTY99+bPULfuH59wikWMOJEJL5
 gLdR6pGafsRMZpgoHPbcW4oSLrhd74DBqWICEhkxjHTJRnnwY5f3iUo4eTTNSVBTbSkf8EXncx8
 YeR0aot3y3GlHp0w=
X-Received: by 2002:a05:7022:ef18:b0:130:a479:79a8 with SMTP id
 a92af1059eb24-137a81352b9mr35853c88.2.1779995017322; Thu, 28 May 2026
 12:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260528070016.14843-1-leorize+oss@disroot.org>
In-Reply-To: <20260528070016.14843-1-leorize+oss@disroot.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 May 2026 15:03:25 -0400
X-Gm-Features: AVHnY4Kszkq6EwAjLYJ1z0b1-DnJpnDWRLuUmFay7LmjcRJeyh_qxMbDCX9ofIs
Message-ID: <CADnq5_OBaVum+jV3HBL3mqXfvrhqVOu+gcU9Y2QHdRryQDw8SA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: add missing CSC entries for BT.2020 for
 DCE IPs
To: Leorize <leorize+oss@disroot.org>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:leorize+oss@disroot.org,m:Harry.Wentland@amd.com,m:Sunpeng.Li@amd.com,m:dri-devel@lists.freedesktop.org,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:leorize@disroot.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,igalia.com,amd.com,gmail.com,ffwll.ch,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx,oss];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 46EF05F6D48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 3:39=E2=80=AFAM Leorize <leorize+oss@disroot.org> w=
rote:
>
> DCE-based hardware does not have the CSC matrices for BT.2020, which
> causes the driver to fallback to the GPU built-in matrices. This does
> not appear to cause any issues for RGB sinks, but causes major color
> artifacts for YCbCr ones (e.g. black becomes green).
>
> This commit adds the missing CSC matrices (taken from DC common) to DCE
> CSC tables, resolving the issue.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/3358
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5333
> Assisted-by: oh-my-pi:GPT-5.5
> Signed-off-by: Leorize <leorize+oss@disroot.org>

This looks reasonable to me.  @Wentland, Harry, @Leo (Sunpeng) Li any conce=
rns?

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_transform.c     | 10 +++++++++-
>  .../gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c   | 10 +++++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers=
/gpu/drm/amd/display/dc/dce/dce_transform.c
> index b3640682fa60..12c85c3afd6a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
> @@ -110,7 +110,15 @@ static const struct out_csc_color_matrix global_colo=
r_matrix[] =3D {
>  { COLOR_SPACE_YCBCR601_LIMITED, { 0xE00, 0xF447, 0xFDB9, 0x1000, 0x991,
>         0x12C9, 0x3A6, 0x200, 0xFB47, 0xF6B9, 0xE00, 0x1000} },
>  { COLOR_SPACE_YCBCR709_LIMITED, { 0xE00, 0xF349, 0xFEB7, 0x1000, 0x6CE, =
0x16E3,
> -       0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} }
> +       0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} },
> +{ COLOR_SPACE_2020_RGB_FULLRANGE,
> +       { 0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
> +{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
> +       { 0x1B67, 0, 0, 0x201, 0, 0x1B67, 0, 0x201, 0, 0, 0x1B67, 0x201} =
},
> +{ COLOR_SPACE_2020_YCBCR_LIMITED, { 0x1000, 0xF149, 0xFEB7, 0x1004, 0x08=
68,
> +       0x15B2, 0x01E6, 0x201, 0xFB88, 0xF478, 0x1000, 0x1004} },
> +{ COLOR_SPACE_2020_YCBCR_FULL, { 0x1000, 0xF149, 0xFEB7, 0x1004, 0x0868,=
 0x15B2,
> +       0x01E6, 0x201, 0xFB88, 0xF478, 0x1000, 0x1004} }
>  };
>
>  static bool setup_scaling_configuration(
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c b/d=
rivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> index cf63fac82832..1ed018aaa4bb 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_opp_csc_v.c
> @@ -88,7 +88,15 @@ static const struct out_csc_color_matrix global_color_=
matrix[] =3D {
>  { COLOR_SPACE_YCBCR601_LIMITED, { 0xE00, 0xF447, 0xFDB9, 0x1000, 0x991,
>         0x12C9, 0x3A6, 0x200, 0xFB47, 0xF6B9, 0xE00, 0x1000} },
>  { COLOR_SPACE_YCBCR709_LIMITED, { 0xE00, 0xF349, 0xFEB7, 0x1000, 0x6CE, =
0x16E3,
> -       0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} }
> +       0x24F, 0x200, 0xFCCB, 0xF535, 0xE00, 0x1000} },
> +{ COLOR_SPACE_2020_RGB_FULLRANGE,
> +       { 0x2000, 0, 0, 0, 0, 0x2000, 0, 0, 0, 0, 0x2000, 0} },
> +{ COLOR_SPACE_2020_RGB_LIMITEDRANGE,
> +       { 0x1B67, 0, 0, 0x201, 0, 0x1B67, 0, 0x201, 0, 0, 0x1B67, 0x201} =
},
> +{ COLOR_SPACE_2020_YCBCR_LIMITED, { 0x1000, 0xF149, 0xFEB7, 0x1004, 0x08=
68,
> +       0x15B2, 0x01E6, 0x201, 0xFB88, 0xF478, 0x1000, 0x1004} },
> +{ COLOR_SPACE_2020_YCBCR_FULL, { 0x1000, 0xF149, 0xFEB7, 0x1004, 0x0868,=
 0x15B2,
> +       0x01E6, 0x201, 0xFB88, 0xF478, 0x1000, 0x1004} }
>  };
>
>  enum csc_color_mode {
> --
> 2.54.0
>
