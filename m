Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E352A48EDB
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B249899F3;
	Mon, 17 Jun 2019 19:28:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7CE899F3
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:13 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p144so6919897qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8szw9bSfjG/9Kb618q4rbfvZc0OYXEuUq5DAP1fFtY0=;
 b=GLluDevcc5SEy15Y2uezWYG0r2Bj/H7K7UQDrs6FTNmC8O9Ei9Xqt9PSLyJzy1n0EU
 p35vYwhqULeliA115FDpi4ZJ+DQmYOpD2TOxHOkdM5L8XdGob17rXH39/Q+qUk+cHgUX
 ff0t2g+UyU8+TxcEQEh60ZHO1cxp67u10IacwbxcUZkB5sgErhpv6+BVl+aUrzMbG9yo
 83SCiY6RSq5bAoNGH9Rwr8VMqViB/tzIu/N5tuASe1S9hJixm4NpesOcBbOJjnCHNUAY
 q6MyMrMDzreJcFV1A/e5hycXBpZaVFMWDCm3nuhqvIvmdU2mCzzsR4Gz+wa+C0Yqi/pE
 WEvA==
X-Gm-Message-State: APjAAAVJ2fsIqmpFCuN2H5PIovlR4lTXG9OXd+BNeIrH74iw21xXDLch
 oM/yR0FdtAynVqhcowqjNXoi1sKPkr8=
X-Google-Smtp-Source: APXvYqyHwucNUcYqSacnU1ciDz8yxXXDluA/LriLD+UEsEcmNXPiT0apvp8cmzyFtacjjDK+46Tn3Q==
X-Received: by 2002:a05:620a:124c:: with SMTP id
 a12mr91111887qkl.336.1560799692127; 
 Mon, 17 Jun 2019 12:28:12 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 164/459] drm/amd/powerplay: remove duplicate code from smu hw
 init
Date: Mon, 17 Jun 2019 14:26:29 -0500
Message-Id: <20190617192704.18038-65-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8szw9bSfjG/9Kb618q4rbfvZc0OYXEuUq5DAP1fFtY0=;
 b=RQg9EW7SIScod+RYjb6KFp/WVgxZz6+axZNew9VFSb5wLz1aRLID3VMMvv4kED8PJu
 EJl4CK4I5PBrAEvrKjMeHMOXMAuIR/kh4SFB8hjwwQcWgKA6M+pvdWlXiiK+fCRhJO0z
 f8DQZtQvMANTV5MznlLFpa6Ggexvtgcz0afh/nandmlRHQu8ynKXS8ETlTtoILZ7g7AG
 5DpUbQ4Zz1sQ64g5h2FudLNVyy4R2XqoKRH4+1HQtCMtb2MKunMHo7xNwjdy5fB8Pxbx
 CT3xhiGe9ejMHP1x4hcCScunutWgiomx9XJYiFxQ9AIatPc+K9ucTNrKut4eLHimW8cc
 klag==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCnJlbW92ZSBkdXBsaWNhdGUg
Y29kZSAodW4tdXNlZCkgaW4gc211CgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEu
d2FuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyB8IDQg
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IDJkZTY3ZTE2ZTVlMy4uYTQ4Y2E2YTQzNTNj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC02Mzcs
MTAgKzYzNyw2IEBAIHN0YXRpYyBpbnQgc211X3NtY190YWJsZV9od19pbml0KHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAogCQlpZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAotCQlyZXQgPSBzbXVf
Z2V0X2Nsa19pbmZvX2Zyb21fdmJpb3Moc211KTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7
Ci0KIAkJLyoKIAkJICogY2hlY2sgaWYgdGhlIGZvcm1hdF9yZXZpc2lvbiBpbiB2YmlvcyBpcyB1
cCB0byBwcHRhYmxlIGhlYWRlcgogCQkgKiB2ZXJzaW9uLCBhbmQgdGhlIHN0cnVjdHVyZSBzaXpl
IGlzIG5vdCAwLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
