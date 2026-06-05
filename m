Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2v1IoXgImrcegEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 16:43:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02478648F21
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 16:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T583ErRS;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982A211A919;
	Fri,  5 Jun 2026 14:43:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151FB11A919
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 14:43:15 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-304eb0fc233so174006eec.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jun 2026 07:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780670594; cv=none;
 d=google.com; s=arc-20240605;
 b=DN4NUo0yMGWoJnTExP3I0pEupi1rnj3t1Sz5jmAGU++y2mG0cR2rwUU3h94ssLMUTt
 ohUV66Y2+WGRh99a2O6b2/LerfYr/fhltIKzj+V0lZy7gk4eHCQp9y1Mt11t3VnimUpL
 D1/y7VCoIXLiYRHexTwfNfLR9sHC2xhQPNzSE0/zBJ+7Zg0I9IpLmzoP6UeIo9p9R2ix
 96IfrVHdL1yGxTjA2R022qmNR4V52tW3LjvtuFQmFb4++5GYsm25c6huTOsPBpsLDuwT
 ZJzp31YHPx6tEEV7LwSLDcBnzbCQ3F6qJqt5lvIgwsP0iNLeDg12MbcHumRG4A9egJsM
 7Jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
 fh=AGmuXiU144lybkMLz58uCXJIYjMpciUf30VWlbdxVBY=;
 b=eXU/Y/Gx5Q3v4yHjU5EKP3zzOSARoKVmWnu6k5xMGhYoytodSE2p2/is9Q93OQPygq
 jjaY7Za2hiyo/3+btpN+AZJbYm5qID8cYOIZdvIwpKp90Udmnk7ZoRlj9qn5X6dOHgxm
 RKcWBN58vvdgKrABNoXWMzCjQDF6lzn768z5FWrDLub3n0FTGPszcfATGcEgyO/cP1r+
 PLYLRHQvNApN7oo7KhyqiwGenpX7CvFwr46in0H7HjaeMcq09SjEa5owvBPQDkocG84n
 syF0aGA7MkQlVc/giukpA9NyQrv5yNevLWHi+u3PHTQhbvfjgM61+Lhr4M71GOOuFhIB
 bUkQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780670594; x=1781275394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
 b=T583ErRS38rP4zDXTO/VmUsON3hSH5e5ruxyXJ2dqDjxaqRuO6Me5rMIm3QrqntA5l
 +XGcJwsePm0Olw6jq7cxBGfmq/ibwwhde+DuK3laANDj5arpbAu+UDRrL5uEwiCiy9jj
 cpQmECEoLkPE9yjnd8LN1Cd5m1bceRYJlT+mlfq8qi0FJWgyhnzL4/TDHJkkCTrLDon+
 ypQd8ztXAtGa2shK/G1Uph3BNZlyfSbvSGIxYTwqkZ3RP18vBWhn8rnRFuSXOUz1b1Ey
 F3srxHzD90Qtb9E8LNFsjVTkKjQtvIDnvi+n0lBOIk2+oFnKHdoV/XddRMbNbVN1F+31
 Umjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780670594; x=1781275394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zs2Tc10w1om1tJXU3BQwz8fKdjkQPd7nT9XdjGvAFtA=;
 b=eJljuaRFX/P855l4PmvtmQt8CtdRAtZwYxrC1gCoHFoFnR5jxboXYsYZFJ8zjmzcmG
 VEqNdvg4wUUurcSyhbBX+K8+WIao4BV9RZX3/cb5xQVcNj/0jtgDUpyjJfHCvhGDeB8k
 0IaXaXhCV+GqBvC+I4vC9GYCEV9hP8YuKOovGTXE0/WnjcvJfEFpoTLTAoX5Dh/IWnpm
 Kk0ccco5AyjW7VNC3/gR71XTIW9K27iWt31nGsEnAFTau95O2Wjzvo8pGvdUJSrM4zB7
 /2expAqSSnZP4YvfIk/2cVuESKbVJI/eWTB22OQa+0r0Gs0QtnMiuPwkEUVfZ38Ve+3x
 QPNg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/SmN4QrTAhDs3X2GeJ52Yu2FC8wEYO3YVtK+WVt4xXKtj01zfxMGwkDeuQM7KXIfr9rxVlbcTM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVCwKxeuG9GmAZr61gcCVVF1VN7MeOV/zBWJSB8Vl501b/w/h1
 bhuwvXGX0NGXP8WlunzHEhrDrhnS1JhNAn19erRA+bcFz+0Au5AIEWej8l/kIcCK1mmpYQPpNjb
 QnednnvtVoueHRh99CxOENNwvDeS3c1o=
