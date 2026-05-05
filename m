Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHNjAnHn+Wl1FAMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 05 May 2026 14:49:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899454CDE8F
	for <lists+amd-gfx@lfdr.de>; Tue, 05 May 2026 14:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1051F10E1BC;
	Tue,  5 May 2026 12:49:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from h6.fbrelay.privateemail.com (h6.fbrelay.privateemail.com
 [162.0.218.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB8C10EA78;
 Tue,  5 May 2026 11:41:47 +0000 (UTC)
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4g8xS84Ndwz2xdt;
 Tue,  5 May 2026 11:41:44 +0000 (UTC)
Received: from hal-station.localdomain
 (bras-base-toroon4332w-grc-26-174-91-51-28.dsl.bell.ca [174.91.51.28])
 by mta-05.privateemail.com (Postfix) with ESMTPA id 4g8xRR3Lb7z3hhTf;
 Tue,  5 May 2026 07:41:07 -0400 (EDT)
Date: Tue, 5 May 2026 07:41:03 -0400
From: Hamza Mahfooz <someguy@effective-light.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Ivan Lipski <ivan.lipski@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 Yussuf Khalil <dev@pp3345.net>, Tom Chung <chiahsuan.chung@amd.com>,
 Roman Li <Roman.Li@amd.com>, Colin Ian King <colin.i.king@gmail.com>,
 Charlene Liu <charlene.liu@amd.com>, Kees Cook <kees@kernel.org>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/atomic: attempt full modeset on page flip
 timeout
Message-ID: <afnXTwKBfjBYdwgL@hal-station.localdomain>
References: <20260501203552.749080-1-someguy@effective-light.com>
 <5dd93e29-a076-491b-9861-e08a0204c77d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd93e29-a076-491b-9861-e08a0204c77d@amd.com>
X-Mailman-Approved-At: Tue, 05 May 2026 12:49:49 +0000
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
X-Rspamd-Queue-Id: 899454CDE8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[effective-light.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,linux.dev,pp3345.net,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hal-station.localdomain:mid]

On Mon, May 04, 2026 at 04:50:21PM -0500, Mario Limonciello wrote:
> Do you actually need to set all 3 of these to true?
> 
> I would think you only need:
> 
> crtc_state->mode_changed = true;
> 

According to my testing `mode_changed` on it's own is sufficient for
amdgpu and the documentation [1] seems to suggest that it should be fine
more broadly. Though, it doesn't seem harmful to set all of them just
for safe measure.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/drm/drm_crtc.h?h=v7.1-rc2#n118
