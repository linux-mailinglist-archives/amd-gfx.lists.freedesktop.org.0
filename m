Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zrW7GGAaUWqq/QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 18:14:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B316873C801
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 18:14:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=F+9mYWWj;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A13310E122;
	Fri, 10 Jul 2026 16:14:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CD910E122
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 16:14:21 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3860f32307bso244358a91.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 09:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783700061; cv=none;
 d=google.com; s=arc-20260327;
 b=SY9eZo57+fl8QldfabKtVXdJbNqg6oeaTGD26R2Mu+jR/6Inz/qOcmf54vUR2ddZa7
 mso47XqPGx3g1hRVjJZpz7lNcvqXHZyh30Ak5FGuhUU49ZrzwQx5H/nX0zoQp8uydcxP
 lgT6UT4oSOPxcu8yskQ80Sf9b+HrgRonU9LqwsSDErU+XUBPz2rR+jHy/2nw9EB4vay6
 LR0hu4Q+ZIZ8g1Dg/ttcRPr4BzEGD1NZwdd6fyQUdc5ysIXiEBsfY4ke5QY6kdIQXdCe
 ZGBfhaPbecgzM0goYC3cSPZLYdJVhEjreJ/onG1guGPNSGoOU7i8LxMN/enFeqc198vz
 JleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=flhsOLdf2bEoLY1hjHSk0IG78a7QjpvReXUQh5QFThU=;
 fh=mRkfYj+pHnxY2c3B7zQT7AzAyn6PmTnzI5TrKA85fdE=;
 b=OIl2yOTG5Q9wKJbM9dcyU6HFlf2LEXyPGsQKUbQ+6Fyx8IoJmrumIMWCxFJUKZOuVa
 Vb19nwEm7hYnntUXSvImiykQa1ZcApOXMIv7Voz5G1prMTQrfLpHshCDN15XQ9s83xGR
 GTKG6b2j2rWR+O7t1SmmyNTM3Rx52xJqODL1t9TdDavcP6mP+H8mgP3bv/OaxcVteiz9
 NeCFihkvnituWLlUkAwpmZY+PXBZkvhdG5KvXVwjyFMu6ahZ7BTvFNddG7m70QN1vRBW
 YuTHFNgUbnAroBWmkg6vRLzBEL+YA3bbkTdEL4B6eu0rawsQ2NjBZFb8oGY1acNdDFUC
 lCqQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783700061; x=1784304861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=flhsOLdf2bEoLY1hjHSk0IG78a7QjpvReXUQh5QFThU=;
 b=F+9mYWWjZeRLAYLapOhXnxTMPRMAwh2yIvvulr/tqJMK5FnVUEFoQFx75qFEesZvcX
 B0aail7Lr9T4U5vsScGWXrCOjBC77yCGBmmJzQGN9ALWmvPfjfj0hx6IPBLpWk7ramkz
 a8ovurYHmnvYMFg9egG82HEJch+SJBA5UeTtaHY+qx4izRHCVI9hETClyvgr37MmJOO6
 4YheilZ6ECWRF+Ia1MjJQfTrpMCHWjZ5DjWm9Itxof2cSAEawAIW/dQkLHdNjzfJ1KgC
 6KWMHoAxY6lmziX3ZMIfptIi444WMwjotxA25uoYO8oYzbE/syZ1Si7USp+EdUxsNyfK
 UP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783700061; x=1784304861;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=flhsOLdf2bEoLY1hjHSk0IG78a7QjpvReXUQh5QFThU=;
 b=pb6zFxjh7EPOxZGHSbnnjPw9Nkcowat4qbGXjz3+FcsRbmVmuSxvxuRRlWGxvtbypu
 KWb7Rz6TPISN7vm2PSpZ+M3Zm+zigpE4P1K9x5j819liUdx9KgklAo6l67E5WO77BuNh
 0DUxbzFBqAmFBTePZpl6O1xjVMDxRpEkxRbuOFe9W6QCzQnaqdTzK3fhbUW8LPXmuoyu
 2+96mAABolF/px/uWII+OWPvMPdb8bKe3TH7AkKAIUbLgAxUMYm4QK0GEsk9cJTGpftp
 wKWmbR2boTf0xfXapICmluiZqO70I1Z88ZCQyBhBcvAADCiw+dm3161umMBx6734lJot
 goZQ==
X-Gm-Message-State: AOJu0Yyk8cro8m/ufMkW3i2X7y2bptepnZYjb3CXYzmTh8jKGxbrM3jt
 88JweVRzEVRjfN7ZskucdswfuP1aRW5waIQsmV5ha3UT+H1fHAqoX+qAhnChZO9u2thO96X369j
 8j/aB62D2qPNIuvZqaD57XjYPg0PhcW0=
