Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625225D769
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01AF6E05C;
	Tue,  2 Jul 2019 20:29:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3266E059
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:20 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so20139272qto.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcCQlerUkik4IPCHWxNXwfC1+9m+WAoth6WBlGC2Esc=;
 b=ehySoYMNhaw58t3B1G1AzO8aGkDksrjutrSnp5MqqXdO56Y1LvAbghtJYXp1KDnP3C
 evvSz6M3c6pOnjUzmGQeu/M8uV2LttUUWmgVSbmiblwaX1sqqLI+IeTFZpTFY1nhX1Iq
 aNvUOen+mSDBGgWOtcHRkaV0r5J+TTn01rU/mOajujubIfYilWea62/JzsPg75aSbM4I
 ZJNs00zgOIkilRNQXX2yg6i6e5mwtlGLTYymRlkccRhXyL9vBwakeOrUxin86E0+u+th
 2BZn5rjyWGQzuVed8TUJ7cfmw7xMhKnLka/DmdlIJFoihSQHa63WVn3PdnQlolyJ2LXH
 Df0g==
X-Gm-Message-State: APjAAAWZ3FfC2cRzztz62fRO7TNLA6Ug58TWg/Vtf6QmF51ZqsDSywYQ
 vhgHIupmsTdyjjFc3xjoNjhDjB1dpgo=
X-Google-Smtp-Source: APXvYqyyLoP9NcGEBYGokAHakHGF79s9kbOiZ5bFfDDjHKNo2RvuPylfnvKLmAO+YNwGELJX3/pP0A==
X-Received: by 2002:aed:2a39:: with SMTP id c54mr27241264qtd.272.1562099358902; 
 Tue, 02 Jul 2019 13:29:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 26/53] drm/amdgpu/gfx10: fix programming of
 SC_HIZ_TILE_FIFO_SIZE field
Date: Tue,  2 Jul 2019 15:28:17 -0500
Message-Id: <20190702202844.17001-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gcCQlerUkik4IPCHWxNXwfC1+9m+WAoth6WBlGC2Esc=;
 b=IrwHqwQwc6hnncFNIztbkMS+J4N+3wrkjRW2dlsNVRjbq00mpzNxzNbwv620XfJAaZ
 qA/lSORFnTOSZYLKg+CnGMYJAnKfh1b6G7P/1jSfx+JlY1CWiau4jb58OzmWAr1tf+he
 GldwrBlRHjSCaZsuJUu21+HHhcvO+Y9bazP2FIn0Z/Tw0wb/QCdFaKCluU8Ssmfpjvi2
 tuRoIySk9HjrwT3odJuWh3/rHdy64BWStU+eVnWaQLC32pRcUJKlei1bxGPAXrtriA9o
 EtVAqfJ3QqdBwSVn/+G6rleuz+qtQO7rBqjgvhhF5VIPq8kptQ3tLCx4grXOlOw41Chk
 aZWQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCm1heCBmaWZvIHNpemUgaXMgMTI4
IGFuZCBQQV9TQ19GSUZPX1NJWkVbMjA6MTVdPVNDX0hJWl9USUxFX0ZJRk9fU0laRQpmaWVsZCBp
cyBwcm9ncmFtbWVkIGluIHVuaXRzIG9mIHR3byBlbnRyaWVzLCBidXQgNiBiaXRzIGlzIGluc3Vm
ZmljaWVudAp0byBob2xkIHZhbHVlIDEyOC8yID0gNjQsIHNvIHNldCB0aGlzIGZpZWxkIGFzIDAg
d2hpY2ggaXMgaW50ZXJwcmV0ZWQgYnkKdGhlIGhhcmR3YXJlIGFzIG1heGltdW0gcGh5c2ljYWwg
ZmlmbyBzaXplKDEyOCkuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVh
bkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpB
Y2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwpp
bmRleCAwNWQyNWE2ZjgwYzIuLjRjNDBmM2M2NTE2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKQEAgLTEwODksNyArMTA4OSw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBf
MF9ncHVfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJYWRldi0+Z2Z4
LmNvbmZpZy5tYXhfaHdfY29udGV4dHMgPSA4OwogCQlhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1f
Zmlmb19zaXplX2Zyb250ZW5kID0gMHgyMDsKIAkJYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmltX2Zp
Zm9fc2l6ZV9iYWNrZW5kID0gMHgxMDA7Ci0JCWFkZXYtPmdmeC5jb25maWcuc2NfaGl6X3RpbGVf
Zmlmb19zaXplID0gMHg4MDsKKwkJYWRldi0+Z2Z4LmNvbmZpZy5zY19oaXpfdGlsZV9maWZvX3Np
emUgPSAweDA7CiAJCWFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3RpbGVfZmlmb19zaXplID0g
MHg0QzA7CiAJCWdiX2FkZHJfY29uZmlnID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUdCX0FERFJf
Q09ORklHKTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
