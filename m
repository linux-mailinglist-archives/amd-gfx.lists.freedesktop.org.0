Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07B5D782
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B739B6E082;
	Tue,  2 Jul 2019 20:29:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3111E6E082
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so1992qtn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USB8vvXfc8ozQ27foqhVPme+9fjKBlrnz7TZCWsMNCY=;
 b=YaRc2VJg+O/Axp+T2x6EyNSJOKPBrwHc3nVvRVpAs4D0xNpeKqGrIWkOdLHO43Gu6B
 H1titD3EWXAh7AjBc1bwPIGsjAMND0xqKl0RWTtB9fAEVNmaRFExZtS2vI0zoXQpO1gu
 GYZfUe6rPDguyiD+hBHK/dZ52HnmBGm/its9/p5zJK7Vs2yyRpXxZdQBGPx+acPlFm4Q
 rHoPjJT8Mvy/FZUh9Q4Oh8F+SOyJPFqiz5MR5yUixhZk8Rxa6+C3neXCZYSA80GF2Wvp
 BxApespMFIEQ4jiF/nNCxeG0fg5MF8D2xKGsOtTssHcbyIhyasodFGT5g5sqTBrd8HDR
 QC9A==
X-Gm-Message-State: APjAAAUDjsQfN687yCOgs7BdQqs2JhfEMgV/qF8PSaF7ljCjwkwEs9XZ
 MEtE2RG8P0cmji88C2x/GLMP0lOYDII=
X-Google-Smtp-Source: APXvYqw0/B3YZL6I/q70JkWz+GVrfoa1Ci+Q3iJhhPmXYcD8VYqxGx7Hi4KAalsoWGwEbJ1DBHRM7Q==
X-Received: by 2002:ac8:2c17:: with SMTP id d23mr26507249qta.385.1562099378087; 
 Tue, 02 Jul 2019 13:29:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 48/53] drm/amdgpu/nv: set vcn pg flag for navi14
Date: Tue,  2 Jul 2019 15:28:39 -0500
Message-Id: <20190702202844.17001-49-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USB8vvXfc8ozQ27foqhVPme+9fjKBlrnz7TZCWsMNCY=;
 b=UOlizIwGtCdyAEklOMV2OmRWFqF3Mnj3k6doMGBvWwDw0dr4a8st4AWx8uTdZ0uVFk
 TKDODXT7gD2PdsKFlZ2s7nqrNbgOF4PnZcyG+5pUklaIqVu2bskr8qz75j3T0wiJjnSc
 Oh4tZEEc82hI3PaS9mjA6P4CZP0Fnb5pxVslrS8DMaqZY3yA+Zvdg6UMLcKPf1gy+6MY
 26tZJc/rI2AR00PTxAyTDJyDk/pFaejxB0EuLyCnO0o6LxeJfrkeaLW9YTWM4cETt42l
 xcrgnW2RxK3DwC3p6xjyfObutACOGbE9KQ3EvvkulI01cZnxl4t8aL/29eErBeNlh1MB
 ImiQ==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkVuYWJsZSBWQ04gcG93
ZXIgZ2F0aW5nIGJ5IGRlZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9q
aWUueXVhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9udi5jCmluZGV4IDljYTgyYjVlODdkZi4uMWIyYjU1YmUzZDE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L252LmMKQEAgLTU0Niw3ICs1NDYsNyBAQCBzdGF0aWMgaW50IG52X2NvbW1v
bl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCUFNRF9DR19TVVBQT1JUX1ZDTl9NR0NHIHwK
IAkJCUFNRF9DR19TVVBQT1JUX0JJRl9NR0NHIHwKIAkJCUFNRF9DR19TVVBQT1JUX0JJRl9MUzsK
LQkJYWRldi0+cGdfZmxhZ3MgPSAwOworCQlhZGV2LT5wZ19mbGFncyA9IEFNRF9QR19TVVBQT1JU
X1ZDTjsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHgxOyAvKiA/
Pz8gKi8KIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
