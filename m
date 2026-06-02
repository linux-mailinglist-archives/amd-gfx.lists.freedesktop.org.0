Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bHL1FTMeH2roggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 20:17:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFF630FE7
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 20:17:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="p0X3wu//";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D15210F2F7;
	Tue,  2 Jun 2026 18:17:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2210F2F7
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 18:17:20 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-137dd497007so251114c88.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jun 2026 11:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780424239; cv=none;
 d=google.com; s=arc-20240605;
 b=UU7T3x5CJ6UOIrt6NoBn//DDx1DIjy//eXcYXn71vc+w1Nuy8gvbs2k/TwA61RceEv
 GL/LYfphVFxBRcAUp1buuHO9JNMDsusaLeRiZ/0gLvNa84/NMEcjZlqD1DQoEYPlGqoi
 f5t6SYObgtjih+38gsn/pRqpHEVNleqvzP0Xf13TiyOaiJe770H1quT5dMzv+VaNSowE
 l8tYPfR4xQUK0cxH4vjrYmBCwRCClvk4lUloy9Qv8pB7U67EF3FErLw9Ie+moVMJSxb0
 SmUsqTLgTGCrVCXpr7GnNPtFa9VRRDDmgcz+VwVYLarQgA1p/bbEYXHqRFuPe6rk0h0e
 ftQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=G3sgWGnftf5X/aLb0mFwyDARyKY0b/CqboZWogLPm+M=;
 fh=gZ/QuQ1El2NU1RRI5pc/CAX4Mv4g4Ez7PWwEsOz7Ag0=;
 b=bvEMWwI3A1fns2IpS98vkHfPT0EzYtXustHRqj/KmTGw91VViH4ghtgPn2HOIVUANo
 OAZxupC01UntHyiskadEl6fnDHkHBogTb8BHMv9Zdhn0JL6QNmKyFHbQNtD4WhmFivZc
 /kO4ABwwzNSQiFzMOjNZ+Y5h5dbAFako3wirELgKZUtj9z15S7XTA0a517GGfUSEnqGD
 Q5ubOjxvFMoWWJ5CAAMDdYVN39kL6GTb2ADe7mmSVeSNFRdAKQsekYYR5mdAaUEi2kby
 kYXqc6tWFHXc/WorqWwrElPos4ykkoKEvEsWAX4Oze7M0Y40vE76onPrzGdxtp6K1tby
 uLbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780424239; x=1781029039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G3sgWGnftf5X/aLb0mFwyDARyKY0b/CqboZWogLPm+M=;
 b=p0X3wu//8hVNVkr815Z17S2M2lRrtZNUT9XYGpFTfy2IBZzodrtF5d0Jei6tjKfcnT
 etMfoZJSsSvoAJVOkS7Hz+bHax1myo50OES/+uz4OMY1qB+2f4KPLh0BRW+Eb6o8orGK
 9dbic5yR8e0+3q5F8DEtOou1Dv9MCk4FTZAqBVk8+RPn0PHlegc/EbJKjScgA28t/Qk1
 GkLgq9dYSQSzUvqD9BPzVGe1lx2fBtbKILwRhzzLlDiCR4Jjgl8BID/nsIURoJlUbPl/
 RzWJHU+2urpHUia6AAERRvKE/inzazi0OgL9C+FFsgOEApBBDTHPHVT9HTEDl3bAjAQh
 qf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780424239; x=1781029039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G3sgWGnftf5X/aLb0mFwyDARyKY0b/CqboZWogLPm+M=;
 b=DBnhKUvqDJJP+c2wcz/J/ejD6BA6f722U3U5gyR4cAlLvKQmyzPkPVqNgG42CDq4Sz
 FymZVNFq+Wpld5LIPCbZF6KWZPZq82l8F5KqKZnKY0xWlxj48scDV890bRY3AjNf4T4V
 5DbuNeg6RKFNvyER4gGgS/Xh7OPql6J3xYZoAF67m8Wz92saMuiSmL243BVlmR/PnWkR
 0SQU3zsHt5wHVQxm/reYFJPeWN9UEjWKRq87WA+1pMt3Iruo8Er5mhqcVoPgvxs9GU82
 uPVG83BUkhTJU3F2OEXNWbrK8Al2VTO6LiEQsSfRi++jZGp3QAZ8pJ08x0l2d0ufCcJf
 kInw==
