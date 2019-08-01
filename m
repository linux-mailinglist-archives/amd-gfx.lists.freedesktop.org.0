Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB27E382
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713136E79B;
	Thu,  1 Aug 2019 19:50:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF28A6E79B
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:50:56 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x22so66611610qtp.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZ+DE6vvTvcVqwcGRDNKCW0Sh/OHxlfGjSegTGqCEUs=;
 b=lzfpN5T5/AU6G2Ztbt13K1jZyY3JNZGWyowISzZ8UXJa3j13XF7L82BUKP9tVFQMgE
 elf7PicXXEEMrqAyTP4SlmPrWCsTAH7BkdFv7R+0vY8GO4bxlbxhhc9HPqapeQAeoZg4
 FJIQTxz1+cueVvCvonxIe8YZjZ+DtMgxHqI+4yGq0RBSWZeF6i6VX+Dx8F5FzcixKDRd
 BQT8AQ88ACgdncffhdRs5fIGMrdZW7nd87YNHx6LTI9o8rsmAo8K1aDlGzlAei4fnVWF
 Q6IUxAyXsMSAQeEQIZfJ9nJwFPE7WwUVMCHVzQejFbhlQqQJLbUeLx8UaKRWpbw/BXQc
 iXgQ==
X-Gm-Message-State: APjAAAWwaxNBbu6UbmNq6LIIbaAph52uE+U4+uQRc85bB4DP60fzNJQR
 z3cLJbio0/dAvpstHKX69ewmCaD/
X-Google-Smtp-Source: APXvYqz5HpJPeosuzZOCKE8PRYPHK6o/1Sh5YCljbXRxSPbBk7JcaKHBos6TWOBdqoLzio2DqWK+Cg==
X-Received: by 2002:a0c:adef:: with SMTP id x44mr94152368qvc.153.1564689055845; 
 Thu, 01 Aug 2019 12:50:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id f26sm39941602qtf.44.2019.08.01.12.50.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 12:50:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/amdgpu: disable MEC2 JT context init for Arcturus
Date: Thu,  1 Aug 2019 14:50:42 -0500
Message-Id: <20190801195044.10331-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801195044.10331-1-alexander.deucher@amd.com>
References: <20190801195044.10331-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZ+DE6vvTvcVqwcGRDNKCW0Sh/OHxlfGjSegTGqCEUs=;
 b=MK4aZgZtwcA4ui7g1TsaO01LS8z+IVSICwD5h4QQu3e8SS9KVGpd7AZdYHTDnMmUcy
 qROQh3BxInK5+bMJQ3f4G8UbmMJPVRIdBs+aAX6TWA+2kF84pGOseqZP0fjmKcG0Ijy3
 1QhgGp8V1nPXDXL5x3080FKc9/XfmMPcfzLqDaktaDT8prnzI0H1mhXp9vCTTf9iGl2f
 9us/v5rW3sKrszt3ZMiR2rrXjYw7+VW885QAI5ECcM+U8mXexUyTyzSDri0e2xNX/dq3
 d0KqLmwhdgOpKpOtAARCqXtwNqALK0drqL3wWA9pedphtgGT8cOV5XNeqD/ReWT9ZRQL
 85+w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBDbGVtZW50cyA8Sm9obi5DbGVtZW50c0BhbWQuY29tPgoKV2UgZG9uJ3QgbmVl
ZCB0byBoYW5kbGUgaXQgbGlrZSBvdGhlciBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IEpvaG4gQ2xl
bWVudHMgPGpvaG4uY2xlbWVudHNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMgfCAxNiArKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAu
YwppbmRleCAxMjBmNTRmZWVjZDYuLjE5Yzc0NmI3NzAwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jCkBAIC0xMjgyLDExICsxMjgyLDE3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5
XzBfaW5pdF9jcF9jb21wdXRlX21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJCWNwX2hkciA9IChjb25zdCBzdHJ1Y3QgZ2Z4X2Zpcm13YXJlX2hlYWRlcl92MV8wICopaW5m
by0+ZnctPmRhdGE7CiAJCQlhZGV2LT5maXJtd2FyZS5md19zaXplICs9CiAJCQkJQUxJR04obGUz
Ml90b19jcHUoaGVhZGVyLT51Y29kZV9zaXplX2J5dGVzKSAtIGxlMzJfdG9fY3B1KGNwX2hkci0+
anRfc2l6ZSkgKiA0LCBQQUdFX1NJWkUpOwotCQkJaW5mbyA9ICZhZGV2LT5maXJtd2FyZS51Y29k
ZVtBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9KVF07Ci0JCQlpbmZvLT51Y29kZV9pZCA9IEFNREdQ
VV9VQ09ERV9JRF9DUF9NRUMyX0pUOwotCQkJaW5mby0+ZncgPSBhZGV2LT5nZngubWVjMl9mdzsK
LQkJCWFkZXYtPmZpcm13YXJlLmZ3X3NpemUgKz0KLQkJCQlBTElHTihsZTMyX3RvX2NwdShjcF9o
ZHItPmp0X3NpemUpICogNCwgUEFHRV9TSVpFKTsKKworCQkJLyogVE9ETzogRGV0ZXJtaW5lIGlm
IE1FQzIgSlQgRlcgbG9hZGluZyBjYW4gYmUgcmVtb3ZlZAorCQkJCSBmb3IgYWxsIEdGWCBWOSBh
c2ljIGFuZCBhYm92ZSAqLworCQkJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0FSQ1RVUlVT
KSB7CisJCQkJaW5mbyA9ICZhZGV2LT5maXJtd2FyZS51Y29kZVtBTURHUFVfVUNPREVfSURfQ1Bf
TUVDMl9KVF07CisJCQkJaW5mby0+dWNvZGVfaWQgPSBBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9K
VDsKKwkJCQlpbmZvLT5mdyA9IGFkZXYtPmdmeC5tZWMyX2Z3OworCQkJCWFkZXYtPmZpcm13YXJl
LmZ3X3NpemUgKz0KKwkJCQkJQUxJR04obGUzMl90b19jcHUoY3BfaGRyLT5qdF9zaXplKSAqIDQs
CisJCQkJCVBBR0VfU0laRSk7CisJCQl9CiAJCX0KIAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
