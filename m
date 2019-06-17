Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23348EC3
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FD98996E;
	Mon, 17 Jun 2019 19:27:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362F289949
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:51 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so12208097qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzCNbVlziyW5YDBjXI0uBxNTy2/icPSbOpDp+wy6CdM=;
 b=ZScXwDc1U92UDz3A0gs0I+tGT7exCOggAarkO7zSIVUlloqoBFEhyy/ztvP/CdwwdO
 DhfyhevoGX6biYpv/f+EWVVnhOwX3T3CEG0mhBSGriLi9EsACPY5bsQeCwTIdDeeHAnT
 lYQ/hhyDF65mUDF3wSBCjp1BgaAD1C65ixHbynfzyl22iw78QbZ8MET27adTa9bEtgJv
 WM45RwR0L6JlrsnV2bTopnJOyIE8xJMxS9GXp1ZrgWoA/H76DLEl2WGQvXO++rbJjhSh
 //uCpgXWBAgn/Y1p1nEi5iQq50n3AMsbx8nbHfT9pII5JZpDIfCKOAM6KUPLZf0/3zys
 /W5Q==
X-Gm-Message-State: APjAAAUfm++BMC1DFb7GT70xzMC1wdPjmm6b57l2PStoZCo8lQpwD0i/
 6FN6nHJJgp/cZFK8c/tSWJejVP92jSQ=
X-Google-Smtp-Source: APXvYqx4BCDKlN4t5IBDjw0nlH2IdUAj5hydc2dq2ON+JSA7M3JKlq+atelHAMzsm/1doG38Xv+tAQ==
X-Received: by 2002:a0c:d24d:: with SMTP id o13mr23520668qvh.86.1560799670233; 
 Mon, 17 Jun 2019 12:27:50 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 139/459] drm/amdgpu: add Navi10 pci ids
Date: Mon, 17 Jun 2019 14:26:04 -0500
Message-Id: <20190617192704.18038-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzCNbVlziyW5YDBjXI0uBxNTy2/icPSbOpDp+wy6CdM=;
 b=E7iGQS5DX1Gt0Xd8rngFJiFmcGjHi1HnwN2Q70n6WyyeHYUlqHsd7CeytFajKvhh2G
 hq9Kp8G/6S1zP98m13Vme7HGBDpWomMIabDen7bQ6NuQA3155BA3HDERT9GRwH1c5oyz
 WVoKZBK+d+oNXR3fcJw6XiqKnjGr+mVF7QzqkF6JNt6KkdoEzm5m/cgkOiAu0C+BmDcl
 8SX6qlUWCMcg9RpIUHGB2gVmrfhh6xs6VVK7HSkFL4b+B8zuWIxcslPnay+czkfQqPbU
 CrMSK7t47QRubeKDLdaI5yLL9TSJqCt3SNqZP0cjvQaXdiJHENjyi4UhdiuIM8/yvlA2
 rTyg==
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

U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCmluZGV4IDRhMDAwMGFhMjE0NC4uYTlkMWNlYjExZTVkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC05ODMsNiArOTgzLDEyIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAkvKiBSYXZlbiAq
LwogCXsweDEwMDIsIDB4MTVkZCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9S
QVZFTnxBTURfSVNfQVBVfSwKIAl7MHgxMDAyLCAweDE1ZDgsIFBDSV9BTllfSUQsIFBDSV9BTllf
SUQsIDAsIDAsIENISVBfUkFWRU58QU1EX0lTX0FQVX0sCisJLyogTmF2aTEwICovCisJezB4MTAw
MiwgMHg3MzEwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMH0sCisJ
ezB4MTAwMiwgMHg3MzEyLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkx
MH0sCisJezB4MTAwMiwgMHg3MzE4LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQ
X05BVkkxMH0sCisJezB4MTAwMiwgMHg3MzFBLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX05BVkkxMH0sCisJezB4MTAwMiwgMHg3MzFGLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lE
LCAwLCAwLCBDSElQX05BVkkxMH0sCiAKIAl7MCwgMCwgMH0KIH07Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
