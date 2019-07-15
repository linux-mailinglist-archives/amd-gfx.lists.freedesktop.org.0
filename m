Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4869E1D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353E089E9E;
	Mon, 15 Jul 2019 21:25:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443DC89E5A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:22 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id d79so12832558qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dntlBhC8NcKyqpSiLnBuebjehF80WGiRgNH7tzfWg+U=;
 b=o0A0wcw8gZp3gvC4nxmQjljIj/sZN8kyoIv74Ff5LK9Sj63+NBkMI558u/zccKgXjT
 HQnBgdPHW2MRBu4zerkhzz0Nqdmz9Izb7ElgRm4XTRlTj3vSsZZxzOcIkvs39h8cAJNT
 jHPV4UonMZ64mp2fx2pK6N7usYtu9UgM4KyX4YUvGUT6D3T8AW6+xJic0vy+qoqF7pLA
 dgvYMK2zF9elKhQ8lYBNpwnWu0BDiLYo5K6Rf39AwO2MpxWowspuFQ7wd50Lh9GzSkFH
 6VXCxmTOdNJlUhsOqsWe4sdA/cuBNvTDHWyAQL65TWBreLJ5vVZA2qJhH11cbtMRZeRv
 O3tw==
X-Gm-Message-State: APjAAAVw2bcQykKUx1RsE/VCFf3c3+2EiyM0tq4G9FxWDiEmtQ1Wyd0f
 /D/Dv5c4Mha8Z0AtefLfJ1CBlQgx
X-Google-Smtp-Source: APXvYqypALTYPtnFNeIbx/xNUs7IuSbwjD63lBiGMJczZdOTqOT9imO2VOLwT4r9fMalRqNVlM8XEQ==
X-Received: by 2002:a05:620a:52e:: with SMTP id
 h14mr19112998qkh.358.1563225921259; 
 Mon, 15 Jul 2019 14:25:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 041/102] drm/amdgpu: Initialize asic functions for Arcturus
Date: Mon, 15 Jul 2019 16:23:36 -0500
Message-Id: <20190715212437.31793-39-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dntlBhC8NcKyqpSiLnBuebjehF80WGiRgNH7tzfWg+U=;
 b=L8a+01HFkwi4b+jpdWCOhO5nnqKguKS8ySfWbb02q9l/ylHXtnPpWFyWzO12NBKMt8
 p5Hte4x+5rxHGw/G63rfN5OhDDsBJ2WJQt8gXgp/1VFd5K3FDxxvKmYHnUC4EfuQMlzr
 XItFu5imavi67TiAUu+G3TjK8IpAUAIOmfR9vxDRE99Kz+FJJdMoo9trBEfaHGUHjFKn
 fIlzC1OoueNvCkv5Pkjn61900kHWU0TGP+tMj0Tc02UPnYr0dn6xNuimnE/2P3oQQUQ8
 VtHc54OorxF5Mib4ApItPvATxoj8yuV5keX5BSwjLjvoNPSruf6feng/HDSo0MYJg16a
 mXHg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpBZnRlciBjaGVycnktcGlja2luZyBk
b29yYmVsbCByZXdvcmsgY2hhbmdlcyBmcm9tIGRybS1uZXh0CmJyYW5jaCwgQXJjdHVydXMgYXNp
YyBmdW5jdGlvbnMgcG9pbnRlciBuZWVkIHRvIGJlIGluaXRpYWxpemVkCnRvIGluaXQgZG9vcmJl
bGwgaW5kZXggZm9yIEFyY3R1cnVzLgoKU2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5n
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpp
bmRleCBiYjZhZWQyMDZjOGUuLjhjODgxNjk3ZDI5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9z
b2MxNS5jCkBAIC0xMDExLDYgKzEwMTEsNyBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJs
eV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJCQlBTURfUEdfU1VQUE9SVF9STENfU01VX0hTOwogCQli
cmVhazsKIAljYXNlIENISVBfQVJDVFVSVVM6CisJCWFkZXYtPmFzaWNfZnVuY3MgPSAmdmVnYTIw
X2FzaWNfZnVuY3M7CiAJCWFkZXYtPmNnX2ZsYWdzID0gMDsKIAkJYWRldi0+cGdfZmxhZ3MgPSAw
OwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
