Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2CAD85E
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 13:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71BB89B4D;
	Mon,  9 Sep 2019 11:59:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B5389B4D
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 11:59:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l16so13467167wrv.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Sep 2019 04:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CvZdREjmY22hHP3CLGC9PpRjWXMExy+mvlAzLIXFDw=;
 b=RmVbbeaf1a3kDmvqAJoYyMic2eS3vsv+hNNJZD9TOJnGl+tn0rfrL6hr2gC2i0s4dp
 7J63zX/LfQGHD2raoaeEwV1nT7PK/X0dko1pwjEcAE25BEq0LW0erE2aA/ZERdSoxPcx
 cNsi6D6a/LTFOd3hGSNLuEZpbRcBq7eY9i6DkdLZWEkn4f2V+PI0bapCXsnVjg+Gr9Xs
 UGhQ6CRgr/YZ0H6qv6ALFASV1FHfS1M7FQLRH5oVx7XFbr4AXGGx9gy7DdB+wKz5pnqh
 MgQWwjqOXvg0/0PH5A2QbMqIAsjByChgbWAoePPB+t3h/9mwqxlBx21ZD05sZo/4xp3M
 Dr4w==
X-Gm-Message-State: APjAAAUkh4BAstUfaZ36hUZo7a4sdUp0tr0Mme0jyGGzu12LX0FIcW9p
 GhLf0NegzYLjscKC/25R39c82BqE
X-Google-Smtp-Source: APXvYqwWiRYfPCulQ/BwEDI7utKmlqrYQEnJrhj8F4wYvcmAgFbYDguwv4yhMV5pcqBPUy4xeXcNbg==
X-Received: by 2002:adf:db0f:: with SMTP id s15mr4140081wri.120.1568030349382; 
 Mon, 09 Sep 2019 04:59:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d17a:c60b:3903:7f77])
 by smtp.gmail.com with ESMTPSA id d18sm16711927wra.91.2019.09.09.04.59.08
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 04:59:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: grab the id mgr lock while accessing
 passid_mapping
Date: Mon,  9 Sep 2019 13:59:07 +0200
Message-Id: <20190909115908.43755-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CvZdREjmY22hHP3CLGC9PpRjWXMExy+mvlAzLIXFDw=;
 b=cxR7G++U1jPiW3uJc/Be/akEeTYqy9Ke7saEh1Ty6DZ8EgQ3pt/ibFq5YEB0nT7t86
 3Yb4puSJBxWtdRJAeI3esq1Muuc+dqvn4v4EEx0a1U5McuHSnEx0WjepZQphhlX7+bVs
 xyHLS8bTj+g2IOa9dY4oGu47t/mxr4DzRM5VjaxoaQB+WpulksD681AtC8zPiTgBcW3l
 t5FTsu/HMoKXxp+YhHzlQ2Hy/3uL6WmP4s05L17oeBVNN1HHyzmlbjUzxqSEmhm8xqCk
 dfE71vnDXsGdqf9SHjZ4aKI/DKhQIUtGzhs/BQGyXbK4EDx1hUSoTesjhEl5p59noc0y
 VuHA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmVlZCB0byBtYWtlIHN1cmUgdGhhdCB3ZSBhY3R1YWxseSBkcm9wcGluZyB0aGUgcmlnaHQgZmVu
Y2UuCkNvdWxkIGJlIGRvbmUgd2l0aCBSQ1UgYXMgd2VsbCwgYnV0IHRvIGNvbXBsaWNhdGVkIGZv
ciBhIGZpeC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8
IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IGIyODVh
YjI1MTQ2ZC4uZTExNzY0MTY0Y2JmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dm0uYwpAQCAtMTAzNiwxMCArMTAzNiw4IEBAIGludCBhbWRncHVfdm1fZmx1c2goc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCBzdHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLCBib29sIG5lZWRfCiAJCWlk
LT5vYV9iYXNlICE9IGpvYi0+b2FfYmFzZSB8fAogCQlpZC0+b2Ffc2l6ZSAhPSBqb2ItPm9hX3Np
emUpOwogCWJvb2wgdm1fZmx1c2hfbmVlZGVkID0gam9iLT52bV9uZWVkc19mbHVzaDsKLQlib29s
IHBhc2lkX21hcHBpbmdfbmVlZGVkID0gaWQtPnBhc2lkICE9IGpvYi0+cGFzaWQgfHwKLQkJIWlk
LT5wYXNpZF9tYXBwaW5nIHx8Ci0JCSFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoaWQtPnBhc2lkX21h
cHBpbmcpOwogCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKKwlib29sIHBhc2lkX21h
cHBpbmdfbmVlZGVkOwogCXVuc2lnbmVkIHBhdGNoX29mZnNldCA9IDA7CiAJaW50IHI7CiAKQEAg
LTEwNDksNiArMTA0NywxMiBAQCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkXwogCQlwYXNpZF9tYXBw
aW5nX25lZWRlZCA9IHRydWU7CiAJfQogCisJbXV0ZXhfbG9jaygmaWRfbWdyLT5sb2NrKTsKKwlp
ZiAoaWQtPnBhc2lkICE9IGpvYi0+cGFzaWQgfHwgIWlkLT5wYXNpZF9tYXBwaW5nIHx8CisJICAg
ICFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoaWQtPnBhc2lkX21hcHBpbmcpKQorCQlwYXNpZF9tYXBw
aW5nX25lZWRlZCA9IHRydWU7CisJbXV0ZXhfdW5sb2NrKCZpZF9tZ3ItPmxvY2spOworCiAJZ2Rz
X3N3aXRjaF9uZWVkZWQgJj0gISFyaW5nLT5mdW5jcy0+ZW1pdF9nZHNfc3dpdGNoOwogCXZtX2Zs
dXNoX25lZWRlZCAmPSAhIXJpbmctPmZ1bmNzLT5lbWl0X3ZtX2ZsdXNoICAmJgogCQkJam9iLT52
bV9wZF9hZGRyICE9IEFNREdQVV9CT19JTlZBTElEX09GRlNFVDsKQEAgLTEwODgsOSArMTA5Miwx
MSBAQCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0
IGFtZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkXwogCX0KIAogCWlmIChwYXNpZF9tYXBwaW5nX25l
ZWRlZCkgeworCQltdXRleF9sb2NrKCZpZF9tZ3ItPmxvY2spOwogCQlpZC0+cGFzaWQgPSBqb2It
PnBhc2lkOwogCQlkbWFfZmVuY2VfcHV0KGlkLT5wYXNpZF9tYXBwaW5nKTsKIAkJaWQtPnBhc2lk
X21hcHBpbmcgPSBkbWFfZmVuY2VfZ2V0KGZlbmNlKTsKKwkJbXV0ZXhfdW5sb2NrKCZpZF9tZ3It
PmxvY2spOwogCX0KIAlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKIAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
