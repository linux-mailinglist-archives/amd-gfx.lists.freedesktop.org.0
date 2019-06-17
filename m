Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3134248FDE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83B89CF1;
	Mon, 17 Jun 2019 19:46:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299D889DA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:06 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id p15so12312945qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2mw+24qfI9ruPpVg8TbMgl7mEYrJpPyXpjXQCIxFGg=;
 b=TOsA2Q1pWKXl8SjPllBoUFPxmMG0PWY7SnJ32B2EJV0rLGOEGj/ZfHThYZCTnfQ0N6
 WWyc3D5weZYkLmCRhzEJmBVErvREcVx4i4bmnmDpW2e3K/NGefLdm6nybYseH14Cel+D
 v48iPvgUF/IjMgl6iJRd1An3Qneja9jNekhwrZHxPGKcrMu2UahUzh7KiJv0kfHaaUKr
 14pcBLFjV9S5EUtGySkJ9VAnoMnWb6nLesR5HpY7hNXxlDdRyeyDdkN/G3CDb5dAxVtX
 GMGkkAvSSdBEH4U4tuGrKVOV4y32jjlvzrc33vhfk3DQ7vDuBlOY/T2UTdkcGouX7E9X
 Qqhw==
X-Gm-Message-State: APjAAAWFTQgwdt6zMztLlINpSpJfMZU4TAOnowMpbNOD+g+2xsmuJ1Fl
 d2VALlUvPmgPKh1wwj6LpiDpSB1/50E=
X-Google-Smtp-Source: APXvYqydakUQBHpXzFnmHTO/G5qYW4C5iDQ/TeNLSBCf3Vdcx/6L8GMzdx7Ig+duhQG6PVLmGtRqxA==
X-Received: by 2002:ac8:2181:: with SMTP id 1mr7965271qty.263.1560800764854;
 Mon, 17 Jun 2019 12:46:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:04 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 315/459] drm/amd/display: use fixed-width data type for soc
 bounding box struct
Date: Mon, 17 Jun 2019 14:44:16 -0500
Message-Id: <20190617194540.18497-16-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2mw+24qfI9ruPpVg8TbMgl7mEYrJpPyXpjXQCIxFGg=;
 b=rh7ANuWoE4ldFFkz58YnBOrVXCNoT0BUZRYoctSmT74VqM9WqBEzPjrEGEhNTQQ6yy
 cdiLAheVKJrHly9Q1879eqqMLxzyVNy1iOB9xp/afQcmwGrAdE8Iz8Vtio7/FRBkaGiC
 cMSrj1qiaQupRFC8SvcXP7gdXm7OLRKT3V59kJBAMS+YLw1JsjClGcZ9B51i4ypg/lwE
 xlJ26GL+rqJ/TVo6lYFFXmUGxroMcvFmM0zNpzCSEqeC1bKESug754QM2oW7masJLJ5v
 kmFcDHirTnHzwLnMAYDkdLsMX78BmmP2CKkpfwn4tL7kn30UkG3b/UA8zeztMnIffJt+
 Lkdg==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfc29jYmIuaCB8IDMwICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NvY2JiLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc29jYmIuaAppbmRleCAzMjgyZGZhNTA0MzMuLmY0MTc2
