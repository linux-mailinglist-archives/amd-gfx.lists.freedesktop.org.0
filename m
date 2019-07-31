Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C2F7CB3B
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B596E1B6;
	Wed, 31 Jul 2019 17:59:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9646E2B2
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:54 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id 130so13854442vkn.9
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5GCrf45eybI25PPH6svbc1K7RfS5pmtvTZh1l2Y0O0=;
 b=m+YFo+FDXW09ziH2R1bMB+NWL5M7R+8b7mWLQGuBHS1mqCLk5kE5Pkf2wkfyl7fE0I
 aNHF33rcKfZ/lqqTZ7t6JUIlIeMF1ZHmDesYx6bud3dPZxXpsho1By8k0Lvevj/HWea0
 APLx+DMf06y1wB1Ogi13OqpQZkv3bxekR8VTv2TPJ5/9aC92FdcU3kFnMbnsbd4k5E7K
 +F6r9iW3WQsNhyoKAt62Hhdaz+pIepeWPVOtoyDR9p0j4yNE90bVP7mC//8FA9xOp3Kl
 taUDvrx0v1aWNau/4NarmVAeP1iGsEeUmM11tFSggT3IOJopuzYEGeRQG6ilE+B+/dwR
 g3Qg==
X-Gm-Message-State: APjAAAWIr4V3nNGOCa+sqz5ED8nl52z+cINN7J07nF+AM83ap9enr4ng
 5y9YQ/Lx7WrGUTscwiNlYhyLaZCi
X-Google-Smtp-Source: APXvYqwyyK9SmBdzNp4NMMNEU1lBWfly6oaZuKjTFl78pAKccDpB2QTkfmi8Ex1PrkSKY/nfNL+KWQ==
X-Received: by 2002:a1f:d10:: with SMTP id 16mr49419907vkn.29.1564595933330;
 Wed, 31 Jul 2019 10:58:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 25/26] drm/amdgpu: support gfx ras error injection and err_cnt
 query
Date: Wed, 31 Jul 2019 12:58:17 -0500
Message-Id: <20190731175818.20159-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w5GCrf45eybI25PPH6svbc1K7RfS5pmtvTZh1l2Y0O0=;
 b=DAkXWkggrPQsx+soRyB1dtUGUjAo3TRBz9V0yju/xb/H7t9dq4on7iR4QNfTGwhAkX
 uWhOgWVi0duPzwT39yMETKkM8Vk8MTWjklmceea9y+98iZ8tNN6J7Fhp6RjVtHtBUscA
 XbBfcpY+OLLpO46fNEsDmY0qpxJ/Qb8U3QzecdI5Y8u1SZXIuoQ7NZUlP5dXi9Xkp96G
 CgoeFT0KHKy/T4t5LcHtUgWGYVds4kxtMdFdevjcv91SLrX/DknrZyzOxl3L9/sx79N6
 Zctb630YsYqP8sn55d8evd5F7bUasOBkz4jIIrJ0/pQbrrD11asIM/aWGV6+6DkR5dsu
 E7gw==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNvbT4KCmNoZWNrIGdmeCBlcnJvciBjb3Vu
