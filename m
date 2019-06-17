Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6049055
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451D6E047;
	Mon, 17 Jun 2019 19:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA57D6E049
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id n11so12305484qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+1QKq8ImXZ9qy0re/7/5WQjC70NGJIMX7QEXqU3zJE=;
 b=hO29WQB4fRh5Zx9U/naAMjfbOt1Ne6AilxGA2VEvOPMt1wmtPod2F9YABP19VlMB+4
 bQwkBuNAsNKaLM6rc1MPRR97o2IwGnSZrwnMUXBaaZFyEXNpbEj23xij7xbbPaTTB8Hb
 SxdxVZovOPPfBl3a1iWifRo42nCiLxo0tolzLmKQXLkNQAM6HOszW/BnJL7TRWDPpvon
 rl7UsTO8HzmVTD7PIOcsweop+VdGoRZWKRvJLnmNWyuRzSEErZn/WLFHY9JmUUsrGIKT
 E0u+ZT4XzXmaT5m4NheE/aGtSKXtHjVPYUgmADJD6IvL8l6/f5hd5MkdWbjoH67waPvE
 qtGA==
X-Gm-Message-State: APjAAAV99I/6SRTcZCxk2sKq/tro9y6t5azH72im3OZmNw624h67k2hb
 v7mCrP2Z1bUwVZCU5El7lXnlsB+wX3mkog==
X-Google-Smtp-Source: APXvYqwHOrjzYlMh/QAdpXjhDESOPHGYt8Rl0+ErN6TKoMGcKE1blUBtqnrRLS5VP/i/6ARI6K5A6g==
X-Received: by 2002:a0c:d237:: with SMTP id m52mr22352618qvh.160.1560801006635; 
 Mon, 17 Jun 2019 12:50:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 411/459] drm/amd/display: Do a reg update instead of set when
 writing ODM color format
Date: Mon, 17 Jun 2019 14:49:00 -0500
Message-Id: <20190617194948.18667-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+1QKq8ImXZ9qy0re/7/5WQjC70NGJIMX7QEXqU3zJE=;
 b=fJ5gyTz7ay0nCjZecsrIUPl0cPmPE/KdKSWgeV90e0VMqcaOfDW3/DTg4KZ4q0Ueg8
 vQnmCAmdvI2YuJgMfORpaZwEakhPABs50byhsvFrZkZjTkYV/cxg6+3qsNoQnFmHvKL+
 BmJQeivdw3Z/knve7nvMaEeoz6uoCdEpqK3YSnIGN1XxJeI+zlitr8brdEnsu28BEaCi
 sXyN+y1MWiTIfHbOU8lyrgDc/8oFRTGWNcJ7WCn5N+CO7uYdnUR13JeHEHcHAgjF46Fq
 h8n1uL5+bM5Fa6tYh49d9RJkcLqWskXh8YtFJXPc6sfnDgkyynhK1JCrktrPX99z9UL4
 +jxg==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>, Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KSWYgYSBz
ZXQgaXMgZG9uZSwgRFNDIHNldHRpbmdzIGFyZSB6ZXJvZWQgb3V0LCBsZWFkaW5nIHRvIG5vIERT
QyBmb3IgdGhlIG1vZGVzCnRoYXQgcmVxdWlyZSBPRE0sIHN1Y2ggYXMgOGs2MC4KClRoaXMgd2Fz
IGEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5IDVhNGYyNjI5NTE3NmJiZmM3NzZjNzVhYWYwZjZk
ZDhjY2Y4MDY5NTguCgpTaWduZWQtb2ZmLWJ5OiBOaWtvbGEgQ29ybmlqIDxuaWtvbGEuY29ybmlq
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBFcmljIEJlcm5zdGVpbiA8RXJpYy5CZXJuc3RlaW5AYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldCBMYWtoYUBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX29wdGMu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9v
cHRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5j
CmluZGV4IGQwYjMxN2VhM2E3Yy4uMjZhNjZjY2Y2ZTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9vcHRjLmMKQEAgLTI2Miw3ICsyNjIsNyBA
QCB2b2lkIG9wdGMyX3NldF9vZG1fY29tYmluZShzdHJ1Y3QgdGltaW5nX2dlbmVyYXRvciAqb3B0
YywgaW50IGNvbWJpbmVfb3BwX2lkLAogCWVsc2UgaWYgKHBpeGVsX2VuY29kaW5nID09IFBJWEVM
X0VOQ09ESU5HX1lDQkNSNDIwKQogCQlkYXRhX2ZtdCA9IDI7CiAKLQlSRUdfU0VUKE9QVENfREFU
QV9GT1JNQVRfQ09OVFJPTCwgMCwgT1BUQ19EQVRBX0ZPUk1BVCwgZGF0YV9mbXQpOworCVJFR19V
UERBVEUoT1BUQ19EQVRBX0ZPUk1BVF9DT05UUk9MLCBPUFRDX0RBVEFfRk9STUFULCBkYXRhX2Zt
dCk7CiAKIAlSRUdfU0VUXzMoT1BUQ19EQVRBX1NPVVJDRV9TRUxFQ1QsIDAsCiAJCQlPUFRDX05V
TV9PRl9JTlBVVF9TRUdNRU5ULCAxLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
