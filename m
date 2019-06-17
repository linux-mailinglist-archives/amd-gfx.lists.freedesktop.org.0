Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AAF48F98
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9663089D3E;
	Mon, 17 Jun 2019 19:32:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5F89D3E
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:38 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id m14so6945583qka.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iy5r+vKQrr/pPm6HU3whb9RaoE2oOfWbMLI9rKIBRQ=;
 b=llpYmo058MYIiO5t7P14ptAuWJ7WuKSJ8M9c1brmuUJnaZd0bsJJ7v+eXPemw6yBeQ
 P9P/UTaUWGdpBq4K87dBKTcJSdQOOx1/Qe+jxRgQnl2XWM5LXF/tckJYEfyXv9m0XTxU
 ZGK/LRfv4Zws2seGVH1R73se2HQ/Tn52hc4K8UOFm2FFHgSmd7sFW6EZ36sCke9Dos21
 tOMp/80ifgWrQvltOBUIs83bf+0CbxxhTEe3nyUUioCiPiD0ZcFPmpg4ArrVJcxJhJiH
 mJ7exoT4LijSpKiix/OR1MObv0KA5TaEOyn3g6IyWZ6fnOsTvCYDhQNxwjoQv0F/LnGV
 nYPA==
X-Gm-Message-State: APjAAAW670ukDqfkBVFUv5gLW/GUo+G1Z1kLOh06ObZZ++pVcHPPRHz5
 +6iMElEBX37PikYjI0zxpDv6yafvUcw=
X-Google-Smtp-Source: APXvYqzXzdU0fOIEJlXfNULnifC8vhYzn8/XEywwTAv7G+goJjWX08VdYn5tuixLjCtw1WmVfubIuQ==
X-Received: by 2002:a37:9a97:: with SMTP id
 c145mr88040105qke.309.1560799956704; 
 Mon, 17 Jun 2019 12:32:36 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 292/459] drm/amdgpu: enable VCN2.0 DPG mode
Date: Mon, 17 Jun 2019 14:30:59 -0500
Message-Id: <20190617193106.18231-93-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9iy5r+vKQrr/pPm6HU3whb9RaoE2oOfWbMLI9rKIBRQ=;
 b=t8l452vV5Z54cw80d50DkKUX/JVvcCAVXboeoOevk+rmo3MZyNX4j89WCVmFlHLcTI
 kW6RGqovRXmBgMnIwIos6l5sd+bFz/BCy6SMcL3jnC9JvEoomjiYhIqPGBQWyBF5iC0R
 4LtJ/JiqfPxb6yJBs1/eE05e8dvRsOrnLri+r0xMgb8x9GWj+Frh8PjJNzJzyo3fNuBc
 lKJjQW1+iw95XfXKTBummg/EmpAKZ64xsZrFcw9oIdzOJK+iQanI+ytAPkxRiRmfZ7XG
 BSBwGIWcdeXPaZKrBi2w4NtYEeZYn6L6L8fGCFkeitYWJEOr/vABuP2XgBq2di/CAQJr
 zKWg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKSXQgd2lsbCBiZSB0aGUgZGVmYXVsdCBm
b3IgVkNOMi54IGZhbWlseQoKU2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29t
PgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpS
ZXZpZXdlZC1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCmluZGV4IDcwZDg0NGQw
NmUyMC4uM2NmYzE1YmU2ZmY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKQEAgLTUwNSw3ICs1
MDUsOCBAQCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJ
CUFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JUX0JJRl9NR0NHIHwK
IAkJCUFNRF9DR19TVVBQT1JUX0JJRl9MUzsKLQkJYWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQ
UE9SVF9WQ047CisJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOIHwKKwkJCUFN
RF9QR19TVVBQT1JUX1ZDTl9EUEc7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJl
dl9pZCArIDB4MTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