X-Gm-Gg: AfdE7ck2C6XTk47KE5nd0kXNw5Tyf36VDm1vXXkBrzVPDb09BCG+T0ScMHOwe0FzhjH
 AyaG8LCIydrAzhK2NnWxhnClaxCBiaxQ+QFtTeVBDYPSl9U0neYnDIYUwDUm/bYSSfE0D6FR8wK
 ubz38rqpZq0hLg6LVQS5QyrKPVzCNgXVLtqg1HJe8JBPRxo0MWOJO+ZJ6vmlahTfKpuIfqteaXF
 W7U6fHeiPtEswJq2UNz9wRMStMIpEnpwnMNvAqERFZjh1F5Ph1jmY3gRRlvpz8S++goXtyI11SA
 iMW97yCSnaY+nh7I4D6IHecDxU8fkRUQOui6RBqT87UdhQt1B6ZB+y9jdIw=
X-Received: by 2002:a17:90b:4d12:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-38a2160e57emr8415572a91.6.1783700060864; Fri, 10 Jul 2026
 09:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260529090909.13206-1-timur.kristof@gmail.com>
 <20260529090909.13206-2-timur.kristof@gmail.com>
In-Reply-To: <20260529090909.13206-2-timur.kristof@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2026 12:14:09 -0400
X-Gm-Features: AVVi8Cf055xQEFr6hl8Y-thqDy24Bg1Z5LLSgdMlTX2SoX75vppVskZ-Zj3ik2M
Message-ID: <CADnq5_NjkHsDJa6NrZ4B23kRad90XYBwW936VAx1EokAvtt1Gw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Add dp_skip_rbr flag for NUTMEG
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, 
 Ivan Lipski <ivan.lipski@amd.com>, harry.wentland@amd.com,
 Alex Hung <alex.hung@amd.com>, 
 Ray Wu <Ray.Wu@amd.com>, Wenjing Liu <wenjing.liu@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Chuanyu Tseng <Chuanyu.Tseng@amd.com>, 
 Roman Li <roman.li@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:ivan.lipski@amd.com,m:harry.wentland@amd.com,m:alex.hung@amd.com,m:Ray.Wu@amd.com,m:wenjing.liu@amd.com,m:aurabindo.pillai@amd.com,m:Chuanyu.Tseng@amd.com,m:roman.li@amd.com,m:daniel.wheeler@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B316873C801

Applied the series.  Thanks!

Alex

On Fri, May 29, 2026 at 5:34=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@g=
mail.com> wrote:
>
> No functional changes. Just clean up a conceptual mismatch.
>
> Based on feedback on the NUTMEG code in DC, the
> preferred_link_setting is meant to force the DP link to a
> specific setting, meaning both the link rate and lane count
> should be locked to an exact value. What NUTMEG needs is
> a lower bound on the link rate, which is not the same concept.
>
> Implement this as a HW workaround flag instead.
>
> Suggested-by: Wenjing Liu <wenjing.liu@amd.com>
> Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h                         | 2 ++
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c        | 2 +-
>  .../drm/amd/display/dc/link/protocols/link_dp_capability.c  | 6 +++---
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/di=
splay/dc/dc.h
> index 75f59ca927ffe..3fb97860722df 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -1731,6 +1731,8 @@ struct dc_scratch_space {
>                 bool dp_skip_DID2;
>                 bool dp_skip_reset_segment;
>                 bool dp_skip_fs_144hz;
> +               /* Some DP bridges don't work with RBR and must use HBR. =
*/
> +               bool dp_skip_rbr;
>                 bool dp_mot_reset_segment;
>                 /* Some USB4 docks do not handle turning off MST DSC once=
 it has been enabled. */
>                 bool dpia_mst_dsc_always_on;
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drive=
rs/gpu/drm/amd/display/dc/link/link_detection.c
> index 1ac6a22fecfee..9f4e90493fed5 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -621,7 +621,7 @@ static bool detect_dp(struct dc_link *link,
>                 link->dpcd_caps.sink_count.bits.SINK_COUNT =3D 1;
>                 /* NUTMEG requires that we use HBR, doesn't work with RBR=
. */
>                 if (link->dpcd_caps.branch_dev_id =3D=3D DP_BRANCH_DEVICE=
_ID_00001A)
> -                       link->preferred_link_setting.link_rate =3D LINK_R=
ATE_HIGH;
> +                       link->wa_flags.dp_skip_rbr =3D true;
>         }
>
>         return true;
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capabi=
lity.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index f44c13300a59c..708dd6f336d8c 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -750,9 +750,9 @@ static bool decide_dp_link_settings(struct dc_link *l=
ink, struct dc_link_setting
>         if (req_bw > dp_link_bandwidth_kbps(link, &link->verified_link_ca=
p))
>                 return false;
>
> -       if (link->preferred_link_setting.link_rate !=3D LINK_RATE_UNKNOWN=
) {
> -               initial_link_setting.link_rate =3D link->preferred_link_s=
etting.link_rate;
> -               current_link_setting.link_rate =3D link->preferred_link_s=
etting.link_rate;
> +       if (link->wa_flags.dp_skip_rbr) {
> +               initial_link_setting.link_rate =3D LINK_RATE_HIGH;
> +               current_link_setting.link_rate =3D LINK_RATE_HIGH;
>         }
>
>         /* search for the minimum link setting that:
> --
> 2.53.0
>
