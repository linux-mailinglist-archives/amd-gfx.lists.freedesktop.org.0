Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF0B48E1A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A76189668;
	Mon, 17 Jun 2019 19:18:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B542A89654
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:28 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id p15so12198555qtl.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ilxwjtfoc8BOpfA2ZzVzD4GYyvapigvD6Qwxxo/sKhI=;
 b=CGeSMXjDoIZF/xdIMDM9CW+R/9DOvsyzXAchfiyfde+iaUhXcVE21WrDSlaC3ZEAGN
 up8/hJ6J4L08O8J+W5E8SPfrMoyRpQ89W4mEXNQTQR9zhFtiHbR6IKTw9BdWFgciPjpE
 q9VLH6akbnlc3IGdDqobZOjG5eVzoSzeyyG2uj8s4/fVhBWGtgr2aVd2lD3s7/XlkeLq
 IQuWlf2URk6Y4pmgNhWYzrfK6eGN4sxcJvL28M76c+5O/XbyUC/G+wCO/snJM2BbADTb
 8fKGYvoHKQ1LgNP41kr5N3wY599T2in8MQb0EnKxpT13P4K6mku6WIvaF2HajuVKKQAc
 3esQ==
X-Gm-Message-State: APjAAAXie8XUl3jIs4Ec+olSFQbprYibGHbrUPH7LvXs6WheJKZabie1
 pwRrCLlF/tu0BzBsvSyEr3YSBHFZUvA=
X-Google-Smtp-Source: APXvYqwE5pTvc+cxTzHI5UYJnz1TG7Uq/jChwIMkaUGUQHSHS/sQ/VQqZqM8uWUDWsi4QstGeqaMKg==
X-Received: by 2002:a0c:86c3:: with SMTP id 3mr22530699qvg.12.1560799107473;
 Mon, 17 Jun 2019 12:18:27 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 089/459] drm/amdgpu: Add new ring interface preempt_ib
Date: Mon, 17 Jun 2019 14:10:50 -0500
Message-Id: <20190617191700.17899-78-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ilxwjtfoc8BOpfA2ZzVzD4GYyvapigvD6Qwxxo/sKhI=;
 b=rpgeLbAulI13Mjk71QJuUBfY9DxYbzDCui2FyRkdmjNRIX3OGYtYovZ0TkNouuqT8g
 L2TbLr+le36P6Ba4ZgSxr+B4f2wcU06vWjrFdYBvp72nIMXdC2QQHgRZsriHaClXrdM+
 bi28zRrDd9qbXQw/c/h9mTTpGjRcG4P6XYCQ4vqifdS9iaoO4nH4V4Qk2SgtWS6pLVPN
 erroQT/1BwAGTVpyMwHOgGEr3l6drBDxEeUtQpoIFsk4IMpC0o7bRKegW0Td2jKNpcIz
 ocTJj8AafwyQD+tR1Hy1oo31hhjcjzQJnaD5hHEmISTWIoHSjMvoVKVQBWHGNBXiwkA1
 IE1Q==
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
 Rex Zhu <Rex.Zhu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgoKVXNlZCB0byB0cmlnZ2VyIHByZWVtdHB0
aW9uCgpBY2tlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBSZXggWmh1IDxSZXguWmh1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphY2sg
WGlhbyA8SmFjay5YaWFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfcmluZy5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oCmluZGV4IDBmNDk3ZmEyMTNhYS4u
NTI5YmExYmRkYTU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgK
QEAgLTE3Miw2ICsxNzIsNyBAQCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVuY3MgewogCQkJICAgICAg
ZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpb3JpdHkpOwogCS8qIFRyeSB0byBzb2Z0IHJlY292
ZXIgdGhlIHJpbmcgdG8gbWFrZSB0aGUgZmVuY2Ugc2lnbmFsICovCiAJdm9pZCAoKnNvZnRfcmVj
b3ZlcnkpKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgdm1pZCk7CisJaW50ICgq
cHJlZW1wdF9pYikoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsKIH07CiAKIHN0cnVjdCBhbWRn
cHVfcmluZyB7CkBAIC0yNTAsNiArMjUxLDcgQEAgc3RydWN0IGFtZGdwdV9yaW5nIHsKICNkZWZp
bmUgYW1kZ3B1X3JpbmdfcGFkX2liKHIsIGliKSAoKHIpLT5mdW5jcy0+cGFkX2liKChyKSwgKGli
KSkpCiAjZGVmaW5lIGFtZGdwdV9yaW5nX2luaXRfY29uZF9leGVjKHIpIChyKS0+ZnVuY3MtPmlu
aXRfY29uZF9leGVjKChyKSkKICNkZWZpbmUgYW1kZ3B1X3JpbmdfcGF0Y2hfY29uZF9leGVjKHIs
bykgKHIpLT5mdW5jcy0+cGF0Y2hfY29uZF9leGVjKChyKSwobykpCisjZGVmaW5lIGFtZGdwdV9y
aW5nX3ByZWVtcHRfaWIocikgKHIpLT5mdW5jcy0+cHJlZW1wdF9pYihyKQogCiBpbnQgYW1kZ3B1
X3JpbmdfYWxsb2Moc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBuZHcpOwogdm9p
ZCBhbWRncHVfcmluZ19pbnNlcnRfbm9wKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMy
X3QgY291bnQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
