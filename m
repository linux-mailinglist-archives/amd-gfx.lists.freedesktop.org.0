Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nhAlNHZ7IWrMHAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 15:19:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39073640401
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 15:19:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jJdN9o6p;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60B61127E2;
	Thu,  4 Jun 2026 13:19:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A851127E2
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 13:19:47 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-304dd3bb7a6so52645eec.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2026 06:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780579186; cv=none;
 d=google.com; s=arc-20240605;
 b=HboCisiQjY6t2xO2F7YU1rWO9qAvMC/KpQtpJTI/vYt0/GYWIWAMuSM5RjvFLqlTsQ
 GK2fYK7FBJlwfMxCEZodYc5O1Jv4Z16Ab2PPUArjAq/8m8JTe2jgeGjKXq9rRTGTIEYx
 2Ubd7usCcsOAFiGrYVzxvZSyFLAWa6fZKFg8smgLips6rAWr/hL9AMPYH4dnXLVh0AD/
 cVxXTgnANco9WhO4ux2vL8bqXCujtGo4MHyAjhZRJn8ENGzd9+ziicSFjDgA7M13M/0t
 H/hFttpyRfjk8bGeroKzwsyANacFx70omakjWcVeEVIYRUPu6qkh7v/bDnVxelTf0soq
 FC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hx0+Y48VLvFmTTPk+kFjY4FAtS7xL04mBoLTVlIwaZM=;
 fh=OkchnlaHe9sd8eyskib1mU0ZJ+aGK+3vvNvuUyH+thk=;
 b=izgKWQ38y29GbLRRlxmEAl5qjjASCF/pGDDKcGydblZ9nITWEASvIObF1h3oXK1K9y
 /COMF4gJYUZt6YhJJksKwt5WVsN03Auv/w34XCPXe5cSPZFFN/P8ayLLtD5Jn+W+a5mO
 U059HXzEWGAljCMjcFGE9Cz1ZY2juBP/KzJO7HxhF6pCOS3IxYS4fQYdChunOLLmofGP
 k8vFjJ+f9zzZr8fAQbCURSL+WsZ6wpaPVMkEjMLSGn64kfYRFl7cwWwlkNfA8J8wkuBy
 nQ9mn2v18i5Lgz18cUSCsURfCW1wd/iOg/wwmvjuGgx2ycqL6f1cvXhgKsdC7yn04H71
 erjA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780579186; x=1781183986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hx0+Y48VLvFmTTPk+kFjY4FAtS7xL04mBoLTVlIwaZM=;
 b=jJdN9o6pt/L/ROfpUbDfeABjCpJftPNwv5zMHxOfU9+cC0XXlrIpxzZZ4KpFvLHqkm
 8W0GGo2Ia7mwCRNy5gumYbpEB4IksQZtaanj9jhY43BkTdGU90o6DYIOWFyTbU4WIVFt
 az449a2zmW7+Zn7u9oVsZ5UKoYRQTLdu6Go9gmsGZ2Dz9DFVwYf6zSgMLFLSbm+3d5UV
 wVWNYXdeLT/x0XCsqnMKzxuh2ommLHT/Vku4XsKRPVL+gUy/2v9WlK07nhAsQFdVwQUZ
 T2DZwULNY2ubaZ53AQMo4WUWO0eiSr//K/O7jMH2AtMuN1ZWwQBCoEyqNUVR3FBUrKta
 /Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780579186; x=1781183986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hx0+Y48VLvFmTTPk+kFjY4FAtS7xL04mBoLTVlIwaZM=;
 b=W5cW7L10KLTBpLyuWioXrirsS8v+2T/6angK2Echl6iOk5ywqL08SauJR1F3gUHyhl
 x1hEQUridjORzwieVUaJJ/eriDZ1XhXI/qdsI07KAWVEvLiA4HFtTZbk/V3r2NAFcO2/
 qoZzT9e+O/PD/u80nFstvHNVk01MwTipX72qS6ylrn2qF9j98mdC1Mi0BlGUH4d0Th76
 zhCWstGEelrFzNrcksfNGohXBsKwgrHympoz8IVaDephpUpDYQxSwoZf4SrGtVSOrqb2
 Rd9CYlMGHwKRqN3crXLZcWNSaCFQGHNpUXe34hd7dVAmii9nvhhG+WT/7k6G4brFbaJW
 eb7w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8t0VjKbI7ZMIslPAUutHLVXwP+y/G+4rkP0qQSRZH3fsoaTjkoX9Xl5SmMw7KmB6Im//H3WGWH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf0Q3twS4YYYVy1F15zZfZByUAXvJCkFv8pTXKohkjdMMbvhnE
 o9Qhwpm5YpShIZCUQP25H8QuoH20+5rKD7Jv3uAo9duosGVmIYuQZDnwB+J0f+pJrSqm5BtnpRj
 yIbiIDrT1iDSL8lmTUikE0FFO0IWpD7E=
