Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1769648DDB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC5D8930F;
	Mon, 17 Jun 2019 19:17:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D391D89319
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:34 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so12135230qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wqngp2HHRGo+qktI6TqlOu/8Q+OADYVtagEVSU8byE=;
 b=rKh8NCG1egB7+2W5HnoZGc9M6OaNJuaYo8+4Jtf8XQ8R5Enj0GETYyxhj4Zp9EvV3l
 9ApamwRgYzyHUa8PuqGr6cfMjbZ3xw9scykNi0SjC2aUgQPw5rsPLikUyV9opAg5k3jK
 YZ2RzdkYfcCHXNnIZjOogCL747YdP0OpN1Nkk+W/ky0ZW8FRJG1RX6CBT3UVVVMCnR7J
 MJjz7pj1F8URQuXwCsA7LAEGuQ1+vnQqIxxINS/5hQOaREGg303mnsCTIIleeqFfFbju
 7cNpdcsnnCBmaAZwx3XgOGso2y0pgoL1QnDBy2FiumbO/A2kxF+W1A+7j56H81afo3Lh
 x0dg==
X-Gm-Message-State: APjAAAUv7JfFPlRbKtsUSVcvL73vGIC8t2mutZe0dFyMBR2eHtOIJeXE
 CnfZ8sINANFwsk7gTVH74wm4h0pkO6Q=
X-Google-Smtp-Source: APXvYqwhf4rBbhNQ3ItUHQkZ3qeks+q8IRy271c8NvgwqyxglnOV09vkRtJwdP4SQJWE7O6dZSnKTg==
X-Received: by 2002:a0c:b07b:: with SMTP id l56mr22978236qvc.114.1560799053813; 
 Mon, 17 Jun 2019 12:17:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 030/459] drm/amdgpu: query vram_width from vram_info table
Date: Mon, 17 Jun 2019 14:09:51 -0500
Message-Id: <20190617191700.17899-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wqngp2HHRGo+qktI6TqlOu/8Q+OADYVtagEVSU8byE=;
 b=GK/WGd8QTrHoec2W9sLnLRQryYKkmuhHKUKLzHgPVIhuaqTgceMDD3+ZnjxsndLcDL
 Qolj0c+TIZeWX49q0mvlN98Lv7t67th8HnVyHtRmS6hjt0SrOtQju52PQpv0oLr5wUwH
 RZHoLELF4PtA8fSYer97/ANwA/S2lLtW94jYWI3mCQ6u9gCrmrxErCC9UIzopzsa6XiV
 GSMa8HaUMFMI9CuWUQj8qmIClbdcl5bJ+TRj+QaPDelpsfHcb0CpoyWgkOpZ9DFiRhzN
 xrUCFr7P1FX0BtToF9LpBpxSDHBU6v9c+ljK2cxAv2CWFrh1nk8ldHIVhIA3IepSvhAY
 zudg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKRHJpdmVyIHdpbGwg
