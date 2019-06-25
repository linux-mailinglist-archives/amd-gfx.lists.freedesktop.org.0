Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D4550F8
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 15:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1A6E100;
	Tue, 25 Jun 2019 13:58:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6066E100
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 13:58:42 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p15so18478192qtl.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 06:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4T6iZ1hGcDqyqPWpuZNsCSscaNXZGYPfeqE9eqBghg=;
 b=C+gfHRgIwZyJcpU1torUGftE/50syWdVQ1DA+C/Bi/rri3tNPPh7jm89zNIpxs/ZCB
 fFX73VlbJMtwR9+statK6in+uX62cwU9s4Khce3gaEy4PgbLf6Qnn4POqh6O69Rv7uyb
 toXwoRdDuwgXEi+ucT+WdTW9qwiAdFKuneppci1r+/NKVK59mc/jM9j5E2ReVvtbx8nE
 7QBb/+Ko0UKahH2Sio1pffAcs9T/7oAX9UydYhgOKFpft7SI5eLETRg3dpChrJx4a0Fj
 KQ6NWCQHV4UzfYKrIIuiByKMzhaUK5tlQcmHEBHDo4V0ddW7Y2m2JlPRKp1Xg4xbbSN7
 RRbw==
X-Gm-Message-State: APjAAAV6kETbt8HWAjk93GGMqL28w7xIVUBZPA/9OCSuaR2f2NlVrbqi
 BPa3g8P2BcooHTsW7SnhX1zlJpQ1deo=
X-Google-Smtp-Source: APXvYqyg9sjUWIXfK2k8egQX5QXfTwQQW4Oxf3WrtSN0D1PEq7NnjtgyKZlotumaI5I3MBYJtH5JrA==
X-Received: by 2002:a0c:f78d:: with SMTP id s13mr60408724qvn.156.1561471121613; 
 Tue, 25 Jun 2019 06:58:41 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p23sm6473632qkm.55.2019.06.25.06.58.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 06:58:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/powerplay: FEATURE_MASK is 64 bit so use ULL
Date: Tue, 25 Jun 2019 08:58:29 -0500
Message-Id: <20190625135830.26173-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N4T6iZ1hGcDqyqPWpuZNsCSscaNXZGYPfeqE9eqBghg=;
 b=hy3mttwq3nKyPY5PHPBOiR9ezmqdGlKBM74dq7wKWv0qDHsYUaRlHsz9/042nezNN/
 6dfvzvi1azwf0SE4VZf+85bQx1dNO87DpRDKFQKesTda7HBC8n3Np1skF7TlBx7w/whI
 uDOuty36rHvc50V2KHL0Tjjn5OtsbSYmdEfQCPOiSXGOqXCndvrmLoTEtBRZkqsGXi9m
 ECAldYbCzCRfRjzgJumbKI7eLA+3DzM4JZpltFkUAoQcupMF27BqHwGxZE4BQLgJLL9I
 KOJ6ra2T9VqQR+0y5bswvgDhOtOHbE3Go9BPJ56rAYguYwm7xsqs+UUpOQZsuEQElsvM
 rpfw==
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

VUxMIGlzIG5lZWRlZCBmb3IgMzIgYml0IGFyY2hlcy4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKaW5kZXggOTliMjBmZWQzNDdhLi4yZDQzZTNkYzc5ZjYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTM3LDcgKzM3LDcgQEAKIAogI2luY2x1
ZGUgImFzaWNfcmVnL21wL21wXzExXzBfc2hfbWFzay5oIgogCi0jZGVmaW5lIEZFQVRVUkVfTUFT
SyhmZWF0dXJlKSAoMVVMIDw8IGZlYXR1cmUpCisjZGVmaW5lIEZFQVRVUkVfTUFTSyhmZWF0dXJl
KSAoMVVMTCA8PCBmZWF0dXJlKQogI2RlZmluZSBTTUNfRFBNX0ZFQVRVUkUgKCBcCiAJRkVBVFVS
RV9NQVNLKEZFQVRVUkVfRFBNX1BSRUZFVENIRVJfQklUKSB8IFwKIAlGRUFUVVJFX01BU0soRkVB
VFVSRV9EUE1fR0ZYQ0xLX0JJVCkJIHwgXApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
dmVnYTIwX3BwdC5jCmluZGV4IDJmYzRlMmE2ZmQ4Mi4uMGYxNGZlMTRlY2Q4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jCkBAIC01NzYsNyArNTc2LDcgQEAg
c3RhdGljIGludCB2ZWdhMjBfcnVuX2J0Y19hZmxsKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQog
CXJldHVybiBzbXVfc2VuZF9zbWNfbXNnKHNtdSwgU01VX01TR19SdW5BZmxsQnRjKTsKIH0KIAot
I2RlZmluZSBGRUFUVVJFX01BU0soZmVhdHVyZSkgKDFVTCA8PCBmZWF0dXJlKQorI2RlZmluZSBG
RUFUVVJFX01BU0soZmVhdHVyZSkgKDFVTEwgPDwgZmVhdHVyZSkKIHN0YXRpYyBpbnQKIHZlZ2Ey
MF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJ
ICB1aW50MzJfdCAqZmVhdHVyZV9tYXNrLCB1aW50MzJfdCBudW0pCi0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