X-Gm-Gg: Acq92OH1VFb3r3Mnxw1f1sTQKv5vqUQNlA/D2onBjdngclTx9gkMrCSIEfgiygm/CfN
 mmw2N4IZbJA50Ibyh67oV6Qp204Uhva7q550PVSV7P1VCBD229v7HCjxYTDudim/7BMs+yXZKKZ
 Ixp0OtuaJIRYXSCbz/edc8lnzohHJMPgBWQbYCl5usWODE/0kD33r51kPctPneiHLYgKrpvgPHe
 lS9I3iWwPWQKTFwRflaMrqo+i1XGkfnU6SzUb6MD9i1fFQLxEYXNIlGQMeNtCmNdsBCgozAtV9y
 gmU7ZXoVKqJsti6q1knreskVcbuoTVtH5dWimWcDd+8MuTcJVaI1JbHAuKOvPi5WYeQM/WgoPs+
 +tn6l
X-Received: by 2002:a05:7022:fa0a:b0:138:498:895a with SMTP id
 a92af1059eb24-13804988a79mr159531c88.4.1780579186303; Thu, 04 Jun 2026
 06:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260518154809.660061-1-michel@daenzer.net>
In-Reply-To: <20260518154809.660061-1-michel@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Jun 2026 09:19:33 -0400
X-Gm-Features: AVHnY4JBenTpRPP8YA3Qmj-kqEge9AwSch2DkZfTv-k2Wj99f13hyNqMGmolzPE
Message-ID: <CADnq5_O3CUB7LykA6x74XAWACigTS7sn7vyCmC0YvtPL=CEQ7g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Consult MCCS FreeSync cap only if
 requested & supported
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:michel@daenzer.net,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Wayne.Lin@amd.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,mail.gmail.com:mid,gitlab.freedesktop.org:url,daenzer.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39073640401

On Mon, May 18, 2026 at 1:09=E2=80=AFPM Michel D=C3=A4nzer <michel@daenzer.=
net> wrote:
>
> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>
> When the do_mccs parameter is false, we don't call
> dm_helpers_read_mccs_caps, so sink->mccs_caps.freesync_supported is
> unlikely to be true.
>
> Fixes: 6f71d5dd3206 ("drm/amd/display: Read sink freesync support via mcc=
s")
> Bug: https://gitlab.freedesktop.org/drm/amd/-/work_items/5286
> Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>

Applied.  Thanks!

Alex

> ---
>
> I suspect this logic might not be quite right yet, it fixes the
> regression and should be a step in the right direction though.
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e0d209d016cd..9d4692e4ea26 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13468,17 +13468,15 @@ void amdgpu_dm_update_freesync_caps(struct drm_=
connector *connector,
>         }
>
>         /* Handle MCCS */
> -       if (do_mccs)
> +       if (do_mccs) {
>                 dm_helpers_read_mccs_caps(adev->dm.dc->ctx, amdgpu_dm_con=
nector->dc_link, sink);
>
> -       if ((sink->sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A ||
> -               as_type =3D=3D FREESYNC_TYPE_PCON_IN_WHITELIST) &&
> -               (!sink->edid_caps.freesync_vcp_code ||
> -               (sink->edid_caps.freesync_vcp_code && !sink->mccs_caps.fr=
eesync_supported)))
> -               freesync_capable =3D false;
> +               if (sink->edid_caps.freesync_vcp_code && !sink->mccs_caps=
.freesync_supported)
> +                       freesync_capable =3D false;
>
> -       if (do_mccs && sink->mccs_caps.freesync_supported && freesync_cap=
able)
> -               dm_helpers_mccs_vcp_set(adev->dm.dc->ctx, amdgpu_dm_conne=
ctor->dc_link, sink);
> +               if (sink->mccs_caps.freesync_supported && freesync_capabl=
e)
> +                       dm_helpers_mccs_vcp_set(adev->dm.dc->ctx, amdgpu_=
dm_connector->dc_link, sink);
> +       }
>
>  update:
>         if (dm_con_state)
> --
> 2.53.0
>
