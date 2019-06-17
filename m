Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF00248E2B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A368976D;
	Mon, 17 Jun 2019 19:18:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F98970E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y57so12216953qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDTiypJyVY/Ne8eyOiCy3jzuT5MxTflNAQ42ygQNEBw=;
 b=iN/6eqX1O89MQcSmT2mQs0IYWzCdRqxpulNpLZvVoGQJ1PpwCZhOSXrc0E74cpW33v
 T+Mz7pGdvo75vkCIRnS0Yhf84iq6kcFEgPo8K3IHESxc1IzMGYVs/CWp5lkoCy5uUa23
 VLy1B6kCz299dCN/UANCDKSSBnNLTdARQ9ddmX7ykSDsSgEqNujlrJzGlATa3AlPAEyF
 wZ5VIF1JlwwmfhK7kDRhrPgYNG9LEX7efcmgcSFyDZt1kfKZP5YPdpCl8xm4zue/ptFc
 aTHfzK8SFZpOHg43puWfg+nFJWwi+DAL+nawsK+N9E5yAd3GXlSUtwMDebkM8WaGuZJx
 8dRw==
X-Gm-Message-State: APjAAAXlogOoBlPpeXv36Z4AvJ8PO6xB47bUMi0BRW7dPq1UkOvC4CRo
 M3ijrJCvy2N44JuKAitLYd0SEYA1sXM=
X-Google-Smtp-Source: APXvYqyaNP2mYmmhQFtnM3lOWsEV4kGvLO4Bzl9oolKQzJflytKHVmhFhhccmEWGB6FDYD2maL2SSA==
X-Received: by 2002:a0c:fba2:: with SMTP id m2mr23339709qvp.204.1560799120505; 
 Mon, 17 Jun 2019 12:18:40 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 104/459] drm/amdgpu/discovery: update definition for struct
 die_header
Date: Mon, 17 Jun 2019 14:11:05 -0500
Message-Id: <20190617191700.17899-93-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDTiypJyVY/Ne8eyOiCy3jzuT5MxTflNAQ42ygQNEBw=;
 b=XRf+LxXjbsung706KlL3zTwyxhD/tvRuvEoSApUVTAlfqy/hEopPSMLOxvYwrAc7YK
 0VH1dJqXVBee772XsJkIZNyBOszWXC9RcnTLiFvrLhs6wezgDZ9orjqUazh9KXoSwiJA
 Zx2L2/8olhECRYY3vVUcDut9FrIA8OY65Hj0tMc7wrkDRiIjgYipedUsiaPeUUl4Bz14
 bohJIdJat3v52EzrStulct3B9139e5MCho4mjWi3Gpvcrzxb+ulhGn8ILrvsvRwGRO2+
 wt2fZRBZzi/htakkfM6mpsVIsM+ozZxiV0PosjlctGBBJcuIe9wJJhcI/+bb9i15PLbr
 B3HQ==
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
