Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29548F8B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0221789CE1;
	Mon, 17 Jun 2019 19:32:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B786F89C9A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m29so12268676qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TWxSH4mIO3gPjOyUeJv/PS3xaGB2zGi7hlXGqgM35I=;
 b=t5/LUO0rcKsBvnQ3dCfzL+HtKw4LdX8G1uiknniHbLYM/w93SucCGk5Pm4oAhL+0WH
 VU0HXATsmIzGZyQnf6ucIUX/n0hTRJnW7s2KtfMEEVs6Y4bs0qR+gfnpsEaOsUYt0apE
 jl4kHbFP/1vS6puzqjusWm0vohL6e1KLbd5y3GRfNGBpchyl6cIU/ENY8FKmcOBChPF7
 SxvcNqx9U+ZVzEp8Ii+nO/VhnpBu62PKjVdYYXhm5noAkYxI+JEsJMV5+djpHzVZ5Gs7
 vtTCGbRFyVcLz6+Tq/vKGQVUAlpxWnORhykjJGYiSvc6EJvQNvCMBOeSKUz83RFbxDHw
 dgwA==
X-Gm-Message-State: APjAAAXIuHKX+5FWQ30rcSXA93VInn6/RHPW8KMYXDZYzWhQvF5caONg
 3+WmrDzbP5+kI8EmTdfG6E3dNVXfCpQ=
X-Google-Smtp-Source: APXvYqzo5k2Z+8AqJaSsRSYdzErTuEnPy6Om6WbFA2Lco6jsON3UHU1w4FZ12jDhrjXcXG/SrjSg7A==
X-Received: by 2002:a0c:d4f4:: with SMTP id y49mr23172561qvh.238.1560799942754; 
 Mon, 17 Jun 2019 12:32:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 276/459] drm/amd/powerplay: allow dc request uclk change
Date: Mon, 17 Jun 2019 14:30:43 -0500
Message-Id: <20190617193106.18231-77-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7TWxSH4mIO3gPjOyUeJv/PS3xaGB2zGi7hlXGqgM35I=;
 b=JyLod5U70H2hYPEXOqNbYa6c8tdpwOqlRtJ207Dl4DmcYhxXI9JLmId1PldCAWYRBv
 wVp+dleFwRfDe0BI9dzJidmsu4AJZkDamWDMfcnT3vnq8MvQzmK8RqwEhDqiU9GdxJfl
 5twbHWqiU4wrvRYqED+fq+WFJJxa8Kxg25AUKRbxiTbGU/SPt4p53kWFWzPgfm6q7pZA
 nHTuocbc01u1XO6d3l2iKUZIVjPAn3eAD71QGe7xoEu8YNRXd7Hk1NJRBTYEop1B60Hr
 UN4n0O0LxWaNXuyN/Lo2je4LhA4YMjiyr6NWs5nrM9hX1jxAo76c1JQgSp27rMLSyB+g
 8z4Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKd2hlbiBkYyBzZXQgbW9kZSBv
ciBjb2xvciBmb3JtYXQgaW4gZnJhbWUgYnVmZmVyCmNoYW5nZSwgaXQgbWF5IHJlcXVlc3QgY2xv
Y2sgY2hhbmdlcywgbGlrZSBkaXNwY2xrLApkY2ZjbGssIHVjbGsuIGFmdGVyIHNtdSBnZXQgY2xv
Y2sgcmVxdWVzdHMsIHNtdQp3aWxsIG1ha2UgZGVjaXNpb24uCgpTaWduZWQtb2ZmLWJ5OiBoZXJz
ZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5o
dWFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8w
LmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwppbmRleCA2
ZmZmZjVhYjc0YjQuLjFiNWQ0MDg0ZWVkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvc211X3YxMV8wLmMKQEAgLTEyNzUsNyArMTI3NSw4IEBAIHNtdV92MTFfMF9kaXNwbGF5X2Ns
b2NrX3ZvbHRhZ2VfcmVxdWVzdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAogCWlmICghc211
LT5wbV9lbmFibGVkKQogCQlyZXR1cm4gLUVJTlZBTDsKLQlpZiAoc211X2ZlYXR1cmVfaXNfZW5h
YmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCkpIHsKKwlpZiAoc211X2ZlYXR1
cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCkgfHwKKwkgICAg
c211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsK
IAkJc3dpdGNoIChjbGtfdHlwZSkgewogCQljYXNlIGFtZF9wcF9kY2VmX2Nsb2NrOgogCQkJY2xr
X3NlbGVjdCA9IFNNVV9EQ0VGQ0xLOwpAQCAtMTI4OSw2ICsxMjkwLDkgQEAgc211X3YxMV8wX2Rp
c3BsYXlfY2xvY2tfdm9sdGFnZV9yZXF1ZXN0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQlj
YXNlIGFtZF9wcF9waHlfY2xvY2s6CiAJCQljbGtfc2VsZWN0ID0gU01VX1BIWUNMSzsKIAkJCWJy
ZWFrOworCQljYXNlIGFtZF9wcF9tZW1fY2xvY2s6CisJCQljbGtfc2VsZWN0ID0gU01VX1VDTEs7
CisJCQlicmVhazsKIAkJZGVmYXVsdDoKIAkJCXByX2luZm8oIlslc10gSW52YWxpZCBDbG9jayBU
eXBlISIsIF9fZnVuY19fKTsKIAkJCXJldCA9IC1FSU5WQUw7CkBAIC0xMjk4LDggKzEzMDIsMTAg
QEAgc211X3YxMV8wX2Rpc3BsYXlfY2xvY2tfdm9sdGFnZV9yZXF1ZXN0KHN0cnVjdCBzbXVfY29u
dGV4dCAqc211LAogCQlpZiAocmV0KQogCQkJZ290byBmYWlsZWQ7CiAKKwkJbXV0ZXhfbG9jaygm
c211LT5tdXRleCk7CiAJCXJldCA9IHNtdV9zZW5kX3NtY19tc2dfd2l0aF9wYXJhbShzbXUsIFNN
VV9NU0dfU2V0SGFyZE1pbkJ5RnJlcSwKIAkJCShzbXVfY2xrX2dldF9pbmRleChzbXUsIGNsa19z
ZWxlY3QpIDw8IDE2KSB8IGNsa19mcmVxKTsKKwkJbXV0ZXhfdW5sb2NrKCZzbXUtPm11dGV4KTsK
IAl9CiAKIGZhaWxlZDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
