Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072FE87E9A
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BB36EE46;
	Fri,  9 Aug 2019 15:53:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFD76EE40
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:22 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s145so72007078qke.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p0+upEij8e5pVHy51zb0VhAmdCVs8KLcfBEtz/ubpkU=;
 b=dXRAZ7uKaB3Rb4mXaYDtrGk7wpJ+kT+QnIVe9KMZxlS0ppTJRI5y1vjlq8qu0H85TW
 DJmtevadZUTRO6+TfnG1XLK/uKcHsO2H7RaHkSqTMHQFEe0BodxMgAEazfqNabdMEHk2
 MXtV76c/3tRoEPDBGiwbzaINDTfIVmwRB+V7Ex+hpcZeON64tR8pb1THqlw/j4Rlr6EF
 oyyvF1UTU91F1OQOJz3ldQtUEW8HmH888Q0zPToYWEksPz/+y5gRD8Qhx7LPHF5qHTYF
 csIIgCyoMbAX1IVCGM13QDuVJFovokPu+7hP3CKM3AbrxeqfUAKz8ERdgvMMw0HmIyYF
 hr2Q==
X-Gm-Message-State: APjAAAXqPwB7SdiNVUzWg8UlVHHX1V7vBhi1upM7OYJEV5tE0I1j89Ch
 2nBegRw2VnFX/hQQceXSa73KEk5P
X-Google-Smtp-Source: APXvYqy9W4c0kayXBrVTEu/n6a94Gp2HEfb0Mm1TgRSTrjp2Dc1+IaDQGP3+TVb4NShqovPwCmtMiA==
X-Received: by 2002:a05:620a:4:: with SMTP id
 j4mr18691748qki.269.1565366001200; 
 Fri, 09 Aug 2019 08:53:21 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/27] drm/amdgpu: add asic funcs for renoir
Date: Fri,  9 Aug 2019 10:52:48 -0500
Message-Id: <20190809155302.4733-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0+upEij8e5pVHy51zb0VhAmdCVs8KLcfBEtz/ubpkU=;
 b=Z6pal1oYwftSx57CgPutpyDe1qXB9jrYvi9RIXd2XLiauKr8xhUV7C/Dv8Do1WGWjg
 QVclWYtWox7QYFtFnUi3GlSt2uo6Rk6AN8jW44J4XYuisnN6m8sJvea++BIg7H4wv26q
 mWj1ajpxPAwKq+6xEiuc33Yx/Z5+pmZBa74ESu9ndZHDioMJP6WEJ1QrkR/Txk947DXk
 HYY5Nh2JqpU9GKi5IBF5EJTZTS5/rsJfIs+4Xs1YuV1jcCnf5yb5+q1cTPVU6c1zGiMe
 +OTvpGabh5wghYll70DomaubiEgWyFhO4UdSq79Ck/eO56Xk1sVCrOqAPlvI8vm4B6h1
 Texg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCmFkZCBhc2ljIGZ1bmNzIGZvciBy
ZW5vaXIsIGluaXQgc29jMTVfYXNpY19mdW5jcwoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxh
YXJvbi5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwppbmRleCBl
ZWMyOGVmODEyOWEuLjkwYjQwY2M0ZjZiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5j
CkBAIC0xMTMzLDYgKzExMzMsNyBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9lYXJseV9pbml0
KHZvaWQgKmhhbmRsZSkKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsg
MHgzMjsKIAkJYnJlYWs7CiAJY2FzZSBDSElQX1JFTk9JUjoKKwkJYWRldi0+YXNpY19mdW5jcyA9
ICZzb2MxNV9hc2ljX2Z1bmNzOwogCQlhZGV2LT5jZ19mbGFncyA9IDA7CiAJCWFkZXYtPnBnX2Zs
YWdzID0gMDsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID0gYWRldi0+cmV2X2lkICsgMHg5MTsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
