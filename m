Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF19B296ED0
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Oct 2020 14:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C66E591;
	Fri, 23 Oct 2020 12:22:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983D6E575
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q5so1305382wmq.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PXR6++RRL9LARYV7LHJfxiTuXc7gp0ylfY0jpRLccnk=;
 b=GOpMVLRDSJhBIUH0Jl9RpNU7ca62jsa/0uF4vz52hy/l0Nb7bHFlNFX95AMzOO9A7g
 kFor3nekCRKiDob6YYYrBsijgmi8v2hST44iXnT7fzAasthUs8V+fGhsJqV+ZTfOhaUH
 GR9QGDBC7vCZ36wK45YiK3pyokqCw8S0lhdgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXR6++RRL9LARYV7LHJfxiTuXc7gp0ylfY0jpRLccnk=;
 b=e4Fr3YOYIN0HCXT5URjpyWWOXCcaR5lmu+CZtRGu7oR+Ed+PDr/j70MFdKnZXCuivz
 y7ZRNjroP9Uzv+FwoPt2/B7QwNqFd39rH9KPSvOmc5GhazocMVdeUmnYqEU0jSx1el5C
 XB/ckfdKwXLHJ45J1ynrsFQWFZI70EZRwfxNnI0JuwlF/kUCAy/yjVcbDkFmJIOFnyYE
 1LJyyWwvo7iUpHzpplIUGrZT+9sjeorsLHhCWf1x/hyzxZDFh8SKj7ADPP20m+UIGizV
 NsfbxTWbKCrGtlA8csb6WxdoM/CXSRz5dYEwwqyNYwS8W7W3G1jpCc+OiraTIpayJfdL
 EW3Q==
X-Gm-Message-State: AOAM533/c7HJyDEqtk2ATrQKsZMG2ns0eCqwC29jTH7GaWuvSY6WOi3y
 U9POkArHPU6ne8hgslE6RMUB6g==
X-Google-Smtp-Source: ABdhPJxJctwHHwXLpK/i827ZMfpLrwvrm04VWkzSg+J1vZd4u3wLfW88Tc9LRut5cVMvDGZpg74J1g==
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr2135356wmj.126.1603455768671; 
 Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:48 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/65] drm/i915: Annotate dma_fence_work
Date: Fri, 23 Oct 2020 14:21:34 +0200
Message-Id: <20201023122216.2373294-23-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aTkxNSBkb2VzIHRvbnMgb2YgYWxsb2NhdGlvbnMgZnJvbSB0aGlzIHdvcmtlciwgd2hpY2ggbG9j
a2RlcCBjYXRjaGVzLgoKQWxzbyBnZW5lcmljIGluZnJhc3RydWN0dXJlIGxpa2UgdGhpcyB3aXRo
IGJpZyBwb3RlbnRpYWwgZm9yIGhvdwpkbWFfZmVuY2Ugb3Igb3RoZXIgY3Jvc3MgZHJpdmVyIGNv
bnRyYWN0cyB3b3JrLCByZWFsbHkgc2hvdWxkIGJlCnJldmlld2VkIG9uIGRyaS1kZXZlbC4gSW1w
bGVtZW50aW5nIGN1c3RvbSB3aGVlbHMgZm9yIGV2ZXJ5dGhpbmcKd2l0aGluIHRoZSBkcml2ZXIg
aXMgYSBjbGFzc2ljIGNhc2Ugb2YgInBsYXRmb3JtIHByb2JsZW0iIFsxXS4gV2hpY2ggaW4KdXBz
dHJlYW0gd2UgcmVhbGx5IHNob3VsZG4ndCBoYXZlLgoKU2luY2UgdGhlcmUncyBubyBxdWljayB3
YXkgdG8gc29sdmUgdGhlc2Ugc3BsYXRzIChkbWFfZmVuY2Vfd29yayBpcwp1c2VkIGEgYnVuY2gg
aW4gYmFzaWMgYnVmZmVyIG1hbmFnZW1lbnQgYW5kIGNvbW1hbmQgc3VibWlzc2lvbikgbGlrZQpm
b3IgYW1kZ3B1LCBJJ20gZ2l2aW5nIHVwIGF0IHRoaXMgcG9pbnQgaGVyZS4gQW5ub3RhdGluZyBp
OTE1CnNjaGVkdWxlciBhbmQgZ3B1IHJlc2V0IGNvdWxkIHdvdWxkIGJlIGludGVyZXN0aW5nLCBi
dXQgc2luY2UgbG9ja2RlcAppcyBvbmUtc2hvdCB3ZSBjYW4ndCBzZWUgd2hhdCBzdXJwcmlzZXMg
d291bGQgbHVyayB0aGVyZS4KCjE6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy80NDM1MzEvCkNj
OiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGlu
YXJvLm9yZwpDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfc3dfZmVuY2Vfd29yay5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2ZlbmNlX3dvcmsu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfc3dfZmVuY2Vfd29yay5jCmluZGV4IGEzYTgx
YmI4ZjJjMy4uNWI3NGFjYWRhZWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3N3X2ZlbmNlX3dvcmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N3X2Zl
bmNlX3dvcmsuYwpAQCAtMTcsMTIgKzE3LDE1IEBAIHN0YXRpYyB2b2lkIGZlbmNlX3dvcmsoc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQogewogCXN0cnVjdCBkbWFfZmVuY2Vfd29yayAqZiA9IGNv
bnRhaW5lcl9vZih3b3JrLCB0eXBlb2YoKmYpLCB3b3JrKTsKIAlpbnQgZXJyOworCWJvb2wgZmVu
Y2VfY29va2llOwogCisJZmVuY2VfY29va2llID0gZG1hX2ZlbmNlX2JlZ2luX3NpZ25hbGxpbmco
KTsKIAllcnIgPSBmLT5vcHMtPndvcmsoZik7CiAJaWYgKGVycikKIAkJZG1hX2ZlbmNlX3NldF9l
cnJvcigmZi0+ZG1hLCBlcnIpOwogCiAJZmVuY2VfY29tcGxldGUoZik7CisJZG1hX2ZlbmNlX2Vu
ZF9zaWduYWxsaW5nKGZlbmNlX2Nvb2tpZSk7CiAJZG1hX2ZlbmNlX3B1dCgmZi0+ZG1hKTsKIH0K
IAotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
