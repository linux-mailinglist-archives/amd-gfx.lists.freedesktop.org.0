Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB54B841
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 14:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143076E395;
	Wed, 19 Jun 2019 12:29:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E56E395
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 12:29:19 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Computer111.attlocal.net ([99.116.190.167]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MpUUm-1iOzHp3OEG-00pwgU; Wed, 19 Jun 2019 14:29:14 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu: uint32_t for amdgpu_dm_plane_init()
 possible_crtcs parameter
Date: Wed, 19 Jun 2019 07:28:54 -0500
Message-Id: <20190619122857.12603-2-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619122857.12603-1-kevinbrace@gmx.com>
References: <20190619122857.12603-1-kevinbrace@gmx.com>
X-Provags-ID: V03:K1:ojJSYg35EXTWDKf0uw/OepAfiN/ckC/1Fn7FTLnfrRvPgo0SgQA
 xjEWnJZPagDJ47JQIkLm4F8QPMHu3SPaoiM7Cc7xUmDAUgmXT1X1mv8NN0dv5H7NUnDjFjk
 LjiXOeYRFfQez7FEBD2zruP60kQM6AwGsS//+KFtpcBz/Grfb3YwSdmV6rYl3gNPfCKGNMl
 W1CkomVW+dmhn+kUXaboQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5baOjov7EJQ=:xeBfzJUCK7S3rMuDpM2OcX
 C9k6VR2uU/xNoeQgoMOCRCyj0gxTTG37Grs9lMscZ7h6NtKmwrHOIe54GwtPqnzG4t6++c3Vb
 RgxJvhjogyTF143GhKIPPVgTMe0cJpDbU/TUFZiOuTUv/Gi4gKCi8Ur1IqqWm8mr7XdDHPfI1
 Qj6nJGL9PVzILsRTRncLw9MONQT4hYT+gNnJQWAGXbzYXMOIEW4DwKKxejgE5v3WeKoxxVo7s
 rHHryR+Yk89m3WRavkKC3/lMsa+D2+dBAipXbUBcGnt11tRLHRXcVsQdTnESdGMfZck61iBVf
 YNK0qoNQVbW7R5F0uBfIF5xsNZDeMBz/QUbNKPZ+RdxT2rUfIUCd4KXYm0HnftwIHQmU3uSje
 r1WHhpK53kstAMHGKrj4NnPkIHTVSvBVF9VTlxRwX1OdokYFnYCywmfrFxfdeoXB0cDT9t9m7
 tYa54TVAun4mn8LOV17vj21hQs00iAVrotKQ6k/idbCmTUypduFW6o36WkCz89SaVqldimfum
 s4DPWNzZ4vuwEIOiA00f1t/2d/WgUyjQ2VI+QV9J2YaR0H8UwKhfSR1akaJ7H0+eNI78yBOdh
 3xUHqOeoymlOqrBLM/3LEDCypvE07FyqAsLYHxEqJMUfiqkNeakZ3NBwEuFK0bFxb788enUVW
 YIiv1bwpo3n4o4PSzz1PgVrLS1gdIZ+KPwlXD1OgdGU5witFeB0N0prvqDD44t5NOIfpVQ//j
 fxeHytU9HGEsuTZEBV1hxhNxj9DCM1EgUBg5a7bgq83xEOnwU7IdrVH2U5P7IGiNVEhIr0C2J
 TB7lxF5gWdU5+kM/Q6L1tt4Fbsy+ejZv2WAELS1ZBx/UxOFbpx9z+VVN/4U2IJHEpiHltd6VC
 pYvdtXkaGWLQWUadfpj0ZCT6aBKzNH5ho096Bih6LblUSB2m8Gbk8HKTBgLJtF66QMF/ahQLX
 BcrG29pKNrfHynzfaMIaCGrxXyaL99iQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560947354;
 bh=dMHecW5LW3F+SIQCoYj2a1v9EIV2dLg1OoN41Fwauio=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lD+ziFXj1nRsfUNZyXOmX7QsSZxd+jPgui9FPkkEGu/Zo7PlCH+5YJLjddvTXXhA9
 RF3UB78ovWdu6F0jjcH+6SYR8q/Lf9bga5CyllyCmBdMFRBkqUE5+MWGs0cEavtbqI
 Z4ekNJpun19ScgSJFlX2NoZDTLuM+PUWPlTWVcNA=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+Cgpwb3Nz
aWJsZV9jcnRjcyBwYXJhbWV0ZXIgb2YgYW1kZ3B1X2RtX3BsYW5lX2luaXQoKSBpcyBhbiB1bnNp
Z25lZCBsb25nCnR5cGUsIGJ1dCB0aGUgb25lIGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdCgpIG9m
IERSTSBjb3JlIGhhcyBpcyBhCnVpbnQzMl90IHR5cGUuICBwb3NzaWJsZV9jcnRjcyBwYXJhbWV0
ZXIgaXMgdWx0aW1hdGVseSBwYXNzZWQgb3ZlciB0bwpkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQo
KS4KClNpZ25lZC1vZmYtYnk6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGJyYWNlY29tcHV0ZXJs
YWIuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwppbmRleCAxODU0NTA2ZTNlOGYuLjdhNTRhOTYyM2I4ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0xMTEs
NyArMTExLDcgQEAgYW1kZ3B1X2RtX3VwZGF0ZV9jb25uZWN0b3JfYWZ0ZXJfZGV0ZWN0KHN0cnVj
dCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKTsKCiBzdGF0aWMgaW50IGFtZGdwdV9k
bV9wbGFuZV9pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJCQlzdHJ1
Y3QgZHJtX3BsYW5lICpwbGFuZSwKLQkJCQl1bnNpZ25lZCBsb25nIHBvc3NpYmxlX2NydGNzLAor
CQkJCXVpbnQzMl90IHBvc3NpYmxlX2NydGNzLAogCQkJCWNvbnN0IHN0cnVjdCBkY19wbGFuZV9j
YXAgKnBsYW5lX2NhcCk7CiBzdGF0aWMgaW50IGFtZGdwdV9kbV9jcnRjX2luaXQoc3RydWN0IGFt
ZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJICAgICAgIHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLApAQCAtMTk4OSw3ICsxOTg5LDcgQEAgc3RhdGljIGludCBpbml0aWFsaXplX3BsYW5lKHN0
cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAkJCSAgICBjb25zdCBzdHJ1Y3QgZGNf
cGxhbmVfY2FwICpwbGFuZV9jYXApCiB7CiAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Ci0JdW5z
aWduZWQgbG9uZyBwb3NzaWJsZV9jcnRjczsKKwl1aW50MzJfdCBwb3NzaWJsZV9jcnRjczsKIAlp
bnQgcmV0ID0gMDsKCiAJcGxhbmUgPSBremFsbG9jKHNpemVvZihzdHJ1Y3QgZHJtX3BsYW5lKSwg
R0ZQX0tFUk5FTCk7CkBAIC00MzI4LDcgKzQzMjgsNyBAQCBzdGF0aWMgaW50IGdldF9wbGFuZV9m
b3JtYXRzKGNvbnN0IHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAoKIHN0YXRpYyBpbnQgYW1kZ3B1
X2RtX3BsYW5lX2luaXQoc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQkJCXN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAotCQkJCXVuc2lnbmVkIGxvbmcgcG9zc2libGVfY3J0Y3Ms
CisJCQkJdWludDMyX3QgcG9zc2libGVfY3J0Y3MsCiAJCQkJY29uc3Qgc3RydWN0IGRjX3BsYW5l
X2NhcCAqcGxhbmVfY2FwKQogewogCXVpbnQzMl90IGZvcm1hdHNbMzJdOwotLQoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
