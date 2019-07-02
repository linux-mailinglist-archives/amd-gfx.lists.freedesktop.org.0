Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A075D75D
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF98E6E053;
	Tue,  2 Jul 2019 20:29:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A796E047
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:08 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j19so20127149qtr.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDv9ozCKHS4q4fyjiWVEVsJzLcQv7BlqTyuNexfqMr8=;
 b=nM5RPsj/RY1iiml+r5DXPAS7qYW3LEqg26KjyUVRpSkoCLZoPXt4lR0t47PrIW3fjJ
 cnVAnk/wBICN+SmPmL7YJQBzFOgsTJHwqfQWBR14bHIo0rNmEpW4MGiMKZ2HUYRpgy61
 H7ZrQcDA0LKDqL9Hv35V9idRdWLMl5llrqi9eNWYMSYakt5EkN3nxud3NIlLlQ0/ouDl
 HtZYgswM2Ho766K0mVWZ96gGi2ZLYgP6EfI/rDsAa5hA9hjPFChdWqzNr32FXPxiRXR/
 Qyv6oI41881878EMW5HUoVyVvQplaV7QMZIUMtuatnCr2ZmYQBoz4HRk8WSJpl5UxVyI
 8Ffw==
X-Gm-Message-State: APjAAAVQ6KzePD9meKZq9mnFauC+Q9uNHBb+1SdwrxWoQ2yo/L6wQ7uB
 aTwqnRe0z/l2xm1o1951zv14iWC1vG8=
X-Google-Smtp-Source: APXvYqzBfw+hpGxwBIkR+RRrIMfSRna0qHVM1pbovWtq99/MCSxTzSfR3S5sDnPCJ+9hMEbdW6hXNQ==
X-Received: by 2002:a0c:aff8:: with SMTP id t53mr28633372qvc.47.1562099347006; 
 Tue, 02 Jul 2019 13:29:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:06 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/53] drm/amdgpu/sdma5: set clock gating for navi14
Date: Tue,  2 Jul 2019 15:28:04 -0500
Message-Id: <20190702202844.17001-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDv9ozCKHS4q4fyjiWVEVsJzLcQv7BlqTyuNexfqMr8=;
 b=tJrI/tmDPJqAba0aqQin4OzIK4jvQnDfKsDL3JTRfjI8/lX32aHTdQqGeJXD+0X0KD
 VKtnzMdNJBCfHAjfBfSbZX09tybj3bj1/hu8mAOhrSZr2jK3OzjG0v1tISKUiQZQk1tT
 qKQDE/cLnZxzM0vMvybuS0GmlLvsEJQaUzs1M9/fQLRQJ7O8jr9fFBA1w6L2Zg6gpGdS
 etMBpD9qc4tiENztSnL+AXU/RKrJPrIVRIf5fnpOLul5mJ0ZXw8Krx+6mMFCrWb66ieF
 gluNj6PWPm5v0sY+JT6vdw0uPF3LzXyqu/wHAw8urwgaZHuUQykXDhrIbzZOdXQ0IiDG
 ghzQ==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y1XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jCmlu
ZGV4IGRiZmIxODQ1Mjk3ZC4uODk4OTMyNjFmMTQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zZG1hX3Y1XzAuYwpAQCAtMTQ5Myw2ICsxNDkzLDcgQEAgc3RhdGljIGludCBzZG1hX3Y1XzBf
c2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQgKmhhbmRsZSwKIAogCXN3aXRjaCAoYWRldi0+YXNp
Y190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTE0OgogCQlzZG1h
X3Y1XzBfdXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcoYWRldiwKIAkJCQlzdGF0ZSA9
PSBBTURfQ0dfU1RBVEVfR0FURSA/IHRydWUgOiBmYWxzZSk7CiAJCXNkbWFfdjVfMF91cGRhdGVf
bWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwKGFkZXYsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
