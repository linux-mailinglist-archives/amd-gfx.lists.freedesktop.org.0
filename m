Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0848E0E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16208955D;
	Mon, 17 Jun 2019 19:18:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A7895C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:21 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id m29so12209657qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wYUJQ9IZFtINZSZiT/EvLbc/BVevI76ny5a/Mc5G27w=;
 b=T0nE4UqAquaDMap7VaLs6Uj2qPG3rZYdJ3bq0XI65SvFHxKcrQQkIz4xnXKVad4HS0
 8Nf096YIUjbOJgIggcYRJS6SNlVtch73mnfEFUUOgaCLfq+oVPiAh5eyhQMA591jal8E
 R6QiCcSI5sOf/200n0ze2zovYff9isLO5xNfWdN984TPnG1wK33jd6I8Zu0bKkcMAbbJ
 r5dadQRjrMTb4cePUhlspbQISl8GJQ+f2suz5mTI/t6zisfT+8XUvjPPgV5HV+8zGjzR
 9NSa7xftR0N2Q5EDaMRWiJuHyQUfa+9Ae2anFxOPLpLlMaKRmU7IIQT7WZ7HuRT6GT/e
 7d7g==
X-Gm-Message-State: APjAAAXm8FW5FRFlYHxCv3mi6X/RJvysnQfj3sAjKA8S/aR/h2lnTuGF
 PUMDAixkha+h8a99ZGtKTR/J521wn5s=
X-Google-Smtp-Source: APXvYqxYWWPE8G3X8/DqnSbAeAGyQ0/g5E3Uov6VptLsYZg1DmcoKrSpxbMwxhw96qKgMJqslztLOg==
X-Received: by 2002:a0c:a944:: with SMTP id z4mr22496409qva.92.1560799100452; 
 Mon, 17 Jun 2019 12:18:20 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 081/459] drm/amdgpu/psp: skip mec jt when autoload is enabled
Date: Mon, 17 Jun 2019 14:10:42 -0500
Message-Id: <20190617191700.17899-70-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wYUJQ9IZFtINZSZiT/EvLbc/BVevI76ny5a/Mc5G27w=;
 b=PLcntqfA+TBPTZ06aDxCfDDhXzbSzFpu6JLUcC3nk/uWLpiEYhC35K/WNkE7V6Sgyn
 tfDkn0LnzZfuaCVGkiU5AJHddrFLqRYsbSg7fw9WmT3PqMxuj/fu6MCzquldwejbNbHd
 m6DWU5ypZwHk7AXXjy1t5PR88cxhN4A0Q52gtRiXZ17Ergvh7WQtmA5+be43wTg+RCS8
 59rd4mcwIWvaHAEiAK7IF8o9xUr7oyfez2VWWCSciLnxb8cPS0fajCdNzeFrMy0X3soc
 IWQ7lazOdA5ZPS6GUZIRYpEC9E4qL2fQ+2mYg8uiXOEUaurxoqxgKXI9CR679aUOakY2
 5wlQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKV2hlbiBhdXRvbG9h
ZCBpcyBlbmFibGVkLCB0aGVyZSBpcyBubyBuZWVkIHRvIGxvYWQgbWVjIGp0LApSTEMgd2lsbCBo
YW5kbGUgaXQgYXV0b21hdGljYWxseQoKU2lnbmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPgpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5NYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3BzcC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
c3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwppbmRleCBmNGU0
ZDdiOTE4YzguLmQ2MDA5NzcyYWQ4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYwpAQCAtOTM5LDYgKzkzOSwxMSBAQCBzdGF0aWMgaW50IHBzcF9ucF9md19sb2FkKHN0
cnVjdCBwc3BfY29udGV4dCAqcHNwKQogCQkgICAgfHwgdWNvZGUtPnVjb2RlX2lkID09IEFNREdQ
VV9VQ09ERV9JRF9STENfRykpCiAJCQkvKnNraXAgdWNvZGUgbG9hZGluZyBpbiBTUklPViBWRiAq
LwogCQkJY29udGludWU7CisJCWlmIChwc3AtPmF1dG9sb2FkX3N1cHBvcnRlZCAmJgorCQkgICAg
KHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfQ1BfTUVDMV9KVCB8fAorCQkgICAg
IHVjb2RlLT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfQ1BfTUVDMl9KVCkpCisJCQkvKiBz
a2lwIG1lYyBKVCB3aGVuIGF1dG9sb2FkIGlzIGVuYWJsZWQgKi8KKwkJCWNvbnRpbnVlOwogCiAJ
CXJldCA9IHBzcF9wcmVwX2xvYWRfaXBfZndfY21kX2J1Zih1Y29kZSwgcHNwLT5jbWQpOwogCQlp
ZiAocmV0KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
