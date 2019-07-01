Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6955BD80
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jul 2019 16:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD5D89AE6;
	Mon,  1 Jul 2019 14:00:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1D089AE6
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jul 2019 14:00:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so11052586qkl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jul 2019 07:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnYsj1UnxPYIo7ApPHP9M/p3J6ZDA7t9p1WLsWUrkls=;
 b=VnRFlyKmspW3IOMMq0CStBcVPA5g85BeTr6DYJRrPN/6E6EHkMCnzZgTV8+/qihB0O
 3tFOVDkhQvv9SPF5gfehEo/VORAdi0EMk8xUi4n00ZrFG7YNe1xnbp3w9keHW2t+ve9S
 3dYmTNhBpFtx4L9ZYmU61MEuIGKGAVAwQDxO7DacmsgIMcmGqoA3ZYU/XEcfPp7LCxrA
 eUGbOyyFKM51L+xzfQpxUgyto/ZRQcs/imYSZ5/QPr2xDQNX1/a0Gxva8uxNmhCqlqOC
 rli6PyWgX5+jOMCACMwC/xlnwVhsBwsdTpkyRcmyDpsf6TImvSeJfL9ekxj70mDMUnQW
 y81w==
X-Gm-Message-State: APjAAAW0NUeqPMSd2jjwlR9Ur3KVyOJv5cVN9piWFcOgpgjI+pci61vR
 waO7VgALvRqqJKOudsPFWDnO4rLA21U=
X-Google-Smtp-Source: APXvYqzXCd+giUtQUDSTBuk1K2GomKU1LhWcm7FdLSBWcrvL4hjxAGuN4bcSYK2TWhI/T3y7VT5stA==
X-Received: by 2002:a37:4c92:: with SMTP id
 z140mr20588201qka.245.1561989629034; 
 Mon, 01 Jul 2019 07:00:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id 18sm4883297qke.131.2019.07.01.07.00.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 07:00:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/gfx10: use reset default for PA_SC_FIFO_SIZE
Date: Mon,  1 Jul 2019 09:00:19 -0500
Message-Id: <20190701140019.9881-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701140019.9881-1-alexander.deucher@amd.com>
References: <20190701140019.9881-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xnYsj1UnxPYIo7ApPHP9M/p3J6ZDA7t9p1WLsWUrkls=;
 b=OlNpi/QrxOwXswgFeSmQRN0Uj/Bqn+2Myag7gPw/r2izwQzeZOSLYQxcSV5CqrySU+
 XMwjFFy4/8LpKxbQzYBujLdPtWtAFMgnUkMJEQNpnQaoR70vB8g10A2R892sLNf4kgbu
 /A34moCRgKN1QwXkBJd53YNik88e7iBIiQDghNLQHHCICZ8rPo238nxfEjNTvcu1glio
 nyY+iM3Q5q4+jJpTnbGZ2gLQnNif7wpttio72WdKUjOBQ9sF32V94UnSvTVEqOvIToF5
 DS4ZQQpouSKrxPTTh1v2ELeS9hmc9UIG84oKYClDjfJ1UsXSFRe3zbNSOkYYWh1BHXdw
 HwEQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVjb21tZW5kZWQgYnkgdGhlIGh3IHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4
IDI5MzJhZGU3ZGJkMC4uY2NkNWE0OTY4YTYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYwpAQCAtMTU0NCwyNCArMTU0NCw2IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9j
b25zdGFudHNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCWdmeF92MTBfMF9p
bml0X2NvbXB1dGVfdm1pZChhZGV2KTsKIAotCW11dGV4X2xvY2soJmFkZXYtPmdyYm1faWR4X211
dGV4KTsKLQkvKgotCSAqIG1ha2luZyBzdXJlIHRoYXQgdGhlIGZvbGxvd2luZyByZWdpc3RlciB3
cml0ZXMgd2lsbCBiZSBicm9hZGNhc3RlZAotCSAqIHRvIGFsbCB0aGUgc2hhZGVycwotCSAqLwot
CWdmeF92MTBfMF9zZWxlY3Rfc2Vfc2goYWRldiwgMHhmZmZmZmZmZiwgMHhmZmZmZmZmZiwgMHhm
ZmZmZmZmZik7Ci0KLQl0bXAgPSBSRUdfU0VUX0ZJRUxEKDAsIFBBX1NDX0ZJRk9fU0laRSwgU0Nf
RlJPTlRFTkRfUFJJTV9GSUZPX1NJWkUsCi0JCQkgICAgYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmlt
X2ZpZm9fc2l6ZV9mcm9udGVuZCk7Ci0JdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIFBBX1NDX0ZJ
Rk9fU0laRSwgU0NfQkFDS0VORF9QUklNX0ZJRk9fU0laRSwKLQkJCSAgICBhZGV2LT5nZnguY29u
ZmlnLnNjX3ByaW1fZmlmb19zaXplX2JhY2tlbmQpOwotCXRtcCA9IFJFR19TRVRfRklFTEQodG1w
LCBQQV9TQ19GSUZPX1NJWkUsIFNDX0hJWl9USUxFX0ZJRk9fU0laRSwKLQkJCSAgICBhZGV2LT5n
ZnguY29uZmlnLnNjX2hpel90aWxlX2ZpZm9fc2l6ZSk7Ci0JdG1wID0gUkVHX1NFVF9GSUVMRCh0
bXAsIFBBX1NDX0ZJRk9fU0laRSwgU0NfRUFSTFlaX1RJTEVfRklGT19TSVpFLAotCQkJICAgIGFk
ZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3RpbGVfZmlmb19zaXplKTsKLQlXUkVHMzJfU09DMTUo
R0MsIDAsIG1tUEFfU0NfRklGT19TSVpFLCB0bXApOwotCi0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5n
cmJtX2lkeF9tdXRleCk7CiB9CiAKIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9lbmFibGVfZ3VpX2lk
bGVfaW50ZXJydXB0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
