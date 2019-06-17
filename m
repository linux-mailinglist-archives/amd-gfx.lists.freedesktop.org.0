Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682148E91
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973289829;
	Mon, 17 Jun 2019 19:27:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C02B89817
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:17 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id s22so6925670qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDTiypJyVY/Ne8eyOiCy3jzuT5MxTflNAQ42ygQNEBw=;
 b=Yz4cTZKDObMPqmWpxf9UlPLGGMm1ZgQY3TpirOCGtkPj5TTaphyUXEgygkMCvAqkYV
 VvqQqcuzsruBjnmGQcuz3S+/N7q/Gomh3n6lpgn3OUVOy8ND3jNBWJx/ng7TUhldKqzb
 hg6nn8VT0t5caT1baC29GuJGp5jza4DBf9CJ3Y/7V1qlT8qkJIOwdcOM0GhzCeSkEDdi
 KSmYOStNOuJ3oeJ/WhEvx4blmnfLF0AyXMhqa1lbtG1OX4xkMwyIGkt/xX9Ou1QrPbTG
 HciwIxVWTRqMyHn8Q6bRD4o01/JswOkfKpgrGwUwh9OqkYZnRNW9IBZzgh5/zpxaE++1
 LbNw==
X-Gm-Message-State: APjAAAUFB512m7YPFsw30XP9M1d6rtuqBsSXfKtKA2UHm/V0ZiZ0ORTm
 NwdAdsjkNTAubyYbs5pZJvyALQDJraQ=
X-Google-Smtp-Source: APXvYqwZyQ0rX7qbn4HDW1y0ktj0skZdu7wC5eKozqnLBGE0MuyeeA2loU/26Dk/kpcbxezS5CtpQA==
X-Received: by 2002:a37:9d50:: with SMTP id g77mr90208179qke.311.1560799636276; 
 Mon, 17 Jun 2019 12:27:16 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 104/459] drm/amdgpu/discovery: update definition for struct
 die_header
Date: Mon, 17 Jun 2019 14:25:29 -0500
Message-Id: <20190617192704.18038-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDTiypJyVY/Ne8eyOiCy3jzuT5MxTflNAQ42ygQNEBw=;
 b=j7phZKOVsHi+zNq53Pi7U/4zh39TNrHGBM6bT1o/Qur5Gco2G0IjsmyYj/4GSeyx78
 kfSVf30TcHt8fQc+0ZiC1d+4FwY434zq2NJACYE/wZDswp0ecttWIRBBtUpnNyqQHQRK
 Rv/U0tZW6OFH5c+9cxvtLJZuvZDLdvzKiE1rfZYcmsnffvwhgJ8uYmxUXCtn3alsta+h
 I2F7+uqx/MJGeuoMj0nvOEN6jBjpycrEXBg0no9III+r78Zo1vsNJZIZNIhsAB/P9aZ/
 HH1aeQmdQw9l9G7xClgpTW6Ejxw1MY3I8obWHsSuZQk/1iX8oAPgNdAGxSP97k/cejBJ
 XQuA==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2lu
Y2x1ZGUvZGlzY292ZXJ5LmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNs
dWRlL2Rpc2NvdmVyeS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5o
CmluZGV4IGUwMWQ0Y2Q5ZjJjYi4uNWRjYjc3NjU0OGQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2luY2x1ZGUvZGlzY292ZXJ5LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9p
bmNsdWRlL2Rpc2NvdmVyeS5oCkBAIC05OSw4ICs5OSw4IEBAIHR5cGVkZWYgc3RydWN0IGlwCiAK
IHR5cGVkZWYgc3RydWN0IGRpZV9oZWFkZXIKIHsKLQl1aW50MzJfdCBkaWVfaWQ7Ci0JdWludDMy
X3QgbnVtX2lwczsKKwl1aW50MTZfdCBkaWVfaWQ7CisJdWludDE2X3QgbnVtX2lwczsKIH0gZGll
X2hlYWRlcjsKIAogdHlwZWRlZiBzdHJ1Y3QgaXBfc3RydWN0dXJlCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
