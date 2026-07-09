Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vu89FvWcUGq12QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C81737FD6
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 09:19:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kde.org header.s=users header.b=OnhN6t7A;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A73610F7D4;
	Fri, 10 Jul 2026 07:19:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8867910F50E
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 11:38:36 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 507EF32E49F
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 12:38:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1783597111; bh=VkImaP986qYsluwwoX8dWvkmM++SDGoD6+tk2rM71JE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OnhN6t7AaJcYkoCVuU91FFnHBLsxrNREYcA0nwK6xC7QJB9Seg3+aeMfkAyjlQr04
 68dk0YwD+Zq5dufJ5r3w16GTUQuvV76/m8Z1lt9EClMPsgz4Tq38NRhXuESQZxZKf4
 uaLIvcfO5I5ONiCoyLFzEm4Qd+bNLhZeGiCmmRGC14co/PhEoa7O2t9Kp0015peicG
 +prVO22N0Y6CKiNxCQANjm388zAlRkahygFCugGQpKo7Rrtkbu/B8TKOY7f8SlIu1N
 xf7LLxWn5M5sxkehfso690/+Td6iF6Inh3YDobIFN4OXD+sNIaf/CvSuiptguKOHQs
 JUGi2ydGbb/tg==
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-8efcef23d21so5231266d6.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jul 2026 04:38:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rr94hJ1TjecYXPtguC+wdTnwO1cu7Dt3JVzTL8s4FzH/G9/9qbBtlRv4+TBvfkylhO7brorO76y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWmep6yM6mu/V5QlXtk3rfNxW1/U4hfKkW+JVshpB34oKTmZmJ
 vspvMpVkOAABB1kTfwyKsiw5vXVjkffy5D0tLZGkGx3YzNO9hz8tjlEiZE52drbclRA4tLmHTLA
 CGKp0d0k4KgOfhEEpgrCZUbNxVAG/zys=
X-Received: by 2002:a05:6214:5087:b0:8fd:6de3:dd7e with SMTP id
 6a1803df08f44-8fec371c58bmr69260556d6.64.1783597109866; Thu, 09 Jul 2026
 04:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260625150439.330875-1-nick@haghiri.net>
 <928d4c2a-d8b7-43d7-995e-a3e6996d2952@amd.com>
 <8e62f139-1d61-433e-8029-b10025a289d3@haghiri.net>
 <7a474010-67a1-426b-9ca2-76c11cfbb0ac@mailbox.org>
In-Reply-To: <7a474010-67a1-426b-9ca2-76c11cfbb0ac@mailbox.org>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 9 Jul 2026 13:38:17 +0200
X-Gmail-Original-Message-ID: <CAFZQkGwv3Nb46EQ6qrxVVEao6RS6QNeYiAw+3FJ09bwwG4Qo4w@mail.gmail.com>
X-Gm-Features: AUfX_mydIY1RLdkm4mRQqEkFzWqLWJy0RXCRjIgjB2fowZig78KG-pZVp99mDsc
Message-ID: <CAFZQkGwv3Nb46EQ6qrxVVEao6RS6QNeYiAw+3FJ09bwwG4Qo4w@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/amd/display: extend HPD debounce filter to
 DisplayPort SST
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Nick Haghiri <nick@haghiri.net>, Ivan Lipski <ivlipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 10 Jul 2026 07:19:09 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kde.org];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:nick@haghiri.net,m:ivlipski@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:ivan.lipski@amd.com,m:siqueira@igalia.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xaver.hugl@kde.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kde.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,lists.freedesktop.org:from_smtp,mailbox.org:email,gnome.org:url,kde.org:from_mime,kde.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4C81737FD6

Am Fr., 26. Juni 2026 um 10:53 Uhr schrieb Michel D=C3=A4nzer
<michel.daenzer@mailbox.org>:
>
>
> [ Adding Xaver for awareness ]
>
> On 6/25/26 21:45, Nick Haghiri wrote:
> > On 6/25/26 3:15 PM, Ivan Lipski wrote:
> >> I don't think I've encountered a situation when a monitor with DP can
> >> wake a system up from DPMS, so that's interesting. What distro and
> >> desktop environment are you using? I'd like to reproduce this issue
> >> and help with it.
> >
> > openSUSE Tumbleweed, KDE Plasma 6.7 on Wayland (KWin). GPU is an RX 907=
0
> > XT (RDNA4), monitor is an MSI MPG 274U over DisplayPort SST.
> >
> > What happens: when the output goes DPMS-off and the monitor drops into
> > deep sleep, it briefly de-asserts and re-asserts HPD. amdgpu forwards
> > that as a hotplug, KWin re-probes and re-enables the output, and the
> > panel comes right back on, so it never actually stays asleep while
> > connected.
>
> FWIW, that the panel comes on and stays on might be a KWin bug. Mutter ha=
d a bug like that, which I fixed in https://gitlab.gnome.org/GNOME/mutter/-=
/merge_requests/4209/diffs?commit_id=3Dec73076e07640fc0752d9ecc66c5934726db=
2d7e.
Yeah, I did find (and fix) a different problem with our workaround
recently, where KWin-internal pointer warps in response to the
"hotunplug" were wrongly counted as user activity in some cases.
Either way, kernel-side debouncing is very much appreciated.
