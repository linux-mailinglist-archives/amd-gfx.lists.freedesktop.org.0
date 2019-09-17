Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B999FB5677
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 21:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680FF6ED36;
	Tue, 17 Sep 2019 19:52:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48206ED36
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 19:52:16 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id z67so5317588qkb.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 12:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cSnMxqx8BN5GT/WoIXXUhXBfYtzod9O2iBpUgZ5L/Hg=;
 b=jxE8RLXmELfl6vARiPSl2L734sn5Rf2uWE9etcv3d1OE88qedNaVmLQF4v4+NTncik
 nixD/OeRcccG7TzuFFakjWMpDDijqXUZOdaSk2fjlvjEPx2kGfDSUf79HV+28HXRf/4b
 ThiWF2rUBcOoQr08I0G8mOHHd3eAnEDEPAesmdg7FN7gDn4W/L0kVlmVsy5CfJPD7Mc6
 gAIT6pRtflLRXqM8C83UY3FOE7bxFRTjVg8gtqflYpRmISLxBg90vt7Lg5ZNBwD3GHIv
 /5wjim6dsgkcMlGUkICQpitigZ9jDZL1N1ef7aJwl7RaylkAhH5CLw5BhLWWhIgxdJiw
 rhoQ==
X-Gm-Message-State: APjAAAX2IqeADnbIcSuKaIM42PkZ5967zfBsSqZGfXuKzasbZkcaBDkV
 VFY7XLBj42rtHak2xDx2zHLVnCx9
X-Google-Smtp-Source: APXvYqy/NBX/qaPk6auKgncLfFkGi/0gxL23INkEQqBy9t0xoTnIXhRCbyHKIQMFMxIU+ZyYlAbnsQ==
X-Received: by 2002:a05:620a:1124:: with SMTP id
 p4mr165443qkk.83.1568749935532; 
 Tue, 17 Sep 2019 12:52:15 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id y4sm1592197qkl.107.2019.09.17.12.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 12:52:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: flag navi12 and 14 as experimental for 5.4
Date: Tue, 17 Sep 2019 14:52:05 -0500
Message-Id: <20190917195205.20219-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cSnMxqx8BN5GT/WoIXXUhXBfYtzod9O2iBpUgZ5L/Hg=;
 b=Bj8at6bqa3JDtWL3Yl/F4ToKSrzSD9KTflLuFPni3pk/6iINoGl9Uve9Gr4AGT+zkV
 I2jmSGCLI8NTyospN6MW59mSSOVcKfDJQoaPcS68MNQV0sPLzAW+Z4+4xH903sLeDU8Z
 6RcCmwQh21jCTyougjx3zPpDqHsuAOpNaqa4H0xgNIjmsEtQmkhNI5pOKwwCtWpP1VCd
 YgxFl5B53RWEwTJ36BQGo0Thtwua4X+dbvYNHAXbwBZX80qxxlujEOp0cxOkHnTvuGoc
 TWwZeyqgcS1eozWNTnxgoYsgJtYW5feTRdaM3kIroMl7dv0d0VXXHw5MYvQ/uYdyGNVF
 iXRg==
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

V2UgY2FuIHJlbW92ZSB0aGlzIGxhdGVyIGFzIHRoaW5ncyBnZXQgY2xvc2VyIHRvIGxhdW5jaC4K
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCA4ICsrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCBjNjhlNTRhMjdhMmMuLjVkYTcy
Y2E2ZjNlMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAtMTAx
MSwxNSArMTAxMSwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRs
aXN0W10gPSB7CiAJezB4MTAwMiwgMHg3MzFCLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX05BVkkxMH0sCiAJezB4MTAwMiwgMHg3MzFGLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lE
LCAwLCAwLCBDSElQX05BVkkxMH0sCiAJLyogTmF2aTE0ICovCi0JezB4MTAwMiwgMHg3MzQwLCBQ
Q0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNH0sCi0JezB4MTAwMiwgMHg3
MzQxLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNH0sCi0JezB4MTAw
MiwgMHg3MzQ3LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNH0sCisJ
ezB4MTAwMiwgMHg3MzQwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkx
NHxBTURfRVhQX0hXX1NVUFBPUlR9LAorCXsweDEwMDIsIDB4NzM0MSwgUENJX0FOWV9JRCwgUENJ
X0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTR8QU1EX0VYUF9IV19TVVBQT1JUfSwKKwl7MHgxMDAy
LCAweDczNDcsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTE0fEFNRF9F
WFBfSFdfU1VQUE9SVH0sCiAKIAkvKiBSZW5vaXIgKi8KIAl7MHgxMDAyLCAweDE2MzYsIFBDSV9B
TllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfUkVOT0lSfEFNRF9JU19BUFV8QU1EX0VYUF9I
V19TVVBQT1JUfSwKIAogCS8qIE5hdmkxMiAqLwotCXsweDEwMDIsIDB4NzM2MCwgUENJX0FOWV9J
RCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTJ9LAorCXsweDEwMDIsIDB4NzM2MCwgUENJ
X0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTJ8QU1EX0VYUF9IV19TVVBQT1JU
fSwKIAogCXswLCAwLCAwfQogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
