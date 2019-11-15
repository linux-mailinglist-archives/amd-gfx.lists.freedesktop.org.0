Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47CFE347
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Nov 2019 17:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A1D6E789;
	Fri, 15 Nov 2019 16:50:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5698D6E789
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 16:50:52 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id g12so3998521qvy.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Nov 2019 08:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=aB/x2PS5Hzu0jxbD6yN92td6kBGk46FaK2u74qHvhswZ9gtgztoXG6nANgHS9gA/QP
 l+SgHEdg13AznO+XdvGpAbcGGVKkkY+dqvQprxBDEhYk6KVzQBP9rXXJvyssG/3E0wFa
 YtZY35+Oy8kKsDxkIhz7Ovjba7GCB8LIoL4lxvd2ohFFwVV3Gb6Jw50qn0He13qhBrvW
 mdR/f45wLD8vPceRPT6NLNfKy+3zmiWmbNueeUpBMadrixXCsb1XTrMjjQK5uocZ02iv
 qJ2mG7e7uLAwVRWhStDz7TTfkN5/3fqrC8EblfEnTP0dpYMA0Lkf64npl9kb2Viy/XOg
 GOZA==
X-Gm-Message-State: APjAAAVchw7z+IEdMN07uH5odFBU9qNamn/3OzXUfVb+PURfKBOOwsD0
 Wiz1tlP4bvZb7yI5Ivez694Kfyt7
X-Google-Smtp-Source: APXvYqzIJBJjrqEqFDHmoEOEXR4A7cfcdvI6IY8kxc6EW+m0uNexQg2eWAUb/hGwQLmNQvxzSI2HUA==
X-Received: by 2002:a0c:baad:: with SMTP id x45mr13031398qvf.230.1573836651089; 
 Fri, 15 Nov 2019 08:50:51 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r29sm5610331qtb.63.2019.11.15.08.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 08:50:50 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 lukas@wunner.de
Subject: [PATCH 04/20] drm/amdgpu: add supports_baco callback for CIK asics.
Date: Fri, 15 Nov 2019 11:50:22 -0500
Message-Id: <20191115165038.56646-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115165038.56646-1-alexander.deucher@amd.com>
References: <20191115165038.56646-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GbGxDJNQTBvT+RJ5ap+7ma9iXB0z5sr7CNysFxEASlY=;
 b=T4e+JcaCaipIGs2bYKlT2agWcdfSsedYGPShtxV8DxNp9XoEBObLDfjEUR0wp8ts0Z
 fsTQW2bNaNazBTW/7N5bKGOL5IkN09BZ/1sAssBfYFBplAzXlIZ8DxkXWJzIwLtODEjm
 otZ/sR8H9fZaJWelpljYSco1WVv65TYZMj9yR95d0lGt1I8595QAHaSw57JWJ9sxYKh2
 fOWnWW9bUWZSwhlC5sgVdagulV/rh2hnlAbKR6hWv72nl13r03rgNKhBkjo/4IrOk+yq
 B56rdRI313oU3WicGgJ1eNXjLRf4d487DDfZsJ7cJJMy23uv1RwuJYGK6S9n6DyNYZDa
 RAUA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QkFDTyAtIEJ1cyBBY3RpdmUsIENoaXAgT2ZmCgpDaGVjayB0aGUgQkFDTyBjYXBhYmlsaXRpZXMg
ZnJvbSB0aGUgcG93ZXJwbGF5IHRhYmxlLgoKUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYyB8IDE4ICsr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2Npay5jCmluZGV4IDJkNjRkMjcwNzI1ZC4uOTY4YmM3MDZiOTRkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWsuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9jaWsuYwpAQCAtMTMxMCw2ICsxMzEwLDIzIEBAIHN0YXRpYyBpbnQg
Y2lrX2FzaWNfcGNpX2NvbmZpZ19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAly
ZXR1cm4gcjsKIH0KIAorc3RhdGljIGJvb2wgY2lrX2FzaWNfc3VwcG9ydHNfYmFjbyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlib29sIGJhY29fc3VwcG9ydDsKKworCXN3aXRjaCAo
YWRldi0+YXNpY190eXBlKSB7CisJY2FzZSBDSElQX0JPTkFJUkU6CisJY2FzZSBDSElQX0hBV0FJ
SToKKwkJc211N19hc2ljX2dldF9iYWNvX2NhcGFiaWxpdHkoYWRldiwgJmJhY29fc3VwcG9ydCk7
CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCWJhY29fc3VwcG9ydCA9IGZhbHNlOworCQlicmVhazsK
Kwl9CisKKwlyZXR1cm4gYmFjb19zdXBwb3J0OworfQorCiBzdGF0aWMgZW51bSBhbWRfcmVzZXRf
bWV0aG9kCiBjaWtfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiB7CkBAIC0xODk5LDYgKzE5MTYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2lj
X2Z1bmNzIGNpa19hc2ljX2Z1bmNzID0KIAkuZ2V0X3BjaWVfdXNhZ2UgPSAmY2lrX2dldF9wY2ll
X3VzYWdlLAogCS5uZWVkX3Jlc2V0X29uX2luaXQgPSAmY2lrX25lZWRfcmVzZXRfb25faW5pdCwK
IAkuZ2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJmNpa19nZXRfcGNpZV9yZXBsYXlfY291bnQsCisJ
LnN1cHBvcnRzX2JhY28gPSAmY2lrX2FzaWNfc3VwcG9ydHNfYmFjbywKIH07CiAKIHN0YXRpYyBp
bnQgY2lrX2NvbW1vbl9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
