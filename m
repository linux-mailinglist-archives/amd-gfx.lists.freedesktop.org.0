Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC269E28
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A61F89F2E;
	Mon, 15 Jul 2019 21:25:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4223F89EFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:32 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so12827971qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2QNk6EU0WzIbtaYecyI/chS1y/lGFIU454Xwb0+rpo=;
 b=C3tb5WaB9MPwK7mwC8wvnRIraboQKDhN3Rn+RzEkiZ6ps4d25Iez5WSq8D5EdyX48t
 ybLiMmyaJiwLM8KB0r6b83wYAH73o/ShMB1/qIzaudJNUHLgOwdH5jAALaGnN2IGdHaA
 QC1+9MVEwDOVkC4ot2f4CWvJMLRQWMHNvDL8pBmba7WuB8ptlUbaqLWqYZ3rTapaGgOl
 ndb9VjlO9YYt8EAduiWVMTooHeXnG5KSspeCiN645binhAPd8pKmruD52ofKjKs92dWc
 VLPJWcyLFQf9mtahVEiLIfcGh7cSRixM8Zdre8t7awlKuO7GgQDH/CWkuhjhLB76tCgz
 cVew==
X-Gm-Message-State: APjAAAXaacM66e+AfYnWC6LH42UFsR6p0S1cxmMtmPGIVUwVinxjJ7Gs
 QhIv/q+mn4vv7irC7x9AzGA6VnOq
X-Google-Smtp-Source: APXvYqxFiwLDvYOokdFeaou5D0Ub0legg5r3woN1Ku4a80BI/yQGR9ZWFGLORkhogZh9J+0ID7OLKw==
X-Received: by 2002:a37:a388:: with SMTP id
 m130mr19388337qke.250.1563225931222; 
 Mon, 15 Jul 2019 14:25:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 052/102] drm/amdgpu: Hack xgmi topology info when there is no
 psp fw
Date: Mon, 15 Jul 2019 16:23:47 -0500
Message-Id: <20190715212437.31793-50-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2QNk6EU0WzIbtaYecyI/chS1y/lGFIU454Xwb0+rpo=;
 b=cH8i5CatWS4RUMUvpmyKsifBrmfVmKPkziys4i0GNd2wrzvLiyfBCAt858AJeOe1fM
 r4CGvYVZxuKAsY1JplfZFIRhqVg30tU4tcgyRQPddnIoezel+2+caAB58ppRyATZlQam
 kvUqso7obQAbK5jrtLc0EGoFUxjv6m6Lcij/5WNMF4taRQ+vITg80RroLJpxaLAjWkf6
 x9F0iFZQr5dsusec2dtspa3mwJrv+/+qxNNupKm7kS8TEsty25q/WIrOQsWJrR/H0f5/
 NOMXDDOa4tx82oY2RAZkZhJOvDUAN4r2bbdFlzndfvJRDxhUiWw6pHgF4sOUNiR8CPFw
 lsYw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpUaGlzIGlzIG9ubHkgbmVlZGVkIG9u
IGVtdWxhdGlvbiBwbGF0Zm9ybSB3aGVyZSBwc3AgZncgbWlnaHQKbm90IGJlIGF2YWlsYWJsZSwg
dG8gaGFjayB4Z21pIHRvcG9sb2d5IGluZm8gc3VjaCBhcyBoaXZlIGlkIGFuZApub2RlIGlkLgoK
djI6IEFkZCBvZmZzZXQgdG8gaGFja2VkIGhpdmUvbm9kZSBpZAp2MzogRG9uJ3QgdXNlIGludHJv
ZHVjZSBuZXcgbW9kdWxlIHBhcmFtZXRlci4KClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsu
WmVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3hnbWkuYyB8
IDI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV94Z21pLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
eGdtaS5jCmluZGV4IGQxMWViYTA5ZWFkZC4uYjAyNDA3MGFkMWNmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfeGdtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV94Z21pLmMKQEAgLTMwMSwxOCArMzAxLDIzIEBAIGludCBhbWRn
cHVfeGdtaV9hZGRfZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmICghYWRl
di0+Z21jLnhnbWkuc3VwcG9ydGVkKQogCQlyZXR1cm4gMDsKIAotCXJldCA9IHBzcF94Z21pX2dl
dF9ub2RlX2lkKCZhZGV2LT5wc3AsICZhZGV2LT5nbWMueGdtaS5ub2RlX2lkKTsKLQlpZiAocmV0
KSB7Ci0JCWRldl9lcnIoYWRldi0+ZGV2LAotCQkJIlhHTUk6IEZhaWxlZCB0byBnZXQgbm9kZSBp
ZFxuIik7Ci0JCXJldHVybiByZXQ7Ci0JfQorCWlmIChhbWRncHVfZGV2aWNlX2lwX2dldF9pcF9i
bG9jayhhZGV2LCBBTURfSVBfQkxPQ0tfVFlQRV9QU1ApKSB7CisJCXJldCA9IHBzcF94Z21pX2dl
dF9oaXZlX2lkKCZhZGV2LT5wc3AsICZhZGV2LT5nbWMueGdtaS5oaXZlX2lkKTsKKwkJaWYgKHJl
dCkgeworCQkJZGV2X2VycihhZGV2LT5kZXYsCisJCQkJIlhHTUk6IEZhaWxlZCB0byBnZXQgaGl2
ZSBpZFxuIik7CisJCQlyZXR1cm4gcmV0OworCQl9CiAKLQlyZXQgPSBwc3BfeGdtaV9nZXRfaGl2
ZV9pZCgmYWRldi0+cHNwLCAmYWRldi0+Z21jLnhnbWkuaGl2ZV9pZCk7Ci0JaWYgKHJldCkgewot
CQlkZXZfZXJyKGFkZXYtPmRldiwKLQkJCSJYR01JOiBGYWlsZWQgdG8gZ2V0IGhpdmUgaWRcbiIp
OwotCQlyZXR1cm4gcmV0OworCQlyZXQgPSBwc3BfeGdtaV9nZXRfbm9kZV9pZCgmYWRldi0+cHNw
LCAmYWRldi0+Z21jLnhnbWkubm9kZV9pZCk7CisJCWlmIChyZXQpIHsKKwkJCWRldl9lcnIoYWRl
di0+ZGV2LAorCQkJCSJYR01JOiBGYWlsZWQgdG8gZ2V0IG5vZGUgaWRcbiIpOworCQkJcmV0dXJu
IHJldDsKKwkJfQorCX0gZWxzZSB7CisJCWFkZXYtPmdtYy54Z21pLmhpdmVfaWQgPSAxNjsKKwkJ
YWRldi0+Z21jLnhnbWkubm9kZV9pZCA9IGFkZXYtPmdtYy54Z21pLnBoeXNpY2FsX25vZGVfaWQg
KyAxNjsKIAl9CiAKIAloaXZlID0gYW1kZ3B1X2dldF94Z21pX2hpdmUoYWRldiwgMSk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
