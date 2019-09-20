Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78608BAE1F
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 08:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2646E117;
	Mon, 23 Sep 2019 06:56:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15866FE11;
 Fri, 20 Sep 2019 22:49:31 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r26so19718411ioh.8;
 Fri, 20 Sep 2019 15:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wOpJQk7o6uD40KwVMmu8VQcBIeJeRyt/YndwGm9kx/0=;
 b=LtJ3qK3L8dZUk4xQa9FLDPsAB3bgddexiNhLJcchjfqy2gbjU3quziZXvDAdPg2+Ho
 VCuBGF2mSBsvHpGK0UJd32OHrC8q6m71ptPsj7XY3junwVUABehlpPrAOGS9NEnsmbuy
 9Karh+TFje7UdevSbdCeYDExnDV7frNyDGxbLe9Nir7Zc0hNiSjAYepPiEEby4rh1Up8
 Vx45ZpY2VoBDoFvo2ZL8VrJ5nn6JtVfEpNDnEh7nD9VcI6XnZ3qwVudiAvROqG2BiJeC
 27pTwPNOWiLOt3IGwNsUnXmbh8LsXapYwbUJ3rgzQaFjU/UgsgjM+iYxQZZZwtIBFjfS
 IN0A==
X-Gm-Message-State: APjAAAUHDuhpkMufH8AQ2sjIuw+Km4c/mwMPz2WnYYBJEym1AVvbjHtg
 g6DNnuIvP7aIW56O98ooTZY=
X-Google-Smtp-Source: APXvYqwwbVOjmnF+xSJ83lf0QEM65bDBvT+0GLoqdM7aVkcp+sFzFWRjgpRovLgsdFtvQ4qa85aHqQ==
X-Received: by 2002:a6b:3a43:: with SMTP id h64mr550056ioa.89.1569019771106;
 Fri, 20 Sep 2019 15:49:31 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id a14sm3835732ioo.85.2019.09.20.15.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 15:49:30 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/amdgpu: release allocated memory
Date: Fri, 20 Sep 2019 17:49:10 -0500
Message-Id: <20190920224915.2788-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wOpJQk7o6uD40KwVMmu8VQcBIeJeRyt/YndwGm9kx/0=;
 b=ACsUX2E2WcuZZFmvPnh2nXTsETrz8yamMn3bO6rMtq/UC1IFTo5Q9N2tcaMQH2EChi
 o/5jdQNjzXTYviqKafcRo+xbmAAD7tKV/F5Xa6eGMWs3pc+c62WzMfvlrNp4/m42ne2S
 jvZLlMIqQrSeOuc6YRgeLnUMd/KxDX/Uy0olM0H0qNgMjgfXnjHrDAo0PO8adFmuL6rr
 fv5gGcbx1HRGvda/OiHQ4QxhLuqr14NxyS3INmNjyLnHP1dnMcTcSCQxFc22TBfBz4lZ
 ZNZn5IL8lRABN6AB0iWFzBsNmz5PWd9P/Mst27mRvSxjMWFczBsgGOERFcDn+YHm15t7
 y3Zw==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 smccaman@umn.edu, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gYW1kZ3B1X3ZtaWRfZ3JhYl9pZGxlLCBmZW5jZXMgaXMgYmVpbmcgbGVha2VkIGluIG9uZSBl
eGVjdXRpb24gcGF0aC4KVGhlIG1pc3Npbmcga2ZyZWUgd2FzIGFkZGVkLgoKU2lnbmVkLW9mZi1i
eTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2lkcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jCmlu
ZGV4IDU3YjNkOGE5YmVmMy4uOTA2M2NkMzZmYTk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2lkcy5jCkBAIC0yNDQsNiArMjQ0LDcgQEAgc3RhdGljIGludCBhbWRncHVfdm1p
ZF9ncmFiX2lkbGUoc3RydWN0IGFtZGdwdV92bSAqdm0sCiAJCXIgPSBhbWRncHVfc3luY19mZW5j
ZShhZGV2LCBzeW5jLCAmYXJyYXktPmJhc2UsIGZhbHNlKTsKIAkJZG1hX2ZlbmNlX3B1dChyaW5n
LT52bWlkX3dhaXQpOwogCQlyaW5nLT52bWlkX3dhaXQgPSAmYXJyYXktPmJhc2U7CisJCWtmcmVl
KGZlbmNlcyk7CiAJCXJldHVybiByOwogCX0KIAlrZnJlZShmZW5jZXMpOwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
