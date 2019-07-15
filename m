Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2AE69E19
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A894789E5A;
	Mon, 15 Jul 2019 21:25:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B273989E65
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id t8so12886957qkt.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Gbp7KaVwLxpaLoZz0njQoDmTO7DMKuKtoeNJ94miN8=;
 b=JHHLXpfOaBqLxPrFFXxO4Zvo426k6rgVsPoUnRj0VuW0HkxGuy6yfzCRDm+Z9qW8+i
 E8hHnQyYEDkud5GqZUJyCTcgoaw7WJrGAGumapuM8G/GiNXMOrjSQO+fC0abGRwAFIh6
 DLg9J/LSHIPB1FPbI9l/EtdatlRag1vWKjZSSCTKXYdJ9ANr2ZkzLvvKz1jAUFU1IbfV
 oQBivunomHqsjZLYEtmBaTPKZ2GH6hURFe7tqCQUtml6QyLWi8Z6M+5j141iPqEpGhX8
 PgVzSmerVFrwf6z3PzTzCRjQE4cS/1PScox2GlWju44wxdWhAHkw4ZV11weJBbxe3Xci
 mEDQ==
X-Gm-Message-State: APjAAAW+Sm7T38ntJ9y2W3Yd46u/Df0aqHpi8LSxuKb2knlKIqbR657k
 YFMiSWq7ttmED/YgwMJmjlvaxCPa
X-Google-Smtp-Source: APXvYqwT08WDZb3RQRskKGt1PFPxHo06wABHa7Ns3No0CZvpDCu7Zx1ycyk6oYeolCab3RwBPlhxeA==
X-Received: by 2002:a37:98c3:: with SMTP id
 a186mr18698087qke.498.1563225919606; 
 Mon, 15 Jul 2019 14:25:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 039/102] drm/amdgpu: correct programming of ih_chicken for
 Arcturus
Date: Mon, 15 Jul 2019 16:23:34 -0500
Message-Id: <20190715212437.31793-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Gbp7KaVwLxpaLoZz0njQoDmTO7DMKuKtoeNJ94miN8=;
 b=pkdF9mWNDrgHiEfY4aQkJqkXSqega5gOOjelIAf3+vS4sVczxrXGri6d4FmSh6SXa1
 17zNztsBgV3C/ibiscRSAH6nuGVVFaNLRIHtbWnQfOjc/ufiwHBXhdNyJpX8dS1cemkp
 3+sgEgTeYriunpSeTPpWFLKRnf4W1OkXkxmMXmQOj1+XWZMnkJnHpdpQL5nzt6S6BnSo
 dgDHrL5SLFjfrqVGRCuFopk1NSivYw2bMjxVzHVkCqM0NrKmT0E2W53XwYb/JbHvRK6w
 eFKryFzmrgnq4d4B1xe/NOgd7wdd7VDWiU2VABbAjZ6aJcgIrAveqvXnw37wz9Hu3cA8
 pDrg==
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
Cc: Snow Zhang <snow.zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgppaF9jaGlja2VuIGlzIGEgcmVnaXN0ZXIgdGhh
dCBpcyBub3QgYWxsb3dlZCB0byBhY2Nlc3MgYnkgZHJpdmVyCmluIHRoZSBMMCBzZWN1cml0eSBw
b2xpY3kuCnBzcCBibCBuZWVkIHRvIGVuYWJsZSBmaWVsZCB0byBhbGxvdyBkcml2ZXIgdG8gdXNl
IHBoeXNpY2FsCmJ1cyBhZGRyZXNzIGZvciBpaCByaW5nIG9uIHNlY3VyZSBwYXJ0LgoKU2lnbmVk
LW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+ClJldmlld2VkLWJ5OiBTbm93IFpoYW5nIDxz
bm93LnpoYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMTBfaWguYyB8
IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9p
aC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKaW5kZXggNWY1NGFj
YzcwZmVjLi5lZTljZDg1NzkwMzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZlZ2ExMF9paC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9p
aC5jCkBAIC0yMTcsNyArMjE3LDcgQEAgc3RhdGljIHVpbnQzMl90IHZlZ2ExMF9paF9kb29yYmVs
bF9ycHRyKHN0cnVjdCBhbWRncHVfaWhfcmluZyAqaWgpCiBzdGF0aWMgaW50IHZlZ2ExMF9paF9p
cnFfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2lo
X3JpbmcgKmloOwotCXUzMiBpaF9yYl9jbnRsOworCXUzMiBpaF9yYl9jbnRsLCBpaF9jaGlja2Vu
OwogCWludCByZXQgPSAwOwogCXUzMiB0bXA7CiAKQEAgLTI0NSw2ICsyNDUsMTUgQEAgc3RhdGlj
IGludCB2ZWdhMTBfaWhfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCVdS
RUczMl9TT0MxNShPU1NTWVMsIDAsIG1tSUhfUkJfQ05UTCwgaWhfcmJfY250bCk7CiAJfQogCisJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTICYmCisJCWFkZXYtPmZpcm13YXJl
LmxvYWRfdHlwZSA9PSBBTURHUFVfRldfTE9BRF9ESVJFQ1QpIHsKKwkJaWYgKGFkZXYtPmlycS5p
aC51c2VfYnVzX2FkZHIpIHsKKwkJCWloX2NoaWNrZW4gPSBSUkVHMzJfU09DMTUoT1NTU1lTLCAw
LCBtbUlIX0NISUNLRU4pOworCQkJaWhfY2hpY2tlbiB8PSAweDAwMDAwMDEwOworCQkJV1JFRzMy
X1NPQzE1KE9TU1NZUywgMCwgbW1JSF9DSElDS0VOLCBpaF9jaGlja2VuKTsKKwkJfQorCX0KKwog
CS8qIHNldCB0aGUgd3JpdGViYWNrIGFkZHJlc3Mgd2hldGhlciBpdCdzIGVuYWJsZWQgb3Igbm90
ICovCiAJV1JFRzMyX1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9XUFRSX0FERFJfTE8sCiAJCSAg
ICAgbG93ZXJfMzJfYml0cyhpaC0+d3B0cl9hZGRyKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
