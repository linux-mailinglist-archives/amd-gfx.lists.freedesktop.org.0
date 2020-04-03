Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499919D9FA
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Apr 2020 17:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB706E159;
	Fri,  3 Apr 2020 15:21:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2A06E159
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Apr 2020 15:21:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d77so7550784wmd.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 03 Apr 2020 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EfXCOuTLg1+MluS/N/oSWoIlYQttdhidQaMCI2QdZrE=;
 b=QQmrV83s9Ddz8Q1SdmQP76ctDYo8k2g3AYeSLQVW2X+gMPJWZ/NaL9s0DlWhA5nE+V
 aW6r6pWmilmqQu0JRJ3rRk7BpCXLKZILqG9lf7/w36OR8WKAA3fAGC3YDa5dPOsOkaa8
 Yx1qxONGWexOhnsgTMiEVA7iPL9dfEzkwjxtnd5ejOjUKPlqNlZk/5b4bcWw9TWxircd
 8lwnwnFoJrJNfS2NoTqs7jjT7K4IbCVVt6nlIbPiipgihP4ICcJkya+GzqYorSN1pWLP
 x3RnP1OAN5SB3fOBcAuGw3Y/UfAi+ktBPe7Adm5aHM3iT8mR6KwJxWO4hktPtkB97kbv
 jypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EfXCOuTLg1+MluS/N/oSWoIlYQttdhidQaMCI2QdZrE=;
 b=ReOZK7i2hnQ2aHb1h805ITAr3dYiJSwMBdGhbOkMMIBZwHsHBMQSOAiyUe3ioa9axi
 LGpidZwGckTW6Beg5pu60rGNDqEcQ6o8A0QGzPVc7VZ4Mj1wcGRRl6THbV1cFF5Vq0Nz
 PKZyvkoiMA8svK197XkSW3I/iXgMxhLV9xbfjqLXNb6TO5tuwXmdkKCO6YTCHKvxSHDc
 fFXHmfiAnhl4ZzaABGmeArOwW2lm24lpcMTmQxt9ZEdccPaeA7P1qRNZPzvBroKkOLni
 SPk+YelxNpOSG3r0eJBN/bCTOh/9Fp4JKOjLCf76IqeoSLxEiyB+9aDD+S5pKOgr3nX0
 aLGA==
X-Gm-Message-State: AGi0PuZb9su6RK0nOVHKl8PHtJ68rAZ0LBrYvfg+8P6P8ek3NhgkBPIE
 wy6JgLOpg9XDJroYntcQF3ojwKQq
X-Google-Smtp-Source: APiQypIPrjAad39CGK1eJ0HKXBU102/a00qb3dl82pUhVjr21GtGrwa9JYzEibimcMjEntxx5dFhUA==
X-Received: by 2002:a1c:2d10:: with SMTP id t16mr6503026wmt.155.1585927308362; 
 Fri, 03 Apr 2020 08:21:48 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7478:da75:f9d6:e948])
 by smtp.gmail.com with ESMTPSA id 138sm11774900wmb.21.2020.04.03.08.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 08:21:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: fix size calculation in amdgpu_ttm_copy_mem_to_mem
Date: Fri,  3 Apr 2020 17:21:47 +0200
Message-Id: <20200403152147.1485-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Felix.Kuehling@amd.com, Candice.Li@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiB0aGUgbm9kZSBpcyBsYXJnZXIgdGhhbiA0R0Igd2Ugb3ZlcnJ1biB0aGUgc2l6ZSBjYWxj
dWxhdGlvbi4KCkZpeCB0aGlzIGJ5IGNvcnJlY3RseSBsaW1pdGluZyB0aGUgc2l6ZSB0byB0aGUg
d2luZG93IGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4IDAy
OWI2NjFmYWVmNi4uMWI2NThlOTA1NjIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCkBAIC00NTQsOSArNDU0LDkgQEAgaW50IGFtZGdwdV90dG1fY29weV9tZW1fdG9f
bWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkvKiBDb3B5IHNpemUgY2Fubm90IGV4
Y2VlZCBHVFRfTUFYX0JZVEVTLiBTbyBpZiBzcmMgb3IgZHN0CiAJCSAqIGJlZ2lucyBhdCBhbiBv
ZmZzZXQsIHRoZW4gYWRqdXN0IHRoZSBzaXplIGFjY29yZGluZ2x5CiAJCSAqLwotCQljdXJfc2l6
ZSA9IG1pbjMoc3JjX25vZGVfc2l6ZSwgZHN0X25vZGVfc2l6ZSwgc2l6ZSk7Ci0JCWN1cl9zaXpl
ID0gbWluKEdUVF9NQVhfQllURVMgLSBzcmNfcGFnZV9vZmZzZXQsIGN1cl9zaXplKTsKLQkJY3Vy
X3NpemUgPSBtaW4oR1RUX01BWF9CWVRFUyAtIGRzdF9wYWdlX29mZnNldCwgY3VyX3NpemUpOwor
CQljdXJfc2l6ZSA9IG1heChzcmNfcGFnZV9vZmZzZXQsIGRzdF9wYWdlX29mZnNldCk7CisJCWN1
cl9zaXplID0gbWluKG1pbjMoc3JjX25vZGVfc2l6ZSwgZHN0X25vZGVfc2l6ZSwgc2l6ZSksCisJ
CQkgICAgICAgKHVpbnQ2NF90KShHVFRfTUFYX0JZVEVTIC0gY3VyX3NpemUpKTsKIAogCQkvKiBN
YXAgc3JjIHRvIHdpbmRvdyAwIGFuZCBkc3QgdG8gd2luZG93IDEuICovCiAJCXIgPSBhbWRncHVf
dHRtX21hcF9idWZmZXIoc3JjLT5ibywgc3JjLT5tZW0sIHNyY19tbSwKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
