Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKdlLslhzWmMcwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:19:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4576437F2E2
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEFC10EE35;
	Wed,  1 Apr 2026 18:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="kmTDpPzd";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A15210F0B6
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Apr 2026 11:57:23 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com
 [74.125.224.49]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 851F5328046
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Apr 2026 12:57:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1775044641; bh=4uVC0aEYxjaQTuwalpCxtrvLnrNOwwa3Rtte4QhHBaU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kmTDpPzdnZocJ3AAU9nGKH3TvjRuQ03QfSox30SizVXApcMbr5C9q/fTv9Ew/gqZm
 20AJF7HAftyEUv2Ckrj9zKxJXCRljRApIiVsgAKW3/PaWqwnMItAmUeatsR1NT+/w9
 KqwVL+sRddC+5m0enXAodov9/Anvwz0JRCkPYV4D6eHA5JEY4Ih9GoP1d0L1704bu+
 IzBrFYAr/ZtsWhXGIDWwvyqf1ozXZ/Ghp1xyaH4ctNPXs5ZaFsx9AdrtMfGtE3axDT
 poxYQTtGa5CmOg2yyvhPABYyOTKezcEK5w3PxFvMTvsnBAPHOFsxieaVy4aPMj8uXX
 X4Q0ANYOTd3NA==
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6501d242e3fso5833280d50.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Apr 2026 04:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmdNEgfZOInKM+Lu1JOMhpNFYYyxIJv5yNA+FFiblVhMfeSB0YEuss7IeqsBcykHG6p+0m1YYO@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2yhEonuecLra4cFLs9zcOetHcFwmRns268wlUEDlKBZ13p3ZY
 oIxxN+ccaFscHUqws5ImeZqSWr4k5DATwCYGSn8Yiz8apQ2b801NDQWHY5PxEybuInciLCfeV2o
 y5yXscfSwXApiusk3/mhO7DSeMvvoD3Q=
X-Received: by 2002:a53:d6c6:0:b0:64f:ff90:4d56 with SMTP id
 956f58d0204a3-6502fe7bfe7mr2471092d50.61.1775044639847; Wed, 01 Apr 2026
 04:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
In-Reply-To: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 1 Apr 2026 13:57:08 +0200
X-Gmail-Original-Message-ID: <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
X-Gm-Features: AQROBzB1fVLxlzjejIYl_P8C5IorU1scQP8jhea66UlykTztcno2mlXZQEtFuOY
Message-ID: <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Stone <daniels@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 01 Apr 2026 18:19:20 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kde.org:s=users];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:ville.syrjala@linux.intel.com,m:daniels@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:derek.foreman@collabora.com,m:marius.vlad@collabora.com,m:wayland-devel@lists.freedesktop.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[kde.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[xaver.hugl@kde.org,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,collabora.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xaver.hugl@kde.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kde.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4576437F2E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Do., 19. M=C3=A4rz 2026 um 13:28 Uhr schrieb Nicolas Frattaroli
<nicolas.frattaroli@collabora.com>:
>
> This series adds a new "link bpc" DRM property. It reflects the display
> link's actual achieved output bits per component, considering any
> degradation of the bit depth done by drivers for bandwidth or other
> reasons. The property's value is updated during an atomic commit, which
> is also when it fires an uevent if it changed to let userspace know.

Hi,
I think it's a really good idea to have a property for knowing the
actual bpc of the link... however, I do have one big concern with this
API specifically: It only gives me this information after a modeset.

With this limitation, I can at most show the user which bpc was chosen
after the apply display settings and have the end user manually test
and figure things out, but I cannot show in the UI which bpc will be
chosen with some configuration before they apply it, and I cannot do
atomic tests to find a desired tradeoff automatically on the
compositor side.

As a side note, for future patches relevant for compositors, please cc
wayland-devel. It really shouldn't be up to chance whether or not
compositor developers that would later use the API find out about it
before it's merged, and keeping track of all of dri-devel is way too
much to ask from userspace developers.

- Xaver
