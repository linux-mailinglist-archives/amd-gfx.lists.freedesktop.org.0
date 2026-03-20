Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NspCJZavWkA9QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 15:32:54 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA82DBD72
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Mar 2026 15:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EE510E97F;
	Fri, 20 Mar 2026 14:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yN55ruUD";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EBA10E97F;
 Fri, 20 Mar 2026 14:32:49 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fclQh4vBlz9tZ5;
 Fri, 20 Mar 2026 15:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1774017164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JviG+14X+C7+tuV4p6c0wZqqdSSzi7L0/JzOdiSaoXc=;
 b=yN55ruUDWswzfPTyDMKIwB7w0j+DnWjjibJmqGyFGYNL34217Zbl29ziPbhMDNrLSdm9pE
 29gpce9s+dnxDsz1lA5EVe4glJsygJKmWG3TNMfDcLT5vT7mtu0sNJYknB1PdjNcKe7lq4
 ekzRI5OGDwWkJfFU4R7hnPFH+mqR7TR5SYhQzNb6lmfgZoPmnSa0/14zqO0fUVR8PJvOog
 TVjRAKmlh8pg4rwGk/E5htg8yEuLc/tSrslsI303ZJqPi0eZcfwd5bEGEYoSGriaSXMFVs
 JpxiaB4ihGMIrAkhD7unw6n6hCG7Km4ET8H603W/Af5F62QcVHslmkHHkAq4FQ==
Message-ID: <8ba60a99-f69e-482e-bd68-f6bc36291c54@mailbox.org>
Date: Fri, 20 Mar 2026 15:32:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f1b27e5aef372acf5dd
X-MBO-RS-META: arpuksg4c75ewmkcxo8yqdbm8mtxuum1
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 82AA82DBD72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 13:28, Nicolas Frattaroli wrote:
> This series adds a new "link bpc" DRM property. It reflects the display
> link's actual achieved output bits per component, considering any
> degradation of the bit depth done by drivers for bandwidth or other
> reasons. The property's value is updated during an atomic commit, which
> is also when it fires an uevent if it changed to let userspace know.
> 
> There's a weston implementation at [1] which makes use of this new
> property to warn when a user's requested bpc could not be reached.
> 
> [1]: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850

I see no description of a real-world use case, either in this series or in the weston MR, beyond logging a message when the "link bpc" & "max bpc" property values don't match. They are not expected to match in general, so I have a hard time seeing the usefulness of that.

Moreover, there's no description of what exactly the "link bpc" property value means, e.g. vs things like DSC or dithering, or how a compositor / user would determine which value they need / want under given circumstances.

In summary, I'm skeptical that this will be useful in practice in the current form. I do see potential for spurious bug reports based on the "link bpc" property having the "wrong" value though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
