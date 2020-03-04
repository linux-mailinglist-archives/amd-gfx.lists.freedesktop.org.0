Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820C179BC7
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Mar 2020 23:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8B16EB72;
	Wed,  4 Mar 2020 22:36:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED576EB70
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Mar 2020 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583361387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bGzow7OU6gaIH5sJh0BKwjJSVmZdQNGpCvs2KXsONBE=;
 b=TRuVOjXRaPIL14oFg3Co6ALKgWLKY2yU1DaDULn39XZwF90BEBMmACEo2yLIaTzolCo64g
 aWuVyghZJ9losjrbNV3wC7nIhaoWVIOAPznYmc6tQWN8GtDeo5mi/iALkQW1kSkDlrXogB
 4uwe9N99UXH5n7At19E+rawZveLLVXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-3VoyKBf-Nk-icFBQSHFWrw-1; Wed, 04 Mar 2020 17:36:25 -0500
X-MC-Unique: 3VoyKBf-Nk-icFBQSHFWrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7374B8017DF;
 Wed,  4 Mar 2020 22:36:23 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB5DE60BE0;
 Wed,  4 Mar 2020 22:36:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 0/3] drm/dp_mst: Fix bandwidth checking regressions from DSC
 patches
Date: Wed,  4 Mar 2020 17:36:10 -0500
Message-Id: <20200304223614.312023-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QU1EJ3MgcGF0Y2ggc2VyaWVzIGZvciBhZGRpbmcgRFNDIHN1cHBvcnQgdG8gdGhlIE1TVCBoZWxw
ZXJzCnVuZm9ydHVuYXRlbHkgaW50cm9kdWNlZCBhIGZldyByZWdyZXNzaW9ucyBpbnRvIHRoZSBr
ZXJuZWwgdGhhdCBJIGRpZG4ndApnZXQgYXJvdW5kIHRvIGZpeGluZyB1bnRpbCBqdXN0IG5vdy4g
SSB3b3VsZCBoYXZlIHJldmVydGVkIHRoZSBjaGFuZ2VzCmVhcmxpZXIsIGJ1dCBzZWVpbmcgYXMg
dGhhdCB3b3VsZCBoYXZlIHJldmVydGVkIGFsbCBvZiBhbWQncyBEU0Mgc3VwcG9ydAorIGV2ZXJ5
dGhpbmcgdGhhdCB3YXMgZG9uZSBvbiB0b3Agb2YgdGhhdCBJIHJlYWxsbGxsbHkgd2FudGVkIHRv
IGF2b2lkCmRvaW5nIHRoYXQuCgpBbnl3YXksIHRoaXMgc2hvdWxkIGZpeCBldmVyeXRoaW5nIGFz
IGZhciBhcyBJIGNhbiB0ZWxsLiBOb3RlIHRoYXQgSQpkb24ndCBoYXZlIGFueSBEU0MgZGlzcGxh
eXMgbG9jYWxseSB5ZXQsIHNvIGlmIHNvbWVvbmUgZnJvbSBBTUQgY291bGQKc2FuaXR5IGNoZWNr
IHRoaXMgSSB3b3VsZCBhcHByZWNpYXRlIGl0IOKZpS4KCkNjOiBNaWtpdGEgTGlwc2tpIDxtaWtp
dGEubGlwc2tpQGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGdvb2dsZS5jb20+CkNjOiBIYW5zIGRlIEdv
ZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgoKTHl1ZGUgUGF1bCAoMyk6CiAgZHJtL2RwX21zdDog
UmVuYW1lIGRybV9kcF9tc3RfaXNfZHBfbXN0X2VuZF9kZXZpY2UoKSB0byBiZSBsZXNzCiAgICBy
ZWR1bmRhbnQKICBkcm0vZHBfbXN0OiBEb24ndCBzaG93IGNvbm5lY3RvcnMgYXMgY29ubmVjdGVk
IGJlZm9yZSBwcm9iaW5nCiAgICBhdmFpbGFibGUgUEJOCiAgZHJtL2RwX21zdDogUmV3cml0ZSBh
bmQgZml4IGJhbmR3aWR0aCBsaW1pdCBjaGVja3MKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jIHwgMTI0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgotLSAKMi4yNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