Z2V0IGNoYW5uZWxfbnVtYmVyIGFuZCBjaGFubmVsX3dpZHRoIGZyb20KdnJhbV9pbmZvIHRhYmxl
LCB0aGVuIGNhbGN1bGF0ZSB2cmFtX3dpZHRoIGJ5IG11bHRpcGx5CmNoYW5uZWxfbnVtYmVyIGJ5
IGNoYW5uZWxfd2lkdGgKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiAu
Li4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tZmlybXdhcmUuYyAgfCA0NiArKysrKysr
KysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRv
bWZpcm13YXJlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13
YXJlLmMKaW5kZXggNDEwMTE4ZGYxNmVkLi42MDZlZDgxOWYzNTUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdG9tZmlybXdhcmUuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWZpcm13YXJlLmMKQEAgLTEyNywyMiArMTI3
LDUwIEBAIHVuaW9uIHZyYW1faW5mbyB7CiBpbnQgYW1kZ3B1X2F0b21maXJtd2FyZV9nZXRfdnJh
bV93aWR0aChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlzdHJ1Y3QgYW1kZ3B1X21v
ZGVfaW5mbyAqbW9kZV9pbmZvID0gJmFkZXYtPm1vZGVfaW5mbzsKLQlpbnQgaW5kZXggPSBnZXRf
aW5kZXhfaW50b19tYXN0ZXJfdGFibGUoYXRvbV9tYXN0ZXJfbGlzdF9vZl9kYXRhX3RhYmxlc192
Ml8xLAotCQkJCQkJaW50ZWdyYXRlZHN5c3RlbWluZm8pOworCWludCBpbmRleDsKIAl1MTYgZGF0
YV9vZmZzZXQsIHNpemU7CiAJdW5pb24gaWdwX2luZm8gKmlncF9pbmZvOworCXVuaW9uIHZyYW1f
aW5mbyAqdnJhbV9pbmZvOworCXUzMiBtZW1fY2hhbm5lbF9udW1iZXI7CisJdTMyIG1lbV9jaGFu
bmVsX3dpZHRoOwogCXU4IGZyZXYsIGNyZXY7CiAKKwlpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNf
QVBVKQorCQlpbmRleCA9IGdldF9pbmRleF9pbnRvX21hc3Rlcl90YWJsZShhdG9tX21hc3Rlcl9s
aXN0X29mX2RhdGFfdGFibGVzX3YyXzEsCisJCQkJCQkgICAgaW50ZWdyYXRlZHN5c3RlbWluZm8p
OworCWVsc2UKKwkJaW5kZXggPSBnZXRfaW5kZXhfaW50b19tYXN0ZXJfdGFibGUoYXRvbV9tYXN0
ZXJfbGlzdF9vZl9kYXRhX3RhYmxlc192Ml8xLAorCQkJCQkJICAgIHZyYW1faW5mbyk7CisKIAkv
KiBnZXQgYW55IGlncCBzcGVjaWZpYyBvdmVycmlkZXMgKi8KIAlpZiAoYW1kZ3B1X2F0b21fcGFy
c2VfZGF0YV9oZWFkZXIobW9kZV9pbmZvLT5hdG9tX2NvbnRleHQsIGluZGV4LCAmc2l6ZSwKIAkJ
CQkgICAmZnJldiwgJmNyZXYsICZkYXRhX29mZnNldCkpIHsKLQkJaWdwX2luZm8gPSAodW5pb24g
aWdwX2luZm8gKikKLQkJCShtb2RlX2luZm8tPmF0b21fY29udGV4dC0+YmlvcyArIGRhdGFfb2Zm
c2V0KTsKLQkJc3dpdGNoIChjcmV2KSB7Ci0JCWNhc2UgMTE6Ci0JCQlyZXR1cm4gaWdwX2luZm8t
PnYxMS51bWFjaGFubmVsbnVtYmVyICogNjQ7Ci0JCWRlZmF1bHQ6Ci0JCQlyZXR1cm4gMDsKKwkJ
aWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkgeworCQkJaWdwX2luZm8gPSAodW5pb24gaWdw
X2luZm8gKikKKwkJCQkobW9kZV9pbmZvLT5hdG9tX2NvbnRleHQtPmJpb3MgKyBkYXRhX29mZnNl
dCk7CisJCQlzd2l0Y2ggKGNyZXYpIHsKKwkJCWNhc2UgMTE6CisJCQkJbWVtX2NoYW5uZWxfbnVt
YmVyID0gaWdwX2luZm8tPnYxMS51bWFjaGFubmVsbnVtYmVyOworCQkJCS8qIGNoYW5uZWwgd2lk
dGggaXMgNjQgKi8KKwkJCQlyZXR1cm4gbWVtX2NoYW5uZWxfbnVtYmVyICogNjQ7CisJCQlkZWZh
dWx0OgorCQkJCXJldHVybiAwOworCQkJfQorCQl9IGVsc2UgeworCQkJdnJhbV9pbmZvID0gKHVu
aW9uIHZyYW1faW5mbyAqKQorCQkJCShtb2RlX2luZm8tPmF0b21fY29udGV4dC0+YmlvcyArIGRh
dGFfb2Zmc2V0KTsKKwkJCXN3aXRjaCAoY3JldikgeworCQkJY2FzZSAzOgorCQkJCW1lbV9jaGFu
bmVsX251bWJlciA9IHZyYW1faW5mby0+djIzLnZyYW1fbW9kdWxlWzBdLmNoYW5uZWxfbnVtOwor
CQkJCW1lbV9jaGFubmVsX3dpZHRoID0gdnJhbV9pbmZvLT52MjMudnJhbV9tb2R1bGVbMF0uY2hh
bm5lbF93aWR0aDsKKwkJCQlyZXR1cm4gbWVtX2NoYW5uZWxfbnVtYmVyICogKDEgPDwgbWVtX2No
YW5uZWxfd2lkdGgpOworCQkJY2FzZSA0OgorCQkJCW1lbV9jaGFubmVsX251bWJlciA9IHZyYW1f
aW5mby0+djI0LnZyYW1fbW9kdWxlWzBdLmNoYW5uZWxfbnVtOworCQkJCW1lbV9jaGFubmVsX3dp
ZHRoID0gdnJhbV9pbmZvLT52MjQudnJhbV9tb2R1bGVbMF0uY2hhbm5lbF93aWR0aDsKKwkJCQly
ZXR1cm4gbWVtX2NoYW5uZWxfbnVtYmVyICogKDEgPDwgbWVtX2NoYW5uZWxfd2lkdGgpOworCQkJ
ZGVmYXVsdDoKKwkJCQlyZXR1cm4gMDsKKwkJCX0KIAkJfQogCX0KIAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
