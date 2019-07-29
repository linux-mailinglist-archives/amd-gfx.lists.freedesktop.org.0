Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9D799A0
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F476E2A5;
	Mon, 29 Jul 2019 20:15:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840A189DD8
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:35 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id v18so24534869uad.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bO/iSQuHAjKvMcDY0q6RlqufIIWZdTLAQeCQ/+WTQI=;
 b=qhavsYu9qDZ3taut7VlhlQLLz8ywMtmSjjOLDlXX/8J3Z1jrVk5x8HTB++bBoCIOJ7
 yRbgTWDUSeX5A4QzR51Ot5gjRiJ0yHzEU9oo6FL2/xR6qmbGI21UDXRWlc3ywr4f4tqI
 97sHBFv+hvTWMrtcFUZSEnlhGzbJ9/DenvXbyFq5m1hbE/gQp4d0BiQWuba+b4R080Rt
 jLvb4BzkqZszzGzeN7LDK+osC0hF8fCAiw4smepp0ceP8WA+/lzTP2zhhGm8oTm+YdaQ
 8xhTdum3o23MuFLnhGQ5wnrPgVaLnY4fevYvWqTIZF9OVGzmaLuhK0n36TKEgMLZusCx
 L6FQ==
X-Gm-Message-State: APjAAAURTApCa6fKi/xOPxTbXG3yb8pO0TVeqdcgfDYeUqqvecD+XRP1
 yUunHrZ/M6GLiNmP5GQxpISZC+WA
X-Google-Smtp-Source: APXvYqy0NaB3cSm4K4D+ne4zJioNB+niAGUcCqMGcsgA2pLKgRmzdx5aZ4s+WxjZ+LDnf2IYIoAKcQ==
X-Received: by 2002:ab0:49b0:: with SMTP id e45mr8909549uad.120.1564431334445; 
 Mon, 29 Jul 2019 13:15:34 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/30] drm/amd/powerplay: correct Navi10 VCN powergate control
Date: Mon, 29 Jul 2019 15:14:54 -0500
Message-Id: <20190729201508.16136-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bO/iSQuHAjKvMcDY0q6RlqufIIWZdTLAQeCQ/+WTQI=;
 b=GWkeUPJH9cTALKVEl0yF4LsGkP4wAdur7cpZt9UDpT2J1xrufnt3ppVnmj7fvf1ISt
 MzfUARHqzOw5qbkClHtBWNEUGbkzzkSLDoLe4wpjQgzcfZlUeJ7FTMttWsc0JJUWHtUe
 6GTWolevJcaSuGJJkhHDJFwCTvbGrO7iqXEUeh2Y1W2eSj+v90z/9gsxxyZ/IYB5TRNA
 K7kxnkbax9W6dRVMG1qnRuwqZXqflsTNKkDYBZ6xLQgDg1olWicZPZLFizOcRs+2LPTS
 VoeF4ihwt/pPEAyIxinXGohANelgloI54GdtP6GpqV5jqs1/Oza8ZIfDEASXkeCx/glx
 PUUw==
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
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCk5vIFZDTiBEUE0gYml0IGNoZWNr
IGFzIHRoYXQncyBkaWZmZXJlbnQgZnJvbSBWQ04gUEcuIEFsc28Kbm8gZXh0cmEgY2hlY2sgZm9y
IHBvc3NpYmxlIGRvdWJsZSBlbmFibGVtZW50L2Rpc2FibGVtZW50CmFzIHRoYXQncyBhbHJlYWR5
IGRvbmUgYnkgVkNOLgoKU2lnbmVkLW9mZi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAyNiArKysrKysrKy0t
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXgg
OWRkOTZkOGI4ZGQ1Li4wMWQ1MzRjODQ0MmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMKQEAgLTU5MSwyNyArNTkxLDE5IEBAIHN0YXRpYyBpbnQgbmF2aTEw
X3NldF9kZWZhdWx0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKIHN0YXRpYyBp
bnQgbmF2aTEwX2RwbV9zZXRfdXZkX2VuYWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgYm9v
bCBlbmFibGUpCiB7CiAJaW50IHJldCA9IDA7Ci0Jc3RydWN0IHNtdV9wb3dlcl9jb250ZXh0ICpz
bXVfcG93ZXIgPSAmc211LT5zbXVfcG93ZXI7Ci0Jc3RydWN0IHNtdV9wb3dlcl9nYXRlICpwb3dl
cl9nYXRlID0gJnNtdV9wb3dlci0+cG93ZXJfZ2F0ZTsKIAotCWlmIChlbmFibGUgJiYgcG93ZXJf
Z2F0ZS0+dXZkX2dhdGVkKSB7Ci0JCWlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgU01V
X0ZFQVRVUkVfRFBNX1VWRF9CSVQpKSB7Ci0JCQlyZXQgPSBzbXVfc2VuZF9zbWNfbXNnX3dpdGhf
cGFyYW0oc211LCBTTVVfTVNHX1Bvd2VyVXBWY24sIDEpOwotCQkJaWYgKHJldCkKLQkJCQlyZXR1
cm4gcmV0OwotCQl9Ci0JCXBvd2VyX2dhdGUtPnV2ZF9nYXRlZCA9IGZhbHNlOworCWlmIChlbmFi
bGUpIHsKKwkJcmV0ID0gc211X3NlbmRfc21jX21zZ193aXRoX3BhcmFtKHNtdSwgU01VX01TR19Q
b3dlclVwVmNuLCAxKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CiAJfSBlbHNlIHsKLQkJ
aWYgKCFlbmFibGUgJiYgIXBvd2VyX2dhdGUtPnV2ZF9nYXRlZCkgewotCQkJaWYgKHNtdV9mZWF0
dXJlX2lzX2VuYWJsZWQoc211LCBTTVVfRkVBVFVSRV9EUE1fVVZEX0JJVCkpIHsKLQkJCQlyZXQg
PSBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19Qb3dlckRvd25WY24pOwotCQkJCWlmIChy
ZXQpCi0JCQkJCXJldHVybiByZXQ7Ci0JCQl9Ci0JCQlwb3dlcl9nYXRlLT51dmRfZ2F0ZWQgPSB0
cnVlOwotCQl9CisJCXJldCA9IHNtdV9zZW5kX3NtY19tc2coc211LCBTTVVfTVNHX1Bvd2VyRG93
blZjbik7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OwogCX0KIAorCXNtdV9mZWF0dXJlX3Nl
dF9lbmFibGVkKHNtdSwgU01VX0ZFQVRVUkVfVkNOX1BHX0JJVCwgZW5hYmxlKTsKKwogCXJldHVy
biAwOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
