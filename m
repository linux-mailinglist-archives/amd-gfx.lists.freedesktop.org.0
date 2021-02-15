Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7A931B838
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Feb 2021 12:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292826E135;
	Mon, 15 Feb 2021 11:43:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B36E135
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Feb 2021 11:43:39 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s11so7617464edd.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Feb 2021 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7y+IiK47s8M2zv0mav4uA/IU6GOwsfw1P1SqyYTSM4=;
 b=bN4dDQwvo1RKOu479OjsJXeDAsmaGLhFUdPPpheh4YCnfQRUBcuVjVahAfLmBZD1d9
 0ebwPjGX9qdJ2GUNkxF20fkbd/b85f02RMw1kinmD4GsvhGZLWMIyFNIPXOyEHApLPPc
 Mh9nQHzkZE6snjWplMJ1rxVrqtxhuTubd3oo9uRTKUF/oSf22uaXOGEWLVy9qDljephn
 u3NAvg2EaKvLOy6WIEhlvfg9Yiyl3dugn2BSfqQt6hu5Banu5jrUXzTn0RDLtHZj4ub0
 VF0uI/h/j+2AoyFevppCusBREOXLUnmB0XDQCptetMXf5qXBv1n3MlN8OqTCh4hQBhme
 X0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M7y+IiK47s8M2zv0mav4uA/IU6GOwsfw1P1SqyYTSM4=;
 b=c+h5M3Vzg2nTF3ViWdlmCehltQxjdboVUHmGalGb3qJZKJAvm7HKxjnW6M81HxDORF
 60mwiu/r+FTD1aOPub9bHe5OIuadZm7cbHunKsbEFQlstzQlUqex7+zd/TmDlcyoTWyz
 OnDiYL29ZUat4hxUIt59K3/F+DFgHY9aMBwQ0te9dz69CXCQ3BpRk42jI+mrtgKELHAa
 gkpjxPBI/hgBhGxhE7NZk5khbAYBWA7ABJmCOXzGg0qzJqvJ0l+y0+v4Ut62fJA81GnR
 mEi3wUatAWo0ajZiz1HB24v6xW87e9lQRrFeuWqhKTZze22KSx9VP3cr13iVBJJebCUY
 GzVQ==
X-Gm-Message-State: AOAM5323OCWt2z7vsaPOeXfNUjgWNbXV1AdhQC5w3wPq2FZOzXYDhaKB
 zSrKtfbwuIja9+g4gcawZArWEUxnenaoAw==
X-Google-Smtp-Source: ABdhPJzY3wyrMOqf/k90/KCyrWHAsHpquW+V/vFe7+wKqNnQBiNNWT9tRkWl7mvdaBa9fwucIzqDLA==
X-Received: by 2002:aa7:c5d4:: with SMTP id h20mr1706999eds.161.1613389418303; 
 Mon, 15 Feb 2021 03:43:38 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7947:c6d1:7053:6072])
 by smtp.gmail.com with ESMTPSA id l24sm3013974edq.32.2021.02.15.03.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:43:37 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	shashank.sharma@amd.com
