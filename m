Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBF48DCB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E84A892B9;
	Mon, 17 Jun 2019 19:17:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A9F892B9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so12134333qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vfv4EceOTAAg0yMgA0X87FJ0yakmxDGv+Cc4r2PX8D8=;
 b=Faav2gyYVi3Xdvy1/cRXVxyu12HJ9mJWhTjvKZY1UyumzvqY8IQFHY/S3g88VWwi0y
 E3HyWPY6rdCOvYHJNsw0S4qoO77WgfUAsmQAIayTtX9Zgf6fpsgPqGrwZtEsUrSbSudA
 Xb9IA0281QRDVNgaSJjEo//hO5sodv59ejSZxNa6djdqiauX2W1qAnyOWgSWP+tIJjEq
 NSuVZ6YrQVKZfPTz2KaeC496ltDvh0u2Wx+wJlyC5H1/ycVA6uFm20F7Ff37tnOb92pY
 y431j6Ho0og4Jv4UNtK9LXA6pW74GmZdAI/N08w4rhTRzwMPNyWI9Mkt5pw2TMkqctvz
 PN8w==
X-Gm-Message-State: APjAAAUmxnVs8YZB6YHkAA/BMOxLNhvccuninrkhIThBDILzvCasGEnT
 DLO3khvRlud4tpeqhOJIyuDEMvlI9l8=
X-Google-Smtp-Source: APXvYqygreLX8tljL8Zn+et/hosjCM/RMayvVcK31lx3pafsOvNNF+F4XbGt4DqHIJ3/ttxYyuUuBw==
X-Received: by 2002:ac8:28bc:: with SMTP id i57mr64165492qti.288.1560799041967; 
 Mon, 17 Jun 2019 12:17:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 020/459] drm/amdgpu: add gfx10 specific config in
 amdgpu_gfx_config
Date: Mon, 17 Jun 2019 14:09:41 -0500
Message-Id: <20190617191700.17899-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vfv4EceOTAAg0yMgA0X87FJ0yakmxDGv+Cc4r2PX8D8=;
 b=g5NYTK/tiaRabLRWs2kV1zHl/f/OSMzRdZQXYRuQHwvoXTv/xdMDulROQSzqOVXAm0
 QS4F8zBmzFb57QsIifilUr1qZ2nbESgfczQ8zFXTSteNS2h8HU3gwbtl9HxRxkDPP6jN
 9lQQX1HrBjxAXfiCJ6EGu4xylDPMEgvA4zHB4rrr5eizRu/Y58E7ozgSl1WSz64AEcXl
 pyuQQl79l2P5N9OhfpV28ete089Y1J/U9q4Io7X7t/teYTTE2TXEbA3Zip92oIC1RsS7
 iA/cZeRddsSnBK69+Dqf0leTBn+GnKj8vIz3hbv4x0S7kazIfnx1Cvlf5H8LOvh7bno0
 VInQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKVGhlIHR3byBtZW1i
ZXJzIGFyZSB1c2VkIHRvIGNhY2hlIHRoZSB2YWx1ZXMgZnJvbSBncHVfaW5mbyBmdyBhY2NvcmRp
bmdseQoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZ2Z4LmgKaW5kZXggMDlmYzUzYWYzZDM1Li45ZjU1ZDQyOGFkYjAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTEzMSw2ICsxMzEsOSBAQCBzdHJ1Y3QgYW1k
Z3B1X2dmeF9jb25maWcgewogCXVpbnQzMl90IGRvdWJsZV9vZmZjaGlwX2xkc19idWY7CiAJLyog
Y2FjaGVkIHZhbHVlIG9mIERCX0RFQlVHMiAqLwogCXVpbnQzMl90IGRiX2RlYnVnMjsKKwkvKiBn
ZngxMCBzcGVjaWZpYyBjb25maWcgKi8KKwl1aW50MzJfdCBudW1fc2NfcGVyX3NoOworCXVpbnQz
Ml90IG51bV9wYWNrZXJfcGVyX3NjOwogfTsKIAogc3RydWN0IGFtZGdwdV9jdV9pbmZvIHsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
