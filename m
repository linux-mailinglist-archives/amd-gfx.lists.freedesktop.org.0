Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIwkEScpzWnTaQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 16:18:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521937C013
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 16:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7E510EDC0;
	Wed,  1 Apr 2026 14:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="J4Ev+OP0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03C10EDB1
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Apr 2026 14:18:11 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-64edf260b49so1962178d50.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Apr 2026 07:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775053090; cv=none;
 d=google.com; s=arc-20240605;
 b=YBR2Uiw8Xlk5b9aYFPvPAh9UNH+xQSaSiOJ4b6aGinYG7xBkpgGfOyBqkjzDzs2bBN
 b89SIeZ/jRWDw8PYRuZhZIwOMFD0heuNd64C27mZWXvRMmbHfV2QGt9M/jXITgFCEcVE
 4sgZUVDw8veOQJCQ1kNbPkrIaJM9TZOse7X1FpjmgwXw8KQLLGyLxXmBaPB45WmF0vFX
 cpxDaSIJnz+4Jlp2XmVH/mYjrgVMpQGEkIijtXZImgJoBvpbuWhP5dayc+JT1kd6jCql
 XgLt0AsP800+jm2jmI2TR3CC7GBsLEWFQ4e/D9DsoCmxsByecTq2aDcFz7Ub1DUWaCTE
 NUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=S8Tzy9p65X+mMpYvFYQPPcRz7RB7Jp7ad2p90YGsMbw=;
 fh=aPkDINnudaIKf5FURVQDCrDgr63BeNc12UU+6tZ13aM=;
 b=aH9wpI+3vIVdQwk7dgIKYux1u9bnO1JhOVOPUWnWnhSiZr9TC8465k9Oa6BOul06Kz
 zPUgo9LWYZ9lSobKo1WMR61QQv8IlkiLCk8BHcWggQ0640KVTCuy7NeGjdqx3mt6ei6T
 m4WTHVOYyYH7lv6ZG/cgmHnfh2x2pGVCBRznWjje74GPV4ZQuzs56B21F+k51eYMOuLL
 D3xZrfxuRw+1U1IrVbq7OtNJHdeAzgBL2OCjqgza0HwBCYfkxwPcAyLV1jlw/scbBNsK
 Lz+eTKWi41FJ2Vu/9oIdoLsEq6jEaRTvbazyH/wtmp5PaemAatJ/cwlc4SDHh6BAbEMK
 j3/w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1775053090; x=1775657890;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S8Tzy9p65X+mMpYvFYQPPcRz7RB7Jp7ad2p90YGsMbw=;
 b=J4Ev+OP0vQD5sQTHTbC7JDxR/qgDIb7I+jHaq42sgAr3GHwwBPzufJM7id8MiNecDi
 61D1/up/BltwTGsvUOUTffRWIhXGWbgaTGkpUS5Fd7cb9ywfTgsVG2WbU1oAVg77zhvJ
 PuRyvyNrrYnYP8W4CR3my9OkrhbuTQ5pS5A5RuoLc9nhMkN/kzCwaXJ71raRAkessgoE
 8YZ1iuqSKjV3dvBY6yUCINX/TjXdKmF24WuBqDBBUvzXGjQIN7aLSEoq5XaQbwZYCCou
 /GDnYNUfFInj2Fdz6wzBzj1i1bIUz93e3hH7Kbhvt8m/QxBNHkKj7O1pol+hd0FfpLiq
 oCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775053090; x=1775657890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=S8Tzy9p65X+mMpYvFYQPPcRz7RB7Jp7ad2p90YGsMbw=;
 b=lrOmIdPm6Tu7FxiFyH69Id90VlCffNWFbTkIkQcwWLK/RE13H+4Pylc6OB9fE+T/3P
 ONh6tQfU1fngPqFy0kRuFbQqR0LiCUHxW65wceZBdGJ6P23voQp23GxSP7/ik48Ykf2r
 jdkGxZYLVgpdLZenSM0W2+TR82sPJLrSy39MI86HO/mV2jUFtQXqd++7hO1g7rEvRLuk
 luiW/jDd2jWSov1BgiYHjGKTMl0K6lxeHdCInHDNWbFwoir4dPTbJNCQNXQfG9KuuLBq
 hyxTsC/PtpPTk2ZldpvkexGhQI8t2304B7WRaSSKlcgc1tZ79r/bOwdhVZWJkhLImUwx
 aSig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXena6RJL/j/M1Iqihl3FE0CFTYCSkZDs1js2qzCgbPUDYFg2qaTNEjVW0DanTqr6AWvVYNmD4g@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfoMLgBVpNArl2B2S4i7QvT3Taj6lkyuBngEya3LlHGeFgjimW
 VqRNKHwxqPshsdhHcynLUkWoogltLWArc7vjzbVPfEw0Dp56JJqwfKFiFLVC8q2qoUArkPjrLtZ
 VQBmDyFOM8lTD+L5sQdtIEh6Juh0z5EKbc1xoc0JC9g==