Subject: [PATCH] drm/amdgpu: Set GTT_USWC flag to enable freesync v2
Date: Mon, 15 Feb 2021 12:43:36 +0100
Message-Id: <20210215114336.89977-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAYW1kLmNvbT4KClRoaXMgcGF0
Y2ggc2V0cyAnQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDJyBhcyBpbnB1dApwYXJhbWV0
ZXIgZmxhZywgZHVyaW5nIG9iamVjdCBjcmVhdGlvbiBvZiBhbiBpbXBvcnRlZCBETUEKYnVmZmVy
LgoKSW4gYWJzZW5jZSBvZiB0aGlzIGZsYWc6CjEuIEZ1bmN0aW9uIGFtZGdwdV9kaXNwbGF5X3N1
cHBvcnRlZF9kb21haW5zKCkgZG9lc24ndCBhZGQKICAgQU1ER1BVX0dFTV9ET01BSU5fR1RUIGFz
IHN1cHBvcnRlZCBkb21haW4uCjIuIER1ZSB0byB3aGljaCwgRnVuY3Rpb24gYW1kZ3B1X2Rpc3Bs
YXlfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUoKQogICByZWZ1c2VzIHRvIGNyZWF0ZSBmcmFtZWJ1
ZmZlciBmb3IgaW1wb3J0ZWQgRE1BIGJ1ZmZlcnMuCjMuIER1ZSB0byB3aGljaCwgQWRkRkIoKSBJ
T0NUTCBmYWlscy4KNC4gRHVlIHRvIHdoaWNoLCBhbWRncHVfcHJlc2VudF9jaGVja19mbGlwKCkg
Y2hlY2sgZmFpbHMgaW4gRERYCjUuIER1ZSB0byB3aGljaCBERFggZHJpdmVyIGRvZXNuJ3QgYWxs
b3cgZmxpcHMgKGdvZXMgdG8gYmxpdHRpbmcpCjYuIER1ZSB0byB3aGljaCBzZXR0aW5nIEZyZWVz
eW5jL1ZSUiBwcm9wZXJ0eSBmYWlscyBmb3IgUFJJTUUgYnVmZmVycy4KClNvLCB0aGlzIHBhdGNo
IGZpbmFsbHkgZW5hYmxlcyBGcmVlc3luYyB3aXRoIFBSSU1FIGJ1ZmZlciBvZmZsb2FkaW5nLgoK
djIgKGNoayk6IGluc3RlYWQgb2YganVzdCBjaGVja2luZyB0aGUgZmxhZyB3ZSBjb3B5IGl0IG92
ZXIgaWYgdGhlCiAgICAgICAgICBleHBvcnRlciBpcyBhbiBhbWRncHUgZGV2aWNlIGFzIHdlbGwu
CgpTaWduZWQtb2ZmLWJ5OiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDE0
ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZG1hX2J1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYwpp
bmRleCBkMzcyN2YzYWIyNzcuLmE1NGE4NzBmMDA2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCkBAIC00MjIsMTQgKzQyMiwyMiBAQCBhbWRncHVfZG1h
X2J1Zl9jcmVhdGVfb2JqKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkbWFfYnVmICpk
bWFfYnVmKQogewogCXN0cnVjdCBkbWFfcmVzdiAqcmVzdiA9IGRtYV9idWYtPnJlc3Y7CiAJc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBkcm1fdG9fYWRldihkZXYpOwotCXN0cnVjdCBhbWRn
cHVfYm8gKmJvOwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iajsKKwlzdHJ1Y3QgYW1kZ3B1
X2JvICpibzsKKwl1aW50NjRfdCBmbGFncyA9IDA7CiAJaW50IHJldDsKIAogCWRtYV9yZXN2X2xv
Y2socmVzdiwgTlVMTCk7CisKKwlpZiAoZG1hX2J1Zi0+b3BzID09ICZhbWRncHVfZG1hYnVmX29w
cykgeworCQlzdHJ1Y3QgYW1kZ3B1X2JvICpvdGhlciA9IGdlbV90b19hbWRncHVfYm8oZG1hX2J1
Zi0+cHJpdik7CisKKwkJZmxhZ3MgfD0gb3RoZXItPmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVf
Q1BVX0dUVF9VU1dDOworCX0KKwogCXJldCA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2
LCBkbWFfYnVmLT5zaXplLCBQQUdFX1NJWkUsCi0JCQlBTURHUFVfR0VNX0RPTUFJTl9DUFUsCi0J
CQkwLCB0dG1fYm9fdHlwZV9zZywgcmVzdiwgJmdvYmopOworCQkJCSAgICAgICBBTURHUFVfR0VN
X0RPTUFJTl9DUFUsIGZsYWdzLAorCQkJCSAgICAgICB0dG1fYm9fdHlwZV9zZywgcmVzdiwgJmdv
YmopOwogCWlmIChyZXQpCiAJCWdvdG8gZXJyb3I7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
