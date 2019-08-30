Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6AAA3E6D
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0679E6E3BC;
	Fri, 30 Aug 2019 19:32:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741516E36D;
 Fri, 30 Aug 2019 16:33:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92BE7ADB3;
 Fri, 30 Aug 2019 16:18:11 +0000 (UTC)
Date: Fri, 30 Aug 2019 18:18:19 +0200
From: Jean Delvare <jdelvare@suse.de>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/radeon: be quiet when no SAD block is found
Message-ID: <20190830181819.467fffa0@endymion>
In-Reply-To: <20190830181541.7d2be23d@endymion>
References: <20190830181423.4f31a28f@endymion>
 <20190830181541.7d2be23d@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Aug 2019 19:32:16 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T29wcywgc29ycnksIEkgbWVzc2VkIHVwIHRoZSBzdWJqZWN0IGxpbmUgb2YgdGhhdCBvbmUsIHdo
aWNoIHNob3VsZApyZWFsbHkgcmVhZCAiZHJtL3JhZGVvbjogYmUgcXVpZXQgd2hlbiBubyBTQUQg
YmxvY2sgaXMgZm91bmQiLgotLSAKSmVhbiBEZWx2YXJlClNVU0UgTDMgU3VwcG9ydApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
