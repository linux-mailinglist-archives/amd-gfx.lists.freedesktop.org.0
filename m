Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742CC5D767
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E804089FC9;
	Tue,  2 Jul 2019 20:29:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607C7895B5
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:17 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r4so986288qkm.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4SGoixJhmRH4S/xmQxfGAwhTSoqEkVT+FBNxU4EgTI=;
 b=nQcaDglLypVLrwNh01Yu+K0BCdFDhUyLGzpL6dh0/Kqri5CDRjSp4dtIfgAuRiSrxE
 Pm4wLnQh/JWFrfgxnKHdi0csEb0WiRx6Iw67zYlCnMJGywy5hxgMUMMCQSdokSt+H3zw
 YOF71udD51IYhaKx54jj9BpZ2X/wFvbHNt/OL5a98PIm9PRBEc0SUVDNgugHE2sFNcx/
 xsaSPufpUZIYGpW252/A5UDmOW5p45j68+dAdoCmhhPzMxMOz4GyCbgQbe8ux7ezAjk+
 ZfNQk5R2djvbNeFMzAUfnMDsE9FVsEvzotnCUaXu2m6sLDr3XybuxWNhpGE9PKZ1Winc
 JrUw==
X-Gm-Message-State: APjAAAXWAc3SNJgqLNErz3Z4cffHAhZ4mobRzqjlzffNeRgKhnQmWu/T
 Mleh/sAdOobVpmiEoMLq/H0beynI4AQ=
X-Google-Smtp-Source: APXvYqwkBpWn6MgVCUqsN9jh2wOnYPpCxtrrTpIRIfL7CtIeh2fnn9BxKiqbQ28aFTHYNUn6uFnQzQ==
X-Received: by 2002:a37:a643:: with SMTP id p64mr27763585qke.36.1562099356342; 
 Tue, 02 Jul 2019 13:29:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/53] drm/amdgpu/gfx: update gc_v10_1_1 golden setting
Date: Tue,  2 Jul 2019 15:28:14 -0500
Message-Id: <20190702202844.17001-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4SGoixJhmRH4S/xmQxfGAwhTSoqEkVT+FBNxU4EgTI=;
 b=iVsv/6+mgRpRdkQS+TMgCtoBnd+q1eC3itHonAGRNsbVXwXSwAYMqK7aA9Ifw7KqKL
 pdt983Qe+rCIyCsWUrheUAMPJBBwfxtGDzywFZSkt77of8EVj6loX2Jsl3AhG4/IwvWi
 vXdIAmlek1Z1shGzbXWHCcBHEYxxmCkr2Kq1GKu7JUyhg7vSSkAa/v6NObvwH1627RSf
 afUZfi65dKAbTYuJVv5ldvqaRrVhde3+8W4dfm3Om5rsztZJ0VVC0ZxTuGsvfPjv6YyY
 f/ZKCO4s5kIcLoLO+Hecd9olSrmd+xwM4hFRZp16gXXxeX/i30Pgq68gEK0SPHyFLfgC
 kNWw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClVwZGF0ZWQgc2V0dGlu
Z3MgZm9yIGh3IHRlYW0uCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVh
bkBhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjEwXzAuYwppbmRleCBlMDJjZGVhYTQ1YzguLjk3MTg5NDEzNDA2MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTE0NSw3ICsxNDUsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzEwXzFf
MVtdID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkFfQUREUl9NQVRDSF9N
QVNLLCAweGZmZmZmZmZmLCAweGZmZmZmZmU3KSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdD
LCAwLCBtbUdMMkNfQUREUl9NQVRDSF9NQVNLLCAweGZmZmZmZmZmLCAweGZmZmZmZmU3KSwKIAlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUdMMkNfQ1RSTDIsIDB4ZmZmZmZmZmYsIDB4
MTQwMjAwMmYpLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tR0wyQ19DVFJMMywg
MHhmZmZmYmZmZiwgMHgwMDAwMDE4OCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwg
bW1HTDJDX0NUUkwzLCAweGZmZmZiZmZmLCAweDAwMDAyMTg4KSwKIAlTT0MxNV9SRUdfR09MREVO
X1ZBTFVFKEdDLCAwLCBtbVBBX1NDX0VOSEFOQ0UsIDB4M2ZmZmZmZmYsIDB4MDgwMDAwMDkpLAog
CVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tUEFfU0NfTElORV9TVElQUExFX1NUQVRF
LCAweDAwMDBmZjBmLCAweDAwMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAw
LCBtbVJNSV9TUEFSRSwgMHhmZmZmZmZmZiwgMHhmZmZmMzEwMSksCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
