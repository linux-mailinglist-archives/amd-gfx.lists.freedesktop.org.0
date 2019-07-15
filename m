Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3AD69E44
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B841589FF6;
	Mon, 15 Jul 2019 21:26:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE2F89FDD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 201so12853763qkm.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6ic/7F3IIVQTPd/HqiNznz97h3t4bzRENgLFqy+nHw=;
 b=NhQMmIAmFd6Tvr79azctl3CrOi5ckbvwCVKmWlMWQtUyeJrMVKwdFJ3ZugpEUQk8eB
 KiJyxYH27twbeB7zuN0u1EXTiOJYQY0eQIlPviLfXvXIGYABbQxd8/nLZV5z1muRmLee
 vm9c38zUFYXJX6DfYQ6RqXuEq8QgYmbWx96V++s0NeWqL1OT5eN0HvgdduAei6jVUeiS
 3awRKLm9XqydaJnBYu8EpdYu0XTN4bBvs4xR7aLSQtYHVlvC6GC4ySd3g/jGe2t4GFod
 SJg+lOyelaxFbvSKIwsKzrX2iiYhLvpdsx0tPDv8+Jvx+9aJ0nlNUSTfMHwiY/+8xdNP
 7+xA==
X-Gm-Message-State: APjAAAUDI205GM8vWF5Ktc234CCsrNIkuNLUZyJOSdY3jazL5UAOh9rr
 7BtlZ6GzZuQhG17jRDww73TFOJkZ
X-Google-Smtp-Source: APXvYqyNd58YqtJ/Wun7kSjxiWTR5T3owT4ZlyRiE4FZQ4oYEgZR5arIWhmA2aGItK/HocGqQZQf/A==
X-Received: by 2002:a05:620a:11ba:: with SMTP id
 c26mr16722627qkk.201.1563225956741; 
 Mon, 15 Jul 2019 14:25:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 079/102] drm/amdgpu: add vcn nbio doorbell range setting for
 2nd vcn instance
Date: Mon, 15 Jul 2019 16:24:14 -0500
Message-Id: <20190715212437.31793-77-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6ic/7F3IIVQTPd/HqiNznz97h3t4bzRENgLFqy+nHw=;
 b=UM7l32opQyMAnbTyhEMa0GIQmHAlE3eBV3spa7pHWyU7DNVhpqMKuaqRfyUkFoIeQN
 3ob1vVWaOHpfDd+nebXSau8+ANOuaFZhS+g6z2RpeL7EI/SsTXRzHbAzmV4kr4h0fSqk
 HS2mQgOwM0gZ/nCr5vv7I4TO04iI0BwrUMzGpzEqtnUfeLVvBSSdjf80SmZw7oaIm0Ec
 wA33ivyuHhJosjKrgevYwdDwxHDsLTPQrBp+LmwitWtwiFC17p1rEvp7080Fv4MvpOuP
 K3zvO4wB2msygXZZxTpx5q9qASbO8K++1LXrgCOoyBP09/RsQsvnVt80EFpaQhC4QDVW
 LmDg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KCmFkZCB2Y24gbmJpbyBkb29yYmVs
