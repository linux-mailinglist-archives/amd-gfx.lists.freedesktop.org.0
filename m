Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E169E00
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4D89DED;
	Mon, 15 Jul 2019 21:24:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEC289DEC
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:58 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id 44so17214421qtg.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pi5cXDi96nArfhtYYLRaQGBRdGfR0rzEK73oeZ9xq24=;
 b=kLaH2NKIP95IaxULNwwhWG+AmSBdLOLf//YwdcMvBlfl3Z78JvCaSRO+RuivQQo5w7
 OCWWo72xuaC1WqoWWwtu9oe9r4g9GrTt6XkncuqFYhn2sCKKRg5ZMIgRW2f2mQgonGS7
 AGYFG0Vz7V7TDOe07+Z1wsKdyswtbuvfSuG9NfEtvq9HUzhaFBKFCv4LzIaVwZiErPSW
 CDw5ktBYOweMg7iQXl0OCKE/Qh26YI25mlJXwVaP+555y2qxWs+yw5SIEeI6fLE90GRn
 D6eACiGS2wlVyKHmxzPtgbygwy6wBhdFDfYjtGLgANPJlIZgC4G+HaXDKRt954jIbOrC
 IAYQ==
X-Gm-Message-State: APjAAAX23ZvhuTlfANem4HBUSZUapjvVy6/9cez/4cbUeM1wIHTmWvLd
 sO38f79ELDJ+uA8M/NUgQ6GmVZsv
X-Google-Smtp-Source: APXvYqw8mFln1skrvwO6H5nruyYgnVzLxd4kCE0aPsQXDf7b5j8ioWWSmcUm25RIie49jXYoQdHHgw==
X-Received: by 2002:a0c:92ca:: with SMTP id c10mr19749088qvc.108.1563225897509; 
 Mon, 15 Jul 2019 14:24:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 014/102] drm/amdgpu: increase max number of ip base instances
 to 8
Date: Mon, 15 Jul 2019 16:23:09 -0500
Message-Id: <20190715212437.31793-12-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pi5cXDi96nArfhtYYLRaQGBRdGfR0rzEK73oeZ9xq24=;
 b=FW+fmHrLufq9DACr2JscbHkZjPb6eAH8iHKaTxdNvHb8SaFb+3ZGrLjWHRjQO0AGwk
 jk38QPPVb+rj+ZFXR+d9+9xgdukAI0pIGyIVY4S7Dlbslh1Um/opsnL+oVjovgdWJW7n
 tfM2OJWiyxLFwGMSIUAXwFreDik5w0ECI7BiUgO41MDoFNMpDwH+5JklW0JcDT7QOQE4
 44Ko+xNXo1kFQ+AkTUqGGPybjCJNRzZSz6edYLNVdraWjaFfTvcmKNt/VwOy/8+m897X
 BrcIrlS0b6My8QQu3YzaZhZJLZ5OxltZlk3l/G61sJhu8knJai7utSbW5PziKJfCLpZ+
 bSPQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpGb3IgQXJjdHVydXMsIHRoZSBudW1iZXIgb2Yg
SVAgYmFzZSBpbnN0YW5jZXMgaXMgOC4KClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQu
Y29tPgpBY2tlZC1ieTogU25vdyBaaGFuZyA8IFNub3cuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aAppbmRleCBkODgxNjU3ZmI4NzQuLjg1NzVlZDY3MTNjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKQEAgLTc0MCw3ICs3NDAsNyBAQCBlbnVtIGFtZF9od19pcF9ibG9ja190eXBl
IHsKIAlNQVhfSFdJUAogfTsKIAotI2RlZmluZSBIV0lQX01BWF9JTlNUQU5DRQk3CisjZGVmaW5l
IEhXSVBfTUFYX0lOU1RBTkNFCTgKIAogc3RydWN0IGFtZF9wb3dlcnBsYXkgewogCXZvaWQgKnBw
X2hhbmRsZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
