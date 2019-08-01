Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2657E426
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3DC6E7D7;
	Thu,  1 Aug 2019 20:30:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3587A6E7C0
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:18 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x22so66741608qtp.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRvcLT8FFAn1tvmoaxqKp6Si6R6BxvrHVaPWxJeMmIg=;
 b=NKtOxX3EVd5PK8fSNmKiDn6UQtPpJGu/OxOHMZslT2MpnxmsPS511L2/5keWlJRGYF
 jl4N7teksLKomgRvCUTIaYiisLi3/XZRsgQ7ozOMu6Qhq5REIA6KQokymtrzRiqIolkA
 FyTbrTiBnIfE4m2BFMkuY8X2BqQ8WOuE3IltauoDljZyrql7BSMy3m6TS+WegQtsTMq+
 ouvV1fKjnmWSJ5+wPmxKvZDN+NYYravdMJd5s8D/OrxoBsqNByDxbV5U3EKIq/QZuCVA
 eTeZKD5SNqttrg5tZXscqkDza44N96kLpji4V4oP0j8RcQDbryVKf95kl5zmPhPWztNN
 Q7Vw==
X-Gm-Message-State: APjAAAUwxhmiqAiFXe/dmjI3YT5aaZtS5JywudFmre+Eowa5+K4HbDqU
 YkEmJ7Xq4p4EjC0dZJ/qN4naFoqn
X-Google-Smtp-Source: APXvYqxmoVaof8sSs1NGYCvF+dDYVSWoLUPmobg+Kv3+jiso09IVHY8X03TdojK0p9GDI9WIo66QwA==
X-Received: by 2002:ac8:24b8:: with SMTP id s53mr94216646qts.276.1564691417120; 
 Thu, 01 Aug 2019 13:30:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/36] drm/amdgpu/gfx10: set number of me(c)/pipe/queue for
 navi12
Date: Thu,  1 Aug 2019 15:29:34 -0500
Message-Id: <20190801202957.29791-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRvcLT8FFAn1tvmoaxqKp6Si6R6BxvrHVaPWxJeMmIg=;
 b=bVS7QnBpbO1h4vUpD2tOurQAOnuS8kBOkXfhd5MNscAi9E00g/LdlKnKiwpeCAPXFM
 vUSsZ2vdDnOpPslGYmwpd5J8lLE06hl6rOLhB9wXopNWFWZC19nQb+MwPQKuyBc4SL2p
 DOGNWNiRX+i9NpdPZlRgYr8/KIz/xx9J2TUZyqqUV4GNLefKGVm937v6iBdlS4cSTVaj
 uuvYmLjCxkwmRHScrCmUBC8s6ftKAR7XELSaO/y1+Wj4BGEBT1xGho70sClR9fASmzp7
 Efk5Q70zPOSvGRu0YVtA1Xb1UGMe6w7drDxjJPtcBo0Lgz/RIZUGLN7AKjdVNe3EGyS4
 Z6PA==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgb3RoZXIg
bmF2aSBhc2ljcy4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFt
ZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYwppbmRleCBkY2NlNWUwNTZjMTUuLjM3ODE0YzViMmZhMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTEyMjQsNiArMTIyNCw3IEBAIHN0YXRpYyBpbnQgZ2Z4
X3YxMF8wX3N3X2luaXQodm9pZCAqaGFuZGxlKQogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7
CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBfTkFWSTE0OgorCWNhc2UgQ0hJUF9OQVZJ
MTI6CiAJCWFkZXYtPmdmeC5tZS5udW1fbWUgPSAxOwogCQlhZGV2LT5nZngubWUubnVtX3BpcGVf
cGVyX21lID0gMjsKIAkJYWRldi0+Z2Z4Lm1lLm51bV9xdWV1ZV9wZXJfcGlwZSA9IDE7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
