Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39E15F1D
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2019 10:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299FB89F75;
	Tue,  7 May 2019 08:15:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CDA89F61
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2019 08:15:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n25so18605162wmk.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2019 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoYT2hHMrYQEC4CQx+FjWhBLa6BIb+UBkeO3tQb+qow=;
 b=HQX8CGR70Wssqc+nRVQQrLpQ/CB+F+tROvvu5HEXEkESOwJE5ylck8l8XtbFKxW4yM
 AsN55F2CWxjhgw6p9WR2cwrebY8t/xUIC9duLQQveG2kk6ECXslPSmoW9/YzAgsO09i5
 Sm9dZpRjsXCvQgeFdjU1Uj2xUVUfO8Ij4P5f+sGT/0Int3MYZJ0vQ/Iyt6wQdI7BvXjV
 nrgdY/rsHsHn92uvksHeZIlGtfNQErpN0ntdlfsbHrUG7UJMrv3xcXFqHpdgDp20zLBJ
 G78v2EHQKJzc8u3Khhef8KbwEFwybhfTlD6wG/FkYKGEv0CKOUuf6MmpCyKH4dFcHsfE
 ws1w==
X-Gm-Message-State: APjAAAXscOBePtaj3D8GGiS9v5R+5NrIPDynHHpTjCQcGMjSdTU3qrlC
 Y13PW0i3om+7SLGRg7sCDeA+r/fg
X-Google-Smtp-Source: APXvYqydiJhTSh7pCufvyk9UtEbZ1fAio/BmLz7aSb4Z4rjWMu79bys32IWMyH6mauWzxejIdMG+lQ==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr20950227wme.72.1557216918400; 
 Tue, 07 May 2019 01:15:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id v16sm15065476wru.76.2019.05.07.01.15.17
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:15:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Tue,  7 May 2019 10:15:09 +0200
Message-Id: <20190507081512.2619-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081512.2619-1-christian.koenig@amd.com>
References: <20190507081512.2619-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KoYT2hHMrYQEC4CQx+FjWhBLa6BIb+UBkeO3tQb+qow=;
 b=N0lPTzNSrgujAaIxe0MCaNQeLXRv8R10Ly8F486tc5jINDL0IsMymWv/KjVxX3kL9b
 PJrPD62s6r4x7LkgWt+j+mgWyI+Q16QBS+qBi5+ym5UScKMsLX3S9pfxyrHrZaiSpgnk
 4ykPnrQzpPeq5UKOEZvV1GT80lYzuDgB7rAm4EeXhbr6FfRwvzOLfDOL5OPokK0uluyE
 tHe4WmcUxsG/aX+Ls5jPXhfyAg6L/o9jZZHiZZEq26Zds9F677C935/zgxmj3Y2LvLBL
 +Wal6jsPnA2aCaw9A2sfJ8mQGOoPrqHd9QDbfszmgf+SI0SSm+U+lGXLo9B7I6MKpYay
 FZXg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXZvaWQgdGhhdCB3ZSBwaW5nL3BvbmcgdGhlIGJ1ZmZlcnMgd2hlbiB3ZSBzdG9wIHRvIHBpbiBE
TUEtYnVmCmV4cG9ydHMgYnkgdXNpbmcgdGhlIGFsbG93ZWQgZG9tYWlucyBmb3IgZXhwb3J0ZWQg
YnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IGQwZTIyMWM4ZDk0MC4u
ZDYyMjNlNDFlMzU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAt
MjYsNiArMjYsNyBAQAogICovCiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgogI2luY2x1ZGUg
PGxpbnV4L3N5bmNfZmlsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRl
IDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9zeW5jb2JqLmg+CkBAIC00MTIsNyArNDEzLDkgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
Ym9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJLyogRG9uJ3QgbW92ZSB0
aGlzIGJ1ZmZlciBpZiB3ZSBoYXZlIGRlcGxldGVkIG91ciBhbGxvd2FuY2UKIAkgKiB0byBtb3Zl
IGl0LiBEb24ndCBtb3ZlIGFueXRoaW5nIGlmIHRoZSB0aHJlc2hvbGQgaXMgemVyby4KIAkgKi8K
LQlpZiAocC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQpIHsKKwlpZiAo
cC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQgJiYKKwkgICAgKCFiby0+
Z2VtX2Jhc2UuZG1hX2J1ZiB8fAorCSAgICBsaXN0X2VtcHR5KCZiby0+Z2VtX2Jhc2UuZG1hX2J1
Zi0+YXR0YWNobWVudHMpKSkgewogCQlpZiAoIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUo
JmFkZXYtPmdtYykgJiYKIAkJICAgIChiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVf
QUNDRVNTX1JFUVVJUkVEKSkgewogCQkJLyogQW5kIGRvbid0IG1vdmUgYSBDUFVfQUNDRVNTX1JF
UVVJUkVEIEJPIHRvIGxpbWl0ZWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
