Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DABB83A3
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 23:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0EC6FBDC;
	Thu, 19 Sep 2019 21:45:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189F76F55A
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 21:45:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n7so6217601qtb.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 14:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xb5yeaBTyCwwol4oHQiJMVpxXFmoKSmfXCSrn5wsU7Y=;
 b=lxb7D/r92wz28w36t5oV8xEwz2K5DLlJBqUEmJ6y6APfZsac/AmBXnb7pVJvV2bMaw
 KK2noJGxUup7jkiJVXuyBDSsrI0nVpm5XUkRh0DkV/tKkGnK59PN4XbypdW7rEN+KC+L
 2HzEkSRv5365q1ZygGKLFDKF8TXZa1YOAuAKVn1tqXGMrbk0ElHwhfypilCZdnUsFvfG
 41wHXJRgX5R9ynzZq5pkHEc6ratFWsodt7JbwFbGqSlt4jkbQXN097nRolFYKJKRnc1i
 r6Uk9qpodyisjg74AzmFqNsqRFDiWCeZlJEjt090cKpAetbwDRfj5oFcvKK3RH03fq/1
 UcsQ==
X-Gm-Message-State: APjAAAV8303/aNn+Q9KW3w7gfReNSqaFpILid99kKH+JrvhjFr7JWr/S
 5nNNNAnZV796q/pa+NvdzFcJAyiW
X-Google-Smtp-Source: APXvYqxRGrH5hVugfhIuj/+6P1VFJUqqLl/eprD1NmE83URBNSNkFdyNN0TuxlZr3I0h72Hc50Yi1g==
X-Received: by 2002:ac8:1496:: with SMTP id l22mr5910388qtj.274.1568929537993; 
 Thu, 19 Sep 2019 14:45:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id q44sm6231255qtk.16.2019.09.19.14.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 14:45:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu/ih: fix documentation in amdgpu_irq_dispatch
Date: Thu, 19 Sep 2019 16:45:25 -0500
Message-Id: <20190919214527.10803-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919214527.10803-1-alexander.deucher@amd.com>
References: <20190919214527.10803-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xb5yeaBTyCwwol4oHQiJMVpxXFmoKSmfXCSrn5wsU7Y=;
 b=B6cCr4pqb3tP2go4G54aNw3aiPm1kHOzU5oSg8MrI+7fPnBiz47/5bbvQCn3hnhTjK
 wq06lrdcbcYxOqqmSJdw0N21WTIij79WDxN3OtUQh7fAiibdMqXPycmxa+zpb/KFWIJ+
 jzv7ubnVxi+7hQ9C8Get2H1460cRZNRYNZDk95WS7BIeyW0E9zJ368JemymdRMYE3AHG
 uJHHN8BOptzrpRF1zMxe/vUftU8+b0KxJHXHfmUxCDlbguovt1NYOScpBoaCSxLmeB9B
 /+crmuW2wVRLSqSbbG9BdTEfFFGJM9L5cu/jsgDUHDjPyJQUBZMP8QT7zAiqBi36MVWF
 PM0A==
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

Rml4IHBhcmFtZXRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ly
cS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5jCmluZGV4IDFmMjYyOGY0NDVj
NC4uOGY0OWQ4MTMxZDYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lycS5j
CkBAIC0zODMsNyArMzgzLDcgQEAgaW50IGFtZGdwdV9pcnFfYWRkX2lkKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogICogYW1kZ3B1X2lycV9kaXNwYXRjaCAtIGRpc3BhdGNoIElSUSB0byBJ
UCBibG9ja3MKICAqCiAgKiBAYWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCi0gKiBAZW50cnk6
IGludGVycnVwdCB2ZWN0b3IgcG9pbnRlcgorICogQGloOiBpbnRlcnJ1cHQgcmluZyBpbnN0YW5j
ZQogICoKICAqIERpc3BhdGNoZXMgSVJRIHRvIElQIGJsb2Nrcy4KICAqLwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