bCByYW5nZSBzZXR0aW5nIGZvciAybmQgdmNuIGluc3RhbmNlCgpTaWduZWQtb2ZmLWJ5OiBKYW1l
cyBaaHUgPEphbWVzLlpodUBhbWQuY29tPgpSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVvLmxpdUBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgfCAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192Ml8zLmMgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMgfCAyMCArKysrKysrKysrKysrKysrKy0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyAgfCAgMiArLQogNSBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgKaW5kZXggZTljMzg2Y2VjMmFkLi40YjUxNGE0NDE4NGMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC02NzcsNyArNjc3LDcgQEAgc3RydWN0IGFtZGdwdV9uYmlv
X2Z1bmNzIHsKIAl2b2lkICgqc2RtYV9kb29yYmVsbF9yYW5nZSkoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYsIGludCBpbnN0YW5jZSwKIAkJCWJvb2wgdXNlX2Rvb3JiZWxsLCBpbnQgZG9vcmJl
bGxfaW5kZXgsIGludCBkb29yYmVsbF9zaXplKTsKIAl2b2lkICgqdmNuX2Rvb3JiZWxsX3Jhbmdl
KShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCB1c2VfZG9vcmJlbGwsCi0JCQlpbnQg
ZG9vcmJlbGxfaW5kZXgpOworCQkJCSAgIGludCBkb29yYmVsbF9pbmRleCwgaW50IGluc3RhbmNl
KTsKIAl2b2lkICgqZW5hYmxlX2Rvb3JiZWxsX2FwZXJ0dXJlKShzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAkJCQkJIGJvb2wgZW5hYmxlKTsKIAl2b2lkICgqZW5hYmxlX2Rvb3JiZWxsX3Nl
bGZyaW5nX2FwZXJ0dXJlKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbmJpb192Ml8zLmMKaW5kZXggNzJlZmUzMmYyNDA2Li5mNTYxMWM0NzllMjgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9fdjJfMy5jCkBAIC05Miw3ICs5Miw3IEBA
IHN0YXRpYyB2b2lkIG5iaW9fdjJfM19zZG1hX2Rvb3JiZWxsX3JhbmdlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBpbnQgaW5zdGFuCiB9CiAKIHN0YXRpYyB2b2lkIG5iaW9fdjJfM192Y25f
ZG9vcmJlbGxfcmFuZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgdXNlX2Rvb3Ji
ZWxsLAotCQkJCQkgaW50IGRvb3JiZWxsX2luZGV4KQorCQkJCQkgaW50IGRvb3JiZWxsX2luZGV4
LCBpbnQgaW5zdGFuY2UpCiB7CiAJdTMyIHJlZyA9IFNPQzE1X1JFR19PRkZTRVQoTkJJTywgMCwg
bW1CSUZfTU1TQ0gwX0RPT1JCRUxMX1JBTkdFKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
YmlvX3Y3XzQuYwppbmRleCBkOGM5OTcyYTMxNWIuLjkxMGZmZmNlZDQzYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMKQEAgLTQyLDYgKzQyLDE0IEBACiAjZGVmaW5lIEdQ
VV9IRFBfRkxVU0hfRE9ORV9fUlNWRF9FTkc0X01BU0sJMHgwMDAxMDAwMEwKICNkZWZpbmUgR1BV
X0hEUF9GTFVTSF9ET05FX19SU1ZEX0VORzVfTUFTSwkweDAwMDIwMDAwTAogCisjZGVmaW5lIG1t
QklGX01NU0NIMV9ET09SQkVMTF9SQU5HRSAgICAgICAgICAgICAgICAgICAgIDB4MDFkYworI2Rl
ZmluZSBtbUJJRl9NTVNDSDFfRE9PUkJFTExfUkFOR0VfQkFTRV9JRFggICAgICAgICAgICAyCisv
L0JJRl9NTVNDSDFfRE9PUkJFTExfUkFOR0UKKyNkZWZpbmUgQklGX01NU0NIMV9ET09SQkVMTF9S
QU5HRV9fT0ZGU0VUX19TSElGVCAgICAgICAgMHgyCisjZGVmaW5lIEJJRl9NTVNDSDFfRE9PUkJF
TExfUkFOR0VfX1NJWkVfX1NISUZUICAgICAgICAgIDB4MTAKKyNkZWZpbmUgQklGX01NU0NIMV9E
T09SQkVMTF9SQU5HRV9fT0ZGU0VUX01BU0sgICAgICAgICAgMHgwMDAwMEZGQ0wKKyNkZWZpbmUg
QklGX01NU0NIMV9ET09SQkVMTF9SQU5HRV9fU0laRV9NQVNLICAgICAgICAgICAgMHgwMDFGMDAw
MEwKKwogc3RhdGljIHZvaWQgbmJpb192N180X3JlbWFwX2hkcF9yZWdpc3RlcnMoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJV1JFRzMyX1NPQzE1KE5CSU8sIDAsIG1tUkVNQVBfSERQ
X01FTV9GTFVTSF9DTlRMLApAQCAtMTE1LDExICsxMjMsMTcgQEAgc3RhdGljIHZvaWQgbmJpb192
N180X3NkbWFfZG9vcmJlbGxfcmFuZ2Uoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBp
bnN0YW4KIH0KIAogc3RhdGljIHZvaWQgbmJpb192N180X3Zjbl9kb29yYmVsbF9yYW5nZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCB1c2VfZG9vcmJlbGwsCi0JCQkJCSBpbnQgZG9v
cmJlbGxfaW5kZXgpCisJCQkJCSBpbnQgZG9vcmJlbGxfaW5kZXgsIGludCBpbnN0YW5jZSkKIHsK
LQl1MzIgcmVnID0gU09DMTVfUkVHX09GRlNFVChOQklPLCAwLCBtbUJJRl9NTVNDSDBfRE9PUkJF
TExfUkFOR0UpOworCXUzMiByZWc7CisJdTMyIGRvb3JiZWxsX3JhbmdlOworCisJaWYgKGluc3Rh
bmNlKQorCQlyZWcgPSBTT0MxNV9SRUdfT0ZGU0VUKE5CSU8sIDAsIG1tQklGX01NU0NIMV9ET09S
QkVMTF9SQU5HRSk7CisJZWxzZQorCQlyZWcgPSBTT0MxNV9SRUdfT0ZGU0VUKE5CSU8sIDAsIG1t
QklGX01NU0NIMF9ET09SQkVMTF9SQU5HRSk7CiAKLQl1MzIgZG9vcmJlbGxfcmFuZ2UgPSBSUkVH
MzIocmVnKTsKKwlkb29yYmVsbF9yYW5nZSA9IFJSRUczMihyZWcpOwogCiAJaWYgKHVzZV9kb29y
YmVsbCkgewogCQlkb29yYmVsbF9yYW5nZSA9IFJFR19TRVRfRklFTEQoZG9vcmJlbGxfcmFuZ2Us
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwppbmRleCA1MmE1ZTNhYzlmNTUuLjJi
N2JiNjM2NGU1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCkBAIC0yNDUs
NyArMjQ1LDcgQEAgc3RhdGljIGludCB2Y25fdjJfMF9od19pbml0KHZvaWQgKmhhbmRsZSkKIAlp
bnQgaSwgcjsKIAogCWFkZXYtPm5iaW9fZnVuY3MtPnZjbl9kb29yYmVsbF9yYW5nZShhZGV2LCBy
aW5nLT51c2VfZG9vcmJlbGwsCi0JCXJpbmctPmRvb3JiZWxsX2luZGV4KTsKKwkJCQkJICAgICBy
aW5nLT5kb29yYmVsbF9pbmRleCwgMCk7CiAKIAlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7CiAJ
ciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfNS5jCmluZGV4IDg0MDczN2RmMTljMC4uNzVmZGI2ODgxYWMwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKQEAgLTIxMiw3ICsyMTIsNyBAQCBzdGF0aWMgaW50IHZj
bl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQogCWludCBpLCByOwogCiAJYWRldi0+bmJpb19m
dW5jcy0+dmNuX2Rvb3JiZWxsX3JhbmdlKGFkZXYsIHJpbmctPnVzZV9kb29yYmVsbCwKLQkJcmlu
Zy0+ZG9vcmJlbGxfaW5kZXgpOworCQkJCQkgICAgIHJpbmctPmRvb3JiZWxsX2luZGV4LCAwKTsK
IAogCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7CiAJaWYgKHIpIHsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