X-Gm-Gg: ATEYQzy1yqb+jNQfJv6hEyrOBRkzIhuhKC3XTOpVVPnp2QYKUTDYxYiHYzsPiQe4UqV
 YKLO9mAKAtL4ChrO6YnDz2Vtso8Qu3qdJXsshQkCqQjrw84e9S2Rhqa2cuYTPSZi710QRelxLxg
 SKazdAxhmxNvfPhYPZZ1SwtiiZQMZbf5BLkgPPfxTGgwaqNFrfZj5NlWp49OAFXUN5LmlzfJ2rH
 p18FhClXx039vst09tBh3OVi7leUkT+hHGXFenfJlvQIF93Ex/TI/hpSqu4fw+8C0rIDTl5fGFR
 2jxEp95S5ImkwtU=
X-Received: by 2002:a53:e312:0:b0:64e:ef3b:3bd8 with SMTP id
 956f58d0204a3-65026785cffmr6540304d50.25.1775053090128; Wed, 01 Apr 2026
 07:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <4265353.aeNJFYEL58@workhorse>
 <254c20a4-cce3-4c8e-9902-514586f3e694@mailbox.org>
 <5416161.aeNJFYEL58@workhorse>
 <792c4540-d690-4453-a32e-62e23e78d628@mailbox.org>
 <9d525fe4-b091-4cd9-b977-de19ffe4b957@amd.com>
 <20260331155028.71246d7a@fluorite>
 <dc7f59af-05d0-4942-b21b-b85289f7eee1@amd.com>
 <CAPj87rOz=QvQE1CqshspTPkC5nSXW_WAxUf1rwa=w4zmPdgtQQ@mail.gmail.com>
 <ac0kP-SWXrBwrN5C@intel.com>
In-Reply-To: <ac0kP-SWXrBwrN5C@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 1 Apr 2026 15:17:57 +0100
X-Gm-Features: AQROBzD4B_Lr6xyBp4FYMWC4emgyzUnkdo4rM9x9i8ve778cUGxmkNRuKAQF9Bo
Message-ID: <CAPj87rNfJCCUFYqD+p6OM5XDE8CA75anmA7+ezrCTSZXBSDgTQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Stone <daniels@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[fooishbar.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:harry.wentland@amd.com,m:pekka.paalanen@collabora.com,m:michel.daenzer@mailbox.org,m:nicolas.frattaroli@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:daniels@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:derek.foreman@collabora.com,m:marius.vlad@collabora.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,collabora.com,mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,fooishbar.org:dkim]
X-Rspamd-Queue-Id: 9521937C013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 at 14:58, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> I've been musing about userspace being able to provide some kind of
> relative quality weights for each output. The driver could then use
> those to figure out how to balance the final bpc and compression
> between the outputs. Something like this would let userspace express
> its preference while still allowing the driver to decide how to
> actually get there.
>
> Simple 'desired bpc' seem somewhat insufficient because I would
> imagine userspace just sets that to max for everything at the start,
> so the driver might not be able to tell which outputs can be degraded
> harder than others.
>
> I suppose a desired+min bpc might work, but would potentially force
> userspace to tweak the parameters in some semi random fashion and
> try again if the end result isn't appealing. And exactly what to
> tweak is really hard for userspace to figure out since it has no
> idea of the possibly complex internal/tbt/mst topologies, power
> costs, etc.

I agree with everything you've written, apart from 'I would imagine
userspace just sets that to max for everything at the start'.

I've taken it as axiomatic that all of these things should have an
'auto' value, and have it as their default setting. Userspace _may_
know better than the IHV, but it's only going to know on a situational
basis.

Compositors blindly setting random tuneables to MAX_AWESOME_POWER
would be just as stupid as distros shipping ye olde Option
"AGPFastWrite" and Option "AGPMode" "8" by default. I'd expect any
userspace which blindly did that to immediately get as many bug
reports as they have users, and for them to fix it accordingly.

By analogy, we allow userspace to ignore EDID and set whatever cool
awesome mode it wants to. But it doesn't do that unless it has a very
very good reason to override the driver, and 99 times out of 100, that
reason is 'the user has figured out that this is required'.

Does that help?

Cheers,
Daniel
