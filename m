Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E884B844
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jun 2019 14:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFB26E3A0;
	Wed, 19 Jun 2019 12:29:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1F6E39B
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Jun 2019 12:29:23 +0000 (UTC)
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Computer111.attlocal.net ([99.116.190.167]) by mail.gmx.com
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MBDj4-1hkgSX0yPm-00CmNM; Wed, 19 Jun 2019 14:29:19 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: Remove unnecessary write to type field of
 drm_plane struct
Date: Wed, 19 Jun 2019 07:28:57 -0500
Message-Id: <20190619122857.12603-5-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619122857.12603-1-kevinbrace@gmx.com>
References: <20190619122857.12603-1-kevinbrace@gmx.com>
X-Provags-ID: V03:K1:vVNiLNzTjOrox/L0XaeUvb42C3rWhCfN0hhy3k646z917GzN31z
 +fCLGvmwJeoRaD4fQaPNE4vWh0tQrZ1dw7jHKl9cAiWpjEckvJcJ/tPNFvKtBEpvIyW++FY
 DIyXDKO/XtJKlKsLYydkoLJ2gARX0OLVZQS1U//ITh1jc/ysrdri5bUuruAKHpvTj53uOw+
 nRubJ8xB/3KLx+UrzEKaQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FZBp0OWvdiM=:xf0K/ZrnZ8R2dRSe9qf68D
 y0fKZ9h5jy8rDp40li+ljl1lrPBVBjJmK93xMcKqFlow0N7aAi07C8C2ijMVQ+Ru1+djUfenL
 cZPSIk5ReGoCdBWL7IoFIoaTPXi5xJgd9v9/Qi6xdFOoSE+iwGnwXu6qev1Y8hl/9wkixeFLi
 yciFCUeRw02dvYcCC/+0b1LaCaswdhBvItH9L7aC1DTnPHpLW6he52RcuM2jcq3btToKtUpho
 TKDTr+sMpQ0ZoZE5WhQayeHniBUUG3tdJBkEM0a/61gal9lsGlKHmL3bF7t7X0YiB7h4d0oHH
 /Lygvidm+oicWy4jurhS4wuSFXECwj792FaoalUhFSLmVvOr3gDK3sXZiKnSrAxA7uY4ELzEz
 xYVDS09X6XVtRdBb5AnfDPCxey0ja5UA28VtpnnjNxMq3Pwif4OhDz4U1Ho/PImkSngOiB9bW
 rU2ovAP7c4jK6zapu+PznVTNAgKlTu/hy77Omaqh1GQG+wsWpLrGL9UN2estIqK4RK2F9fMV3
 LPH8/RusUioU8JFjDy7lIJEvbb4a2njURUZfjNjYPNUeR7ERMcUIZOuihU75kHVBn25EBz0DL
 EqbDCvDBf2FKh3kX/JlSuopTylFbX9c9zcxW9c9ku/hdgsSepRSQEHMkmz4tdGFQxYB/Rhv1f
 /qSDl5f+8tA04BVCdDsNY+NKDbFSnFwIMW9hnKd4gjQopUSkm9PutFFJOFUx1mW7LL3z4XHoF
 13yrRfU9CxK9P1Um1/IjbZgjs6lXVkeQ/LsN+dBulHl6sjtX42jx2uQhUA8+H4sXWok1hC14P
 1uOidwzuhmffFq6JlNfeMiLzTIqJ5h9soPMUWhvbZMuDdWkBwmzqqFzQFklKLMn0BQ5maAHhw
 5SnQmbe1y8BVpgRaVV9CiItsGSZHPHHD2uhcnhVfKOBC9zUv1G/s+fOh3e/MsMIPHOA+un116
 8r9R6JMTSeFc33ah8v6wceblnQKzkKf8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=badeba3b8450; t=1560947359;
 bh=4/sRTvuTO+CQeJiw7mhJxq3MKapdBQt+dt8780sawTw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=OAugz3tCx4J00829qeCUtonFPdABr0Quk6cTZVW7X01GlCdcMjF3nzTDSGFOP5wpd
 H71TWIpLlWuiJdkVLAZPYJqhD0WzBNTJKQmezdwNZmiZD08dXBSVrFgCYOVNMtOCgu
 HEHAdPYjJaEKUMOpylerygRwNwE52RnmTOtORkMs=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+Cgpkcm1f
dW5pdmVyc2FsX3BsYW5lX2luaXQoKSBvZiBEUk0gY29yZSBzZXRzIHR5cGUgZmllbGQgb2YgZHJt
X3BsYW5lCnN0cnVjdC4gIEhlbmNlLCBpdCBpcyByZWR1bmRhbnQgdG8gZG8gc28gcHJpb3IgdG8g
Y2FsbGluZwpkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoKS4KClNpZ25lZC1vZmYtYnk6IEtldmlu
IEJyYWNlIDxrZXZpbmJyYWNlQGJyYWNlY29tcHV0ZXJsYWIuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyIC0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAwMDNhZTY4MDM0YzYuLmVlOGI4YTZkNTMyOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCkBAIC0xOTk4LDcgKzE5OTgsNiBAQCBzdGF0aWMgaW50IGluaXRpYWxpemVfcGxhbmUoc3Ry
dWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCQlEUk1fRVJST1IoIktNUzogRmFpbGVk
IHRvIGFsbG9jYXRlIHBsYW5lXG4iKTsKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotCXBsYW5lLT50
eXBlID0gdHlwZTsKCiAJLyoKIAkgKiBIQUNLOiBJR1QgdGVzdHMgZXhwZWN0IHRoYXQgdGhlIHBy
aW1hcnkgcGxhbmUgZm9yIGEgQ1JUQwpAQCAtNDM5MCw3ICs0Mzg5LDYgQEAgc3RhdGljIGludCBh
bWRncHVfZG1fY3J0Y19pbml0KHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpkbSwKIAlp
ZiAoIWN1cnNvcl9wbGFuZSkKIAkJZ290byBmYWlsOwoKLQljdXJzb3JfcGxhbmUtPnR5cGUgPSBE
Uk1fUExBTkVfVFlQRV9DVVJTT1I7CiAJcmVzID0gYW1kZ3B1X2RtX3BsYW5lX2luaXQoZG0sIGN1
cnNvcl9wbGFuZSwgMCwKIAkJCQkJRFJNX1BMQU5FX1RZUEVfQ1VSU09SLCBOVUxMKTsKCi0tCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
