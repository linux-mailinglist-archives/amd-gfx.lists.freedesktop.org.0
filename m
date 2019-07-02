Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D050D5D757
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A376E040;
	Tue,  2 Jul 2019 20:29:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189596E046
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:03 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so26016qtk.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5oNEXSZKjvXBk9SmJslAlB3iHnl6QAhZbXwsCnQsGvM=;
 b=r2mv/5v9oLhbuJjNkQoy8E6mjtPegUQ7qxPOC9wUHFT0fi7KTv8gqycL+fHawseZCB
 I2yZL8R+jObP/GQ4ll/qLEY/97KffcCzEnY+42jvjU2QDeERVZifnarh5jwUqMFBr9L4
 HoeeFXLWvgxV0F/I8dRumoG+rY87Ks1JVdcyeOBD8suHlYWoygxwSUxw7zEcnt8Guhw9
 RGFqcYR1iLGJ357vOMtnOC41gMCBQdbRtYAJX8YcKT7OK3pOdPF+MM8crP4CWceXVZub
 4+mpdiWqTLzFDrsW8Ox6HBwOIdv3QPYw0uhuXAeUQwpHwayy4/I4DorWKgKwZ/LGHBYp
 EQsA==
X-Gm-Message-State: APjAAAXiPS2lDl+3AwFEsVh+re8DZODratoj4Hoea7OTTWVDaEDsjMsG
 1p53cgDYVQXpo2iXmi/1wFQgTk96p+g=
X-Google-Smtp-Source: APXvYqwJpUVVXlk1P8JRkLA2pP7OPFYjChW96zRr0OQ9cTxabyNyh5g3nsLCDFRqpTquvovLlMf53Q==
X-Received: by 2002:ac8:1688:: with SMTP id r8mr26802068qtj.380.1562099342000; 
 Tue, 02 Jul 2019 13:29:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/53] drm/amdgpu: increase max instance number for hw ip
Date: Tue,  2 Jul 2019 15:27:58 -0500
Message-Id: <20190702202844.17001-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5oNEXSZKjvXBk9SmJslAlB3iHnl6QAhZbXwsCnQsGvM=;
 b=j2oJypcFtE0nh4RRFjubhRcpctYyJc8eqqzuqB7CbTsUuKHjeUjeRtm4jPOUbDmjEf
 f4RCG4lS/MPtwhxSfVjTrc3IS8gPvQsGc/6oFPtbfL/GYVKbyBdKf3JNZkH/e36NWEqM
 TQMAJ1SrttZN/O3Eken0okJsn1BOBulX7Ga5F9il9Dc2f8QKhhdbidgMhSLDYD7shDij
 uhV9gmVcUUgTBfA8sNCizAVbi+nX7k+iwKoNousaN7EJX0Cp4IJ433gvUwTE5aEnmSo5
 2g3q7HhWne7ncoFfX839e9LPzboD4PnrRJ/KOuJf7aJS9WIaFvNT2g0HMdBk/XoD5u8h
 BSmw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCm1heCBpbnN0YW5jZSBu
dW1iZXIgaXMgNiBmb3IgbmF2aTEwIGFuZCA3IGZvciBuYXZpMTQsIGFuZCB3ZSBpbmNyZWFzZSB0
aGUKcmVnX29mZnNldCBhcnJheSBzaXplIHRvIGF2b2lkIG91dC1vZi1ib3VuZCBhY2Nlc3MKClNp
Z25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2Vk
LWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5k
ZXggNTQzMjBhN2QxMGU5Li5lNjQ2OWUyM2I3NmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oCkBAIC03MzMsNyArNzMzLDcgQEAgZW51bSBhbWRfaHdfaXBfYmxvY2tfdHlwZSB7CiAJ
TUFYX0hXSVAKIH07CiAKLSNkZWZpbmUgSFdJUF9NQVhfSU5TVEFOQ0UJNgorI2RlZmluZSBIV0lQ
X01BWF9JTlNUQU5DRQk3CiAKIHN0cnVjdCBhbWRfcG93ZXJwbGF5IHsKIAl2b2lkICpwcF9oYW5k
bGU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
