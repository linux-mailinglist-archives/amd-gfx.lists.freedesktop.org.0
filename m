Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0EA71D3D
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 19:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB236E317;
	Tue, 23 Jul 2019 17:00:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027886E311
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 17:00:57 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id c4so17206883uad.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 10:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TPZV5YeG7xXai9oAwgaG3sh/PMhN2h8sjEBYDEQHzM=;
 b=behDZehj+5khGCpwzP1Q8brZuM5Uv5SNvLtm65h2HKV2J/ahdd9yTAsJIeiL2uI4Hs
 TI9CrrYq3/4oAB2JohQqHPwGx3hdVW0a7V4ejXMarDw/XYVk4ojXBuqc44XaW18+YDGv
 SRi9/Rbg3rxBCgTYPP3VR5JMs5alxxK/P9jL35V4eO0HPZ7CI834BWkJkeLqGWPtZo1t
 cyeRB6vzhVGJO1kU2xdd+CkEZcNjN8+QnViWd5h7cKPnJ1A6G2EVPKy2pu3ZU4zruZ/l
 IqVegzWg3/eUEFbRhOb9ENsrKh98o4uUzUNgP4FS8uXoxcma8WaLAvKOKOCGbU1DSoi7
 y6JA==
X-Gm-Message-State: APjAAAUfX04SWz3CVfQ7zD7CmxIOH33HUlcjrrumiAsPIamBZu4ygP5f
 gwK7ov4juQQ4tWPk6hE6EhJZhWsl
X-Google-Smtp-Source: APXvYqzro66qIlS7PeAWIexpeW3+fw/ZYxfuTGmFmnRYN4hz0525HUt/D8xYsgwRJ2149G3qOMYY/g==
X-Received: by 2002:ab0:2650:: with SMTP id q16mr8903262uao.7.1563901256677;
 Tue, 23 Jul 2019 10:00:56 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id a23sm578879vkl.52.2019.07.23.10.00.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 10:00:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/powerplay/vega20: call PrepareMp1ForUnload in
 power_off_asic
Date: Tue, 23 Jul 2019 12:00:47 -0500
Message-Id: <20190723170049.9143-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TPZV5YeG7xXai9oAwgaG3sh/PMhN2h8sjEBYDEQHzM=;
 b=s1bAJwOF3SpyryE6BFWcForl4tSvCLOoQfH3+nAQM8SU6Nh2dz+egsM4WYODAHvuCj
 6iBfWmLeTBCpZ47oPDe+e1/ApfloIX7hRw8GHlDgdzPSK265GS7GCvOhg56Zser0kVag
 tlc4inAi4YMP2liWV8VK2DUpaMDA51isolofvhqT2IugNsPR/rIpzKj+ZuJ0/aevkftb
 864EVtVjdVJ/ckJCNpbgBsJzeLI0B46tb6yaBx66G3Mivd9X6RCmdNNgYCwl78Ax/EYh
 DCI0Lsg2xeKIAFh5bEXrrfG7oF9akLy295ZI80AMqp+dgxCs4Jjbdm47vHuG+76A+NpQ
 IHFQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmVlZGVkIHRvIG1ha2Ugc3VyZSB0aGUgc211IGlzIGlkbGUgd2hlbiByZXNldHRpbmcuIFRoaXMg
Zml4ZXMKc3BvcmF0aWMgZmFpbHVyZXMgd2l0aCBHUFUgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTIwX2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9od21nci92ZWdhMjBfaHdtZ3IuYwppbmRleCBmMjdjNmZiYjE5MmUuLmUxNmQ2NjU0
NjkyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVn
YTIwX2h3bWdyLmMKQEAgLTM3NjQsNiArMzc2NCwxMSBAQCBzdGF0aWMgaW50IHZlZ2EyMF9wb3dl
cl9vZmZfYXNpYyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogCQkJKTsKIAlkYXRhLT53YXRlcl9t
YXJrc19iaXRtYXAgJj0gfihXYXRlck1hcmtzTG9hZGVkKTsKIAorCVBQX0FTU0VSVF9XSVRIX0NP
REUoKHJlc3VsdCA9IHNtdW1fc2VuZF9tc2dfdG9fc21jKGh3bWdyLAorCQkJUFBTTUNfTVNHX1By
ZXBhcmVNcDFGb3JVbmxvYWQpKSA9PSAwLAorCQkJIltQcmVwYXJlTXAxRm9yVW5sb2FkXSBGYWls
ZWQhIiwKKwkJCXJldHVybiByZXN1bHQpOworCiAJcmV0dXJuIHJlc3VsdDsKIH0KIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
