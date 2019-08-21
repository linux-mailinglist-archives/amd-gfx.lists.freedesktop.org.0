Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E898726
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB59899D5;
	Wed, 21 Aug 2019 22:24:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD1F6EA22
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:28 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s145so3339048qke.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ArprL1INSCJNdUyMuyyFI/PtvmCtvrbQLB5rLAi/77U=;
 b=WxYnHKoq9hhgzq0st0um5C/F7iK7P5+JOmnScbdipD2Xg8opx2Mckoba38JupDQVQ2
 /Msol2fAMkJiOuhJ+YvCb62q1OtIobMqErLdZDVGze9bDfYtkfF3ynXbMrTeUwZ6/jdX
 kS3PkcMCihkT+cKAYGCfZ5zwzNzygJgHCQ1FptapxJvLpt3g3Hg2NBAoxks8XDbc/PSz
 eRfEryR0FgIftjHowYXdio3tHBV70jV2O7Yn2BQEorDTNGRiBT8gEDb0rFOFxubB3AD3
 GUWnZ9ZZgkVrxeCXn3kQx2IW9Mo4LdLClN5vi+WEcngWghlFLswuf6GjGF+wKvtTcX3w
 LNow==
X-Gm-Message-State: APjAAAXZL+NkohT8Ft6rXESu5SzpZJw67x1I6l7g79l7JDwIwYt+OGX/
 IxctcoeVVNNS3RSWX6wkZbBf9DEL
X-Google-Smtp-Source: APXvYqyeLxLplS017zk+CQCxEBOzt25IddJ2+L+P60gRb8NiMGQeUfIFa7FOVK23ZWFI6AXfZxig1g==
X-Received: by 2002:a37:8e06:: with SMTP id q6mr31555346qkd.89.1566426267719; 
 Wed, 21 Aug 2019 15:24:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/37] drm/amdgpu: disable gfxoff for the moment on renoir
Date: Wed, 21 Aug 2019 17:23:40 -0500
Message-Id: <20190821222359.13578-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArprL1INSCJNdUyMuyyFI/PtvmCtvrbQLB5rLAi/77U=;
 b=RQ8nxdD9k1pwk3wbKOZ30cIdIk/Y+YZ6l/gV527HCtX+DBRQx6KhCSTqGxSxXNRCAq
 98MouT6B8Wm5dETu87iGw2p4MegB0RnlKL6Bd1IVG50RoS2D48aSfPG4DcZqBnJqpaih
 mmWAWYXrw7wwTjcyjC70cO+j7jIXmWYtRB/2tC5zquEZb6OQfT6LJH4z6GB0qeheyOJh
 15VGod3AJ3N6KpOpBYoilClrUu7hNXFrLWmaIjE12K9Oh0WZioWaCwOqi7nlbZ48NMox
 Dt5zE4b4Oz8bgq4+nR/AZ3Bm+29RtEaLfJEqMNtJR874CdmyNtfTkmoitETRMDvZTcai
 DcXg==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCldlIHN0aWxsIGVuY291dGVyIHRo
ZSBDUCBoYW5nIHdoaWxlIGdmeG9mZiBpcyBlbmFibGVkIHVuZGVyIFggc3RhcnQuClNvIGRpc2Fi
bGUgaXQgZm9yIHRoZSBtb21lbnQgdGlsbCB0aGlzIGlzc3VlIGlzIGFkZHJlc3NlZC4KClNpZ25l
ZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBYXJv
biBMaXUgPGFhcm9uLmxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
CmluZGV4IDAyYjNlN2RjYjYzNy4uZTI2NWMyM2VkMGE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0xNjIxLDcgKzE2MjEsNyBAQCBzdGF0aWMgaW50
IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAl9CiAKIAlhZGV2LT5wbS5wcF9mZWF0dXJlID0gYW1kZ3B1X3BwX2ZlYXR1cmVfbWFzazsKLQlp
ZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKQorCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikgfHwg
YWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSKQogCQlhZGV2LT5wbS5wcF9mZWF0dXJlICY9
IH5QUF9HRlhPRkZfTUFTSzsKIAogCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1faXBfYmxvY2tz
OyBpKyspIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
