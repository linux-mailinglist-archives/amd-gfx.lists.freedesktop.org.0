Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A14A9B16
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 09:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C189D7B;
	Thu,  5 Sep 2019 07:05:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6472389D89;
 Thu,  5 Sep 2019 07:05:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00A66302C060;
 Thu,  5 Sep 2019 07:05:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DA6E60606;
 Thu,  5 Sep 2019 07:05:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9855531EFF; Thu,  5 Sep 2019 09:05:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/amdgpu: switch to gem vma offset manager
Date: Thu,  5 Sep 2019 09:05:06 +0200
Message-Id: <20190905070509.22407-6-kraxel@redhat.com>
In-Reply-To: <20190905070509.22407-1-kraxel@redhat.com>
References: <20190905070509.22407-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 05 Sep 2019 07:05:17 +0000 (UTC)
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
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGFzcyBnZW0gdm1hX29mZnNldF9tYW5hZ2VyIHRvIHR0bV9ib19kZXZpY2VfaW5pdCgpLCBzbyB0
dG0gdXNlcyBpdAppbnN0ZWFkIG9mIGl0cyBvd24gZW1iZWRkZWQgc3RydWN0LiAgVGhpcyBtYWtl
cyBzb21lIGdlbSBmdW5jdGlvbnMKKHNwZWNpZmljYWxseSBkcm1fZ2VtX29iamVjdF9sb29rdXAp
IHdvcmsgb24gdHRtIG9iamVjdHMuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggMzRlZTVkNzI1ZmFm
Li41MTNkZDg0NTY5NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMK
QEAgLTE3MjgsNyArMTcyOCw3IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiAJciA9IHR0bV9ib19kZXZpY2VfaW5pdCgmYWRldi0+bW1hbi5iZGV2LAog
CQkJICAgICAgICZhbWRncHVfYm9fZHJpdmVyLAogCQkJICAgICAgIGFkZXYtPmRkZXYtPmFub25f
aW5vZGUtPmlfbWFwcGluZywKLQkJCSAgICAgICBOVUxMLAorCQkJICAgICAgIGFkZXYtPmRkZXYt
PnZtYV9vZmZzZXRfbWFuYWdlciwKIAkJCSAgICAgICBhZGV2LT5uZWVkX2RtYTMyKTsKIAlpZiAo
cikgewogCQlEUk1fRVJST1IoImZhaWxlZCBpbml0aWFsaXppbmcgYnVmZmVyIG9iamVjdCBkcml2
ZXIoJWQpLlxuIiwgcik7Ci0tIAoyLjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