dCBpbiBib3RoIHJhcyBxdWVycnkgZnVuY3Rpb24gYW5kCnJhcyBpbnRlcnJ1cHQgaGFuZGxlci4K
CmdmeCByYXMgaXMgc3RpbGwgZGlzYWJsZWQgYnkgZGVmYXVsdCBkdWUgdG8ga25vd24gc3RhYmls
aXR5Cmlzc3VlIGZvdW5kIGluIGdwdSByZXNldC4KClNpZ25lZC1vZmYtYnk6IERlbm5pcyBMaSA8
RGVubmlzLkxpQGFtZC5jb20+ClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTkgKysrKysrKysr
KysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyAgIHwgIDIg
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggY2NkNTg2M2JjYTg4Li5h
OTZiMGYxN2M2MTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAg
LTYwMCw2ICs2MDAsMTAgQEAgaW50IGFtZGdwdV9yYXNfZXJyb3JfcXVlcnkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiAJCWlmIChhZGV2LT51bWMuZnVuY3MtPnF1ZXJ5X3Jhc19lcnJvcl9j
b3VudCkKIAkJCWFkZXYtPnVtYy5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYsICZl
cnJfZGF0YSk7CiAJCWJyZWFrOworCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fR0ZYOgorCQlpZiAo
YWRldi0+Z2Z4LmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCisJCQlhZGV2LT5nZnguZnVu
Y3MtPnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCAmZXJyX2RhdGEpOworCQlicmVhazsKIAlk
ZWZhdWx0OgogCQlicmVhazsKIAl9CkBAIC02MzcsMTMgKzY0MSwyMiBAQCBpbnQgYW1kZ3B1X3Jh
c19lcnJvcl9pbmplY3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaWYgKCFvYmopCiAJ
CXJldHVybiAtRUlOVkFMOwogCi0JaWYgKGJsb2NrX2luZm8uYmxvY2tfaWQgIT0gVEFfUkFTX0JM
T0NLX19VTUMpIHsKKwlzd2l0Y2ggKGluZm8tPmhlYWQuYmxvY2spIHsKKwljYXNlIEFNREdQVV9S
QVNfQkxPQ0tfX0dGWDoKKwkJaWYgKGFkZXYtPmdmeC5mdW5jcy0+cmFzX2Vycm9yX2luamVjdCkK
KwkJCXJldCA9IGFkZXYtPmdmeC5mdW5jcy0+cmFzX2Vycm9yX2luamVjdChhZGV2LCBpbmZvKTsK
KwkJZWxzZQorCQkJcmV0ID0gLUVJTlZBTDsKKwkJYnJlYWs7CisJY2FzZSBBTURHUFVfUkFTX0JM
T0NLX19VTUM6CisJCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJvcigmYWRldi0+cHNwLCAmYmxv
Y2tfaW5mbyk7CisJCWJyZWFrOworCWRlZmF1bHQ6CiAJCURSTV9JTkZPKCIlcyBlcnJvciBpbmpl
Y3Rpb24gaXMgbm90IHN1cHBvcnRlZCB5ZXRcbiIsCiAJCQkgcmFzX2Jsb2NrX3N0cihpbmZvLT5o
ZWFkLmJsb2NrKSk7Ci0JCXJldHVybiAtRUlOVkFMOworCQlyZXQgPSAtRUlOVkFMOwogCX0KIAot
CXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJvcigmYWRldi0+cHNwLCAmYmxvY2tfaW5mbyk7CiAJ
aWYgKHJldCkKIAkJRFJNX0VSUk9SKCJSQVMgRVJST1I6IGluamVjdCAlcyBlcnJvciBmYWlsZWQg
cmV0ICVkXG4iLAogCQkJCXJhc19ibG9ja19zdHIoaW5mby0+aGVhZC5ibG9jayksCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCBkNzkwMmU3ODJiZTQuLjIwNjE3NjcxMGY3
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCkBAIC01NjA3LDYgKzU2MDcs
OCBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3Byb2Nlc3NfcmFzX2RhdGFfY2Ioc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCiB7CiAJLyogVE9ETyB1ZSB3aWxsIHRyaWdnZXIgYW4gaW50ZXJydXB0
LiAqLwogCWtnZDJrZmRfc2V0X3NyYW1fZWNjX2ZsYWcoYWRldi0+a2ZkLmRldik7CisJaWYgKGFk
ZXYtPmdmeC5mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KQorCQlhZGV2LT5nZnguZnVuY3Mt
PnF1ZXJ5X3Jhc19lcnJvcl9jb3VudChhZGV2LCBlcnJfZGF0YSk7CiAJYW1kZ3B1X3Jhc19yZXNl
dF9ncHUoYWRldiwgMCk7CiAJcmV0dXJuIEFNREdQVV9SQVNfVUU7CiB9Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
