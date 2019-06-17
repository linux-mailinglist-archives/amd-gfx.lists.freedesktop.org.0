Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DF48E16
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A148966B;
	Mon, 17 Jun 2019 19:18:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B59895D7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a15so12168339qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laFtjtgp7i7ek4efMJT0KO07s52mjr+EWqNNUSbVxbY=;
 b=OzvdOwKbQ9w3gL9JMDoItmEsw+we2oxif5NcUYeMhJYEAcGybX7hWn9oYBvGS1yovw
 3RFmXmfy5WBjTgsm24uTGEM6inIXicYhh3Fq27lVY118WOIWiRBuJ9I9GbKP9UMYZrla
 cD3JGbAEVXd/9BRHrLv3/pnCuRwTMiIsC7xYzFf+id9qVxPCidDeOH++5wP6mSaHe05l
 wPCNMWu/M5IyeELTQpOjGPYf5SS/9l9Ft66er8nQXJWtRqdgHWaBCJQpWwQf8kVMD25v
 InpDXKu4+4jU8peppMxMLNFOMc7sI50yDQuMK5Cb1O0iUfFwfKBosaNcO403d6N7mgxp
 mRTQ==
X-Gm-Message-State: APjAAAXioZxPXtwj8DA7KQfV57uE7q/Q+J4zh1Q4CoKnYRvOqe47axoX
 VFpNROZnYrSYnZNKUxgJPRMWxA6S6pA=
X-Google-Smtp-Source: APXvYqyRF7yeZa4CTgc7IukRbTjkk0g3M7zLH6kZ8W9YToOMysZebInNvYVRb2eQordSpSa4+eNdXQ==
X-Received: by 2002:a0c:fba2:: with SMTP id m2mr23338157qvp.204.1560799103019; 
 Mon, 17 Jun 2019 12:18:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 084/459] drm/amdgpu: declare navi10 asd firmware
Date: Mon, 17 Jun 2019 14:10:45 -0500
Message-Id: <20190617191700.17899-73-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laFtjtgp7i7ek4efMJT0KO07s52mjr+EWqNNUSbVxbY=;
 b=uThjp7iXtdOzqLjDhUtiichT61ZBSCohPnOjqFtsCjknyDvYktvz/3IJhzu0il1Xt0
 08PRqV4U88sTNKSYcM46gRCIBmAC/T8urVc+wRg/7z42FOQjtynJMZ+yrltt5Y5t1RoY
 hadzUo3njGHySG9A9kH9CpRdL80X0SiiQp+3FknB6l/k2+kXXhOR6ns48Ye199RtHkSY
 aiLUUkKq5NrEJtgT8UvKV997isOlRQRt9wpBYMoCvXjA/Fjses99YgrTHPgHCvd/Lti9
 rb6xfVnxCA0vkW3mOtn037IxA9Gd0uDr5OmV8IpUCx74y88OEupP35qCfLIMz4UiD5D/
 4clQ==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKaW5kZXggNGQ2ZjA3ZjRj
OTFhLi5iOWM5NTc4N2FkYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3BzcF92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5j
CkBAIC00MCw2ICs0MCw3IEBAIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3ZlZ2EyMF9zb3MuYmlu
Iik7CiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMjBfYXNkLmJpbiIpOwogTU9EVUxFX0ZJ
Uk1XQVJFKCJhbWRncHUvdmVnYTIwX3RhLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
bmF2aTEwX3Nvcy5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9hc2QuYmlu
Iik7CiAKIC8qIGFkZHJlc3MgYmxvY2sgKi8KICNkZWZpbmUgc21uTVAxX0ZJUk1XQVJFX0ZMQUdT
CQkweDMwMTAwMjQKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