X-Gm-Message-State: AOJu0YxmQ3a3WHhmYM6ufQOp2QcgQnFjyx5tfSNLLeRRnifPEVQV/9CG
 zSpT3bitaryiZLUxMj4Hgg/7mJmI/mdP378Nm7t9SEFC+MCRsG9Et7qpb/l4pdaN6UCHGaTKwGm
 O1/P3yR9+E3cTRpfVFt1gftJhIyTPmSPP+A==
X-Gm-Gg: Acq92OFtXDvsOf0NklyacxiH0v4ZU+wANDmkjvT0pGC7rONar810My+bodmtue5Je1/
 IXF83+OAoqKCh/R6GSVsSiDayFdh4sgNONY3eze9xPWQNWOaFZfqwQaATDZKaxpw26c3bseCoSv
 sM+LCzI9j39HMN6PWUqIUX5PU0eH4leOW8Jj5NKLMfqaCr12kTV/FO82Enw7emu01PuzpTyjf8r
 w1MgHweefWok+JgpuL+HOz7tRnE3mowb56ULTBJ9Dyh3CS58bZzWZwVjc1tig4uXCBMi8eyVlqs
 GUpUTeHD8zOng7rS8+4cm6cYMYKbhElsiLjmoiTclLiiL4HmW5KiLdXbrqrpzW0ryRseJeVdxkN
 VRdp3
X-Received: by 2002:a05:7022:4092:b0:137:d966:d890 with SMTP id
 a92af1059eb24-137d966de6bmr2059075c88.7.1780424239333; Tue, 02 Jun 2026
 11:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260601193545.210335-1-Yongqiang.Sun@amd.com>
In-Reply-To: <20260601193545.210335-1-Yongqiang.Sun@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Jun 2026 14:17:07 -0400
X-Gm-Features: AVHnY4LHxoyO1wj8y8Yg6Iy--BpwjCQNShQ_aAeSqsjCb5U26TeypEUMawKlUkk
Message-ID: <CADnq5_PM0xrXHUunAaGqDwY9vy2i-ygBf-ZJWsDo4YxvL4x_Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Fix infinite loop parsing CRAT with zero
 subtype length
To: Yongqiang Sun <Yongqiang.Sun@amd.com>
Cc: amd-gfx@lists.freedesktop.org
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:Yongqiang.Sun@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
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
X-Rspamd-Queue-Id: ADCFF630FE7

On Mon, Jun 1, 2026 at 3:44=E2=80=AFPM Yongqiang Sun <Yongqiang.Sun@amd.com=
> wrote:
>
> Malformed ACPI CRAT tables can advertise a zero or undersized subtype
> length. The parser then fails to advance the cursor and loops forever
> while the remaining image still looks large enough for a generic header.
>
> Validate sub_type_hdr->length on each iteration before parsing or
> advancing. Return -EINVAL and warn when length is zero or smaller than
> the generic subtype header.
>
> Signed-off-by: Yongqiang Sun <Yongqiang.Sun@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_crat.c
> index cf7b1b038d5f..cea1dc654125 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -1404,6 +1404,14 @@ int kfd_parse_crat_table(void *crat_image, struct =
list_head *device_list,
>         sub_type_hdr =3D (struct crat_subtype_generic *)(crat_table+1);
>         while ((char *)sub_type_hdr + sizeof(struct crat_subtype_generic)=
 <
>                         ((char *)crat_image) + image_len) {
> +               if (!sub_type_hdr->length ||
> +                   sub_type_hdr->length < sizeof(struct crat_subtype_gen=
eric)) {
> +                       pr_warn("Invalid CRAT subtype length %u\n",
> +                               sub_type_hdr->length);
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
>                 if (sub_type_hdr->flags & CRAT_SUBTYPE_FLAGS_ENABLED) {
>                         ret =3D kfd_parse_subtype(sub_type_hdr, device_li=
st);
>                         if (ret)
> --
> 2.43.0
>
