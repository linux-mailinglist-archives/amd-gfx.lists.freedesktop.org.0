Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEg6FFV4fGmWNAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 10:22:29 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F45B8D6D
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 10:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252B810E990;
	Fri, 30 Jan 2026 09:22:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F135910E874;
 Thu, 29 Jan 2026 14:34:22 +0000 (UTC)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id 4f21qd6tX4z3hhRw;
 Thu, 29 Jan 2026 09:34:21 -0500 (EST)
Received: from hal-station (unknown [45.38.20.240])
 by mta-15.privateemail.com (Postfix) with ESMTPA;
 Thu, 29 Jan 2026 09:33:46 -0500 (EST)
Date: Thu, 29 Jan 2026 09:33:41 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Message-ID: <aXtvxTNow7bAYlYU@hal-station>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
 <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com>
 <aXto53g2mSNsNmFM@hal-station>
 <1a75a4d2-64f3-4d19-802c-fc5c79b002c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a75a4d2-64f3-4d19-802c-fc5c79b002c6@amd.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 30 Jan 2026 09:22:26 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.69 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[45.38.20.240:received];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[effective-light.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,amd.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	R_DKIM_NA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D9F45B8D6D
X-Rspamd-Action: no action

> Thanks a lot for that. What happens if you apply this?
> 
> Can the higher level handling recover from that? E.g. continue after 10 second timeout.
> 

Without my series applied it just stays stuck (i.e. the CRTC is still on
the last rendered frame).