X-Gm-Gg: Acq92OEHTmZQ/7dP2HruPxhUTjsCisGqOqSoa9QgJd3886CH0vEKlXi7dezBvh4a3mu
 POrFY2aW2v4hifJenyPuh4ZcS+GmDZ6XrRuWWVRxTjFZ3S8X4AuE02iM0GhE0fwtMoFLmT9WjVr
 GySfVszIp9fa2afFgZtd90zm8r2gqA12PsGFIMN2EViYUsC0+tN7f+sPxsekFOnNMOHHnTS6Yth
 rQHRTcXEDJXGIiK7lSSDt59DzOnKUXj707MibAnh/r3YJ+DofXhKs4xfjRQCgPh9WjqW9FcDoha
 hSHlzradIk+2LZITShlnoERI6wODFM2RMaq+YsS+7+vpvVNtieZ2GdiST385bQuBu6442TG43xU
 Jbl9J
X-Received: by 2002:a05:7022:407:b0:137:c0a7:8d0f with SMTP id
 a92af1059eb24-13806757572mr779741c88.5.1780670594109; Fri, 05 Jun 2026
 07:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <44069eb146824aa195312f5b02c49287@valvesoftware.com>
 <7a9021cd-fd78-4b0d-846b-135d0d72224e@mailbox.org>
 <16231b1742004f848af243ce398281ec@valvesoftware.com>
 <ce51243c-3b98-4f99-911f-70dd0b860da0@mailbox.org>
 <1c522568-1d5e-4210-8f25-1aa96e0d3c3a@leemhuis.info>
 <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
 <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org>
 <CADnq5_O9xMagapKQSO-6waXtmmFkDV-47ExVaNuiZd2xVdhefw@mail.gmail.com>
 <39ff584f-66ed-421a-918b-347d020a393a@mailbox.org>
 <399d0170414b4304823e866b04ab518a@valvesoftware.com>
 <ebe757cd-59d2-4590-b2f8-1e75a789fdb8@mailbox.org>
In-Reply-To: <ebe757cd-59d2-4590-b2f8-1e75a789fdb8@mailbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jun 2026 10:43:02 -0400
X-Gm-Features: AVHnY4IURXugvAuQB0M635QSjgSBCF4VFLAuGs17uisJGjQuOj-s33JKO7gRCX0
Message-ID: <CADnq5_McpRJzu1_UttS2NjnX5GRpTZG7H2oKpQ44yrQo3EOX+g@mail.gmail.com>
Subject: Re: [External Mail] Re: Test result / finding of "drm/amd/display:
 Consult MCCS FreeSync cap only if requested & supported"
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Pei-Hsin Yang <peihsiny@valvesoftware.com>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li,
 Sun peng (Leo)" <Sunpeng.Li@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 Linux kernel regressions list <regressions@lists.linux.dev>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:peihsiny@valvesoftware.com,m:Alexander.Deucher@amd.com,m:regressions@leemhuis.info,m:Harry.Wentland@amd.com,m:Sunpeng.Li@amd.com,m:regressions@lists.linux.dev,m:Christian.Koenig@amd.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02478648F21

On Fri, Jun 5, 2026 at 3:42=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 6/4/26 19:21, Pei-Hsin Yang wrote:
> >
> >> Note that Pei-Hsin reported an issue when running with my fix at the s=
tart of this thread, unfortunately it's still unclear if that's a regressio=
n of > my fix or happens even without it (in which case it might be another=
 regression of the MCCS related changes for 7.1).
> >
> > As I have mentioned earlier, my testing of your patch confirms that it =
is a regression even without your patch.
>
> You previously wrote "There are other issues without your patch applied",=
 I didn't see anything about whether or not the issue you reported in the p=
ost which started this thread happens without my fix though.
>
> Anyway, thanks for confirming that it's not a regression of my fix, that'=
s a relief.
>
>
> Alex, since the MCCS changes caused other regressions, it might be better=
 to revert them for now anyway though?
>

I don't know if I'll have time to get the reverts in this week.  Your
patch is in at least.  Maybe Harry or Leo can take a look next week
when they are back in the office.

Alex
