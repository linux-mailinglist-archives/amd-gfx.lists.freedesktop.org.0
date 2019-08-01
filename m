Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3A7E420
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307946E7D3;
	Thu,  1 Aug 2019 20:30:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6CF6E7C8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:13 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id x22so66741304qtp.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fSqisuXuY0boeI6/8nJLpyobMUk0tc0LXhxrvAAMCY=;
 b=UDLUIa4m+fjA1sdA4hDWINVSs9Y4fEiPB0JhINYbPF+2Ld4p8KpHqjlfn+lpb0ApEQ
 mBcvwayBvHCgBfXR5u3+pkXPBAn+97NznVC7ypc7gyjC2+0g3YhnlboCfVClUCHC6jPL
 NmFB532jAwDiNSXeyDHIbdHq6W3dm4RZ19hY1zbz3Q5uGmh7l7i/Do2hMy7xsNFO0+xu
 h3K5ULm9QF8bwx3SSGs0E97tZcmYo26zqQIE7tJDtxtP2O9btPKst1+9KCYzhNyFOoRB
 kRaKaG3JdJVLyMD7aR+OriEo6eUPfBgO9NmLbrGhEHbid1bmXzHYhP4qwCblymV9L6Kz
 96Ug==
X-Gm-Message-State: APjAAAUT3bWC8TXUzVvHz2nIJQXb5u3mnPApTmQxa8LYkVmTGUOr0Oe3
 ZTjeUwh6ADJDKDREERWL+AwCxxeq
X-Google-Smtp-Source: APXvYqxP8HOrvs5Fe5fjkKXQp9h7F+bjFJj4yJDU1UBlbNILvLTvuypQVTakrpjQHEbhpfMs5pFeLw==
X-Received: by 2002:ac8:41ce:: with SMTP id o14mr88248216qtm.92.1564691412052; 
 Thu, 01 Aug 2019 13:30:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/36] drm/amdgpu: initialize cg/pg flags and external rev id
 for navi12
Date: Thu,  1 Aug 2019 15:29:28 -0500
Message-Id: <20190801202957.29791-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fSqisuXuY0boeI6/8nJLpyobMUk0tc0LXhxrvAAMCY=;
 b=nKmInw0H0ZFojaGqitf8JSGYqT1D+duQBc9bnKjS4thGQ176vZnuujE/IIaWwKAlEF
 UPusnyiqlR9mfLf+RSs3WVKuYLQNTrF5XiWuF+Q1TJlL2r9L1GBMdoRBDvev5DlLQmT6
 tGsMbldtO9cIEXCY3JSk3Oyi47G2yp+he8elaLc97dg/ENhM23Qzhz7Q3i73XJMSTblr
 Dt0kYnourC3S2oBhr5PxrTDgRHm0wcgepoLbz/iKBv+Ts+FaTsj29LWPk1tuA5zEIwvs
 LDHwfzs1NGx932sI1rABUVMpMAMeOPWWj25u5vmkAsjnLkoQ3THLxPNClVkAArpuS+GC
 zKPw==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmRvbid0IGVuYWJsZSBh
bnkgY2cvcGcgZmVhdHVyZXMgeWV0LgoKdjI6IGNhbGN1bGF0ZSBleHRlcm5hbCByZXZpc2lvbiBp
ZCBmcm9tIHJldmlzaW9uIGlkIHNvIHRoYXQgd2UgY2FuCiAgICBkaWZmZXJlbnRpYXRlIG5hdmkx
MiBBMCBmcm9tIEExIGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFv
amllLnl1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCA1ICsrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMK
aW5kZXggMWUwODUyYzI4YzkzLi5iZGI2ZmE0Njc0YjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YwpAQCAtNTk1LDYgKzU5NSwxMSBAQCBzdGF0aWMgaW50IG52X2NvbW1vbl9lYXJseV9pbml0KHZv
aWQgKmhhbmRsZSkKIAkJCUFNRF9QR19TVVBQT1JUX1ZDTl9EUEc7CiAJCWFkZXYtPmV4dGVybmFs
X3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MTsgLyogPz8/ICovCiAJCWJyZWFrOworCWNhc2Ug
Q0hJUF9OQVZJMTI6CisJCWFkZXYtPmNnX2ZsYWdzID0gMDsKKwkJYWRldi0+cGdfZmxhZ3MgPSAw
OworCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQgPSBhZGV2LT5yZXZfaWQgKyAweGE7CisJCWJyZWFr
OwogCWRlZmF1bHQ6CiAJCS8qIEZJWE1FOiBub3Qgc3VwcG9ydGVkIHlldCAqLwogCQlyZXR1cm4g
LUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