Y2IwMTc5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Nv
Y2JiLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3NvY2JiLmgKQEAg
LTI0LDcgKzI0LDcgQEAKICNkZWZpbmUgX19BTURHUFVfU09DQkJfSF9fCiAKIHN0cnVjdCBncHVf
aW5mb192b2x0YWdlX3NjYWxpbmdfdjFfMCB7Ci0JaW50IHN0YXRlOworCXVpbnQzMl90IHN0YXRl
OwogCXVpbnQzMl90IGRzY2Nsa19taHo7CiAJdWludDMyX3QgZGNmY2xrX21oejsKIAl1aW50MzJf
dCBzb2NjbGtfbWh6OwpAQCAtNDksNyArNDksNyBAQCBzdHJ1Y3QgZ3B1X2luZm9fc29jX2JvdW5k
aW5nX2JveF92MV8wIHsKIAl1aW50MzJfdCBwY3RfaWRlYWxfZHJhbV9zZHBfYndfYWZ0ZXJfdXJn
ZW50X3ZtX29ubHk7CiAJdWludDMyX3QgbWF4X2F2Z19zZHBfYndfdXNlX25vcm1hbF9wZXJjZW50
OwogCXVpbnQzMl90IG1heF9hdmdfZHJhbV9id191c2Vfbm9ybWFsX3BlcmNlbnQ7Ci0JdW5zaWdu
ZWQgaW50IG1heF9yZXF1ZXN0X3NpemVfYnl0ZXM7CisJdWludDMyX3QgbWF4X3JlcXVlc3Rfc2l6
ZV9ieXRlczsKIAl1aW50MzJfdCBkb3duc3ByZWFkX3BlcmNlbnQ7CiAJdWludDMyX3QgZHJhbV9w
YWdlX29wZW5fdGltZV9uczsKIAl1aW50MzJfdCBkcmFtX3J3X3R1cm5hcm91bmRfdGltZV9uczsK
QEAgLTU5LDIzICs1OSwyMyBAQCBzdHJ1Y3QgZ3B1X2luZm9fc29jX2JvdW5kaW5nX2JveF92MV8w
IHsKIAl1aW50MzJfdCBkY25fZG93bnNwcmVhZF9wZXJjZW50OwogCXVpbnQzMl90IGRpc3BjbGtf
ZHBwY2xrX3Zjb19zcGVlZF9taHo7CiAJdWludDMyX3QgZGZzX3Zjb19wZXJpb2RfcHM7Ci0JdW5z
aWduZWQgaW50IHVyZ2VudF9vdXRfb2Zfb3JkZXJfcmV0dXJuX3Blcl9jaGFubmVsX3BpeGVsX29u
bHlfYnl0ZXM7Ci0JdW5zaWduZWQgaW50IHVyZ2VudF9vdXRfb2Zfb3JkZXJfcmV0dXJuX3Blcl9j
aGFubmVsX3BpeGVsX2FuZF92bV9ieXRlczsKLQl1bnNpZ25lZCBpbnQgdXJnZW50X291dF9vZl9v
cmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfdm1fb25seV9ieXRlczsKLQl1bnNpZ25lZCBpbnQgcm91
bmRfdHJpcF9waW5nX2xhdGVuY3lfZGNmY2xrX2N5Y2xlczsKLQl1bnNpZ25lZCBpbnQgdXJnZW50
X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfYnl0ZXM7Ci0JdW5zaWduZWQgaW50IGNo
YW5uZWxfaW50ZXJsZWF2ZV9ieXRlczsKLQl1bnNpZ25lZCBpbnQgbnVtX2JhbmtzOwotCXVuc2ln
bmVkIGludCBudW1fY2hhbnM7Ci0JdW5zaWduZWQgaW50IHZtbV9wYWdlX3NpemVfYnl0ZXM7CisJ
dWludDMyX3QgdXJnZW50X291dF9vZl9vcmRlcl9yZXR1cm5fcGVyX2NoYW5uZWxfcGl4ZWxfb25s
eV9ieXRlczsKKwl1aW50MzJfdCB1cmdlbnRfb3V0X29mX29yZGVyX3JldHVybl9wZXJfY2hhbm5l
bF9waXhlbF9hbmRfdm1fYnl0ZXM7CisJdWludDMyX3QgdXJnZW50X291dF9vZl9vcmRlcl9yZXR1
cm5fcGVyX2NoYW5uZWxfdm1fb25seV9ieXRlczsKKwl1aW50MzJfdCByb3VuZF90cmlwX3Bpbmdf
bGF0ZW5jeV9kY2ZjbGtfY3ljbGVzOworCXVpbnQzMl90IHVyZ2VudF9vdXRfb2Zfb3JkZXJfcmV0
dXJuX3Blcl9jaGFubmVsX2J5dGVzOworCXVpbnQzMl90IGNoYW5uZWxfaW50ZXJsZWF2ZV9ieXRl
czsKKwl1aW50MzJfdCBudW1fYmFua3M7CisJdWludDMyX3QgbnVtX2NoYW5zOworCXVpbnQzMl90
IHZtbV9wYWdlX3NpemVfYnl0ZXM7CiAJdWludDMyX3QgZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5j
eV91czsKIAl1aW50MzJfdCB3cml0ZWJhY2tfZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91czsK
LQl1bnNpZ25lZCBpbnQgcmV0dXJuX2J1c193aWR0aF9ieXRlczsKLQl1bnNpZ25lZCBpbnQgdm9s
dGFnZV9vdmVycmlkZTsKKwl1aW50MzJfdCByZXR1cm5fYnVzX3dpZHRoX2J5dGVzOworCXVpbnQz
Ml90IHZvbHRhZ2Vfb3ZlcnJpZGU7CiAJdWludDMyX3QgeGZjX2J1c190cmFuc3BvcnRfdGltZV91
czsKIAl1aW50MzJfdCB4ZmNfeGJ1Zl9sYXRlbmN5X3RvbGVyYW5jZV91czsKLQlpbnQgdXNlX3Vy
Z2VudF9idXJzdF9idzsKLQl1bnNpZ25lZCBpbnQgbnVtX3N0YXRlczsKKwl1aW50MzJfdCB1c2Vf
dXJnZW50X2J1cnN0X2J3OworCXVpbnQzMl90IG51bV9zdGF0ZXM7CiAJc3RydWN0IGdwdV9pbmZv
X3ZvbHRhZ2Vfc2NhbGluZ192MV8wIGNsb2NrX2xpbWl0c1s4XTsKIH07CiAKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
