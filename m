Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682A779992
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5B46E29D;
	Mon, 29 Jul 2019 20:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD66E293
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:43 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id m23so41887542vso.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wsLhRHJ20PA/gwH5zOgNhMzv8AjHlPlEvpQRYFwkNJg=;
 b=huyC50/kDG288OxPl7tPwcbyCgrqEpC2mdW0NGTw6DWig+7BGVbm/XIWFfQnBCqCKE
 LbmOr9nbvputZilMW6i91I3RD0r+U07mu7VF9IKnhCdjRMmuc0kqISX1LKfQh3nmvOwA
 ZK/ZavCKNWHkv/Auf2n+QfY2Pkce5MeCBDMzGrHRevm4cAfEy08WF715j3DClHrw9Mrr
 tcOi/iibfKnfpt+Nh4ai6x7q2x8PX92Guhm+cqBrtFTSDelmqOllBtn7UJXZU+/nZ/LQ
 oZKiknvuTe/85ciZpaHjB8g0R0gjs0UEjl9eXfhk0L3NTMlhPAYG1kR17Besng8cMana
 TtRA==
X-Gm-Message-State: APjAAAVP4zczctCidCzS2T5eYGtL+LdKS4zpuOZaxnxIPwKxNwW1/voU
 B7owYNmr79K/ag0vQbcMfM+NJGjV
X-Google-Smtp-Source: APXvYqwj4OsLxl2S2c8BTED3nsQW3F42z5Vip7KuvWsImSmv6JhVVc1W64nqcSoiK3MF25MfltQFXA==
X-Received: by 2002:a67:a209:: with SMTP id l9mr75009564vse.125.1564431341145; 
 Mon, 29 Jul 2019 13:15:41 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/30] drm/amd/powerplay: correct the bitmask used in arcturus
Date: Mon, 29 Jul 2019 15:15:01 -0500
Message-Id: <20190729201508.16136-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wsLhRHJ20PA/gwH5zOgNhMzv8AjHlPlEvpQRYFwkNJg=;
 b=mD/iTRlaYAVNYTaytXA2geWU+l3MVCVGwp4ngc78cD7UD7K8+X1gqUDZCnzCgeWq+i
 0MMmjgNalfqvN18xyUpwAXFV6F7JN+dN/vZ6ntMS6giGwc+3b96/pSpVKoroKi9R7DVO
 DA+BM9Xqu4HPynzXeXsktjaMZSS9mXHShrZWxu5J/fqectBDu7SqLzG+CvYaSA590W1b
 UVn/qDBfK1Sv3ab5DrdXM0Ll4j8iX0dtNXemrA+n4EkEm9XdjkIy8yfe2SpefYsTu0S9
 CS96JcMrxIH1UZDcjls6iLK2D7tevl1znDOK83mwRlZamty2TSt/grjfYMM3q82z9Xbi
 mYQQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClRob3NlIGJpdG1hc2sgcHJlZml4
ZWQgYnkgIlNNVV8iIHNob3VsZCBiZSB1c2VkLgoKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwppbmRleCAy
MDNmY2I3Y2Q3MjQuLmVhY2EwMzgxZThiZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYXJjdHVydXNfcHB0LmMKQEAgLTQwMyw3ICs0MDMsNyBAQCBzdGF0aWMgaW50IGFyY3R1
cnVzX3NldF9kZWZhdWx0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAogCS8q
IHNvY2NsayAqLwogCXNpbmdsZV9kcG1fdGFibGUgPSAmKGRwbV90YWJsZS0+c29jX3RhYmxlKTsK
LQlpZiAoc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIEZFQVRVUkVfRFBNX1NPQ0NMS19CSVQp
KSB7CisJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fU09D
Q0xLX0JJVCkpIHsKIAkJcmV0ID0gYXJjdHVydXNfc2V0X3NpbmdsZV9kcG1fdGFibGUoc211LCBz
aW5nbGVfZHBtX3RhYmxlLAogCQkJCQkJICBQUENMS19TT0NDTEspOwogCQlpZiAocmV0KSB7CkBA
IC00MTgsNyArNDE4LDcgQEAgc3RhdGljIGludCBhcmN0dXJ1c19zZXRfZGVmYXVsdF9kcG1fdGFi
bGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAKIAkvKiBnZnhjbGsgKi8KIAlzaW5nbGVfZHBt
X3RhYmxlID0gJihkcG1fdGFibGUtPmdmeF90YWJsZSk7Ci0JaWYgKHNtdV9mZWF0dXJlX2lzX2Vu
YWJsZWQoc211LCBGRUFUVVJFX0RQTV9HRlhDTEtfQklUKSkgeworCWlmIChzbXVfZmVhdHVyZV9p
c19lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfRFBNX0dGWENMS19CSVQpKSB7CiAJCXJldCA9IGFy
Y3R1cnVzX3NldF9zaW5nbGVfZHBtX3RhYmxlKHNtdSwgc2luZ2xlX2RwbV90YWJsZSwKIAkJCQkJ
CSAgUFBDTEtfR0ZYQ0xLKTsKIAkJaWYgKHJldCkgewpAQCAtNDMzLDcgKzQzMyw3IEBAIHN0YXRp
YyBpbnQgYXJjdHVydXNfc2V0X2RlZmF1bHRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAq
c211KQogCiAJLyogbWVtY2xrICovCiAJc2luZ2xlX2RwbV90YWJsZSA9ICYoZHBtX3RhYmxlLT5t
ZW1fdGFibGUpOwotCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1f
VUNMS19CSVQpKSB7CisJaWYgKHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVS
RV9EUE1fVUNMS19CSVQpKSB7CiAJCXJldCA9IGFyY3R1cnVzX3NldF9zaW5nbGVfZHBtX3RhYmxl
KHNtdSwgc2luZ2xlX2RwbV90YWJsZSwKIAkJCQkJCSAgUFBDTEtfVUNMSyk7CiAJCWlmIChyZXQp
IHsKQEAgLTQ0OCw3ICs0NDgsNyBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX3NldF9kZWZhdWx0X2Rw
bV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIAogCS8qIGZjbGsgKi8KIAlzaW5nbGVf
ZHBtX3RhYmxlID0gJihkcG1fdGFibGUtPmZjbGtfdGFibGUpOwotCWlmIChzbXVfZmVhdHVyZV9p
c19lbmFibGVkKHNtdSxGRUFUVVJFX0RQTV9GQ0xLX0JJVCkpIHsKKwlpZiAoc211X2ZlYXR1cmVf
aXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9GQ0xLX0JJVCkpIHsKIAkJcmV0ID0gYXJj
dHVydXNfc2V0X3NpbmdsZV9kcG1fdGFibGUoc211LCBzaW5nbGVfZHBtX3RhYmxlLAogCQkJCQkJ
ICBQUENMS19GQ0xLKTsKIAkJaWYgKHJldCkgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
