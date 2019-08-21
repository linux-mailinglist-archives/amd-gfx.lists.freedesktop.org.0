Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA698753
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0D76EA3E;
	Wed, 21 Aug 2019 22:24:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202AB6EA2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:43 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m2so3323952qki.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4GYzCUSMoYd0Amc46crxVf21vu5B+a6OyWLAjEnhITs=;
 b=HqnGZKB79oXatvqFT1yEzLaPIj7G4psb/zafmQsbfF1RoTI/9Ch8FAg0Q8yEMjOEL6
 VlkhoreNvlby6j166v4/1VDlfvcjpZj1zp+n1sYIAf/hUikM56DYS2Y2tDz8CT2ks0Yd
 qsjMCqhzoa8KpLDTrX55NXD1fbqxb9gM5W0dDrzUlkpJoxIzdsZqlnUfhGYiZMw6DpDy
 Z2UWZWJ+4qe4C7mMqlCkkm525uJcDvu3BFZxk1uZjBlrD3AOphU+E3NNCu6qxbC4qQof
 LZRuPQsP14i1uYFisMRjr1/NG7bMO0qcQKXkKR8mCPw4N+is0VtUs1xkQW0ntEOEcOwu
 BrrQ==
X-Gm-Message-State: APjAAAXZicH9H0+RIOqWAj2R3IKa0Fy/2KAaxSHgcQfc4Al4xpFDZ+ow
 Buwz2aTcdWHnVt+W5nBqa9KFXIU+
X-Google-Smtp-Source: APXvYqwq9IPB2t8FKSO0bwAAt55enjeJW84ugQhl40e/AQdSHw2iDsIRckiq1MkFsZxQgZidFlKsng==
X-Received: by 2002:a37:6391:: with SMTP id
 x139mr30117017qkb.304.1566426282070; 
 Wed, 21 Aug 2019 15:24:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 35/37] Revert "drm/amdgpu: disable gfxoff for the moment on
 renoir"
Date: Wed, 21 Aug 2019 17:23:57 -0500
Message-Id: <20190821222359.13578-36-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GYzCUSMoYd0Amc46crxVf21vu5B+a6OyWLAjEnhITs=;
 b=fv0EJJeS5ELjEyy9sOm9zWunTj1R60R9B+npV9RbTbIrdNaKSDa/EgTH0xnlLJrNFw
 lOJ4Uus4L0FpmzCo+eqPBGm911/JL0tOOmOMqpNZS0aB8xCt7/QOofnlODLW5h4popLp
 JEip9aEfbByiC9+3QVJvmAj67oartfHOJVT8qPvdCwX6rKtOw+cXxQXePevv2jL8qvrJ
 5FM7D3Mh1/48VndSA5X4QzF4/3KY5NZLYSdR2iH/bgcFDbfI66BLt19Pea0tUFaISwV6
 Ese38R5oRtFwm4X4vjo/pAmDDru/gfPAkFq26Dhj+9dtv+zz6YdhGLfoeYieDjkqbVKv
 klig==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 changzhu <Changfeng.Zhu@amd.com>, Chen Gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KClRoaXMgcmV2ZXJ0cyBjb21taXQg
ZGZiMmM2ZWU4YmVjNTkxNGQ0N2E0Yjc1ZjczZWZmNzMxYmI5MzdhZS4KClNpZ25lZC1vZmYtYnk6
IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+CkFja2VkLWJ5OiBjaGFuZ3podSA8Q2hhbmdm
ZW5nLlpodUBhbWQuY29tPgpBY2tlZC1ieTogQ2hlbiBHb25nIDxjdXJyeS5nb25nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZTI2NWMyM2VkMGE3Li4wMmIz
ZTdkY2I2MzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
QEAgLTE2MjEsNyArMTYyMSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9lYXJseV9p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCX0KIAogCWFkZXYtPnBtLnBwX2ZlYXR1
cmUgPSBhbWRncHVfcHBfZmVhdHVyZV9tYXNrOwotCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikg
fHwgYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSKQorCWlmIChhbWRncHVfc3Jpb3ZfdmYo
YWRldikpCiAJCWFkZXYtPnBtLnBwX2ZlYXR1cmUgJj0gflBQX0dGWE9GRl9NQVNLOwogCiAJZm9y
IChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
