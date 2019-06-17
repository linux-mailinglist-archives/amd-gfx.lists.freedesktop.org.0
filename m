Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BC49027
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB61E89FC3;
	Mon, 17 Jun 2019 19:47:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3476F89FA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:47:18 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id d15so6991522qkl.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nEkN0GCHNHQh29IYvK+VPTMAs0osIQsg/un8RrI8pfQ=;
 b=D0LK2tzVYKlJNBd+f2LxDzrOe8Wo9hPAKwqW7ynInjSSIhtFfcuEFIP22rS9R99xQ4
 lUEtHNpV6/ElMXLuQ2wDzhhEzUmmyglcqcxi9KOM/QaRn5xa+MG0rq0wmjvlWOS2V5Fm
 nqMHuvmwDYCcbFjH/Lh1bVL+BNlb5ko0W3+fi+J2VouUD/aa8RZv5vcq24ISLRJSpRXn
 k7Y5zIXdaL7rZOxo4AFhDvOAnfd55Dd+8qyVQiLx3ymuiAJEuAr8LRefbBxB3LDiO2Wo
 MY5wuWcA+kFbmP6NaBrevQ+okcrJcm5Hl3cqFNiOyOwtFWDuh1x4UVk0p85KxTjjrCi3
 1fxg==
X-Gm-Message-State: APjAAAXKIpgvWpqZlVex7P18PRrbhSBMGX2OrTYl1sCSEUTP+aj+1CGE
 kBbzKipVBr0D7itEcviCQluNHaphhJ9exQ==
X-Google-Smtp-Source: APXvYqyb5toy6VMfit0KzqOAxg0+nPOX1urHgwsq5BuiPWycobkE5S2mr7tOeNq1LRBJNgebzxKo+Q==
X-Received: by 2002:a37:87c5:: with SMTP id
 j188mr68892898qkd.106.1560800837218; 
 Mon, 17 Jun 2019 12:47:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.47.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:47:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 381/459] drm/amd/display: Fix DCFCLK and SOCCLK not set
Date: Mon, 17 Jun 2019 14:45:22 -0500
Message-Id: <20190617194540.18497-82-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nEkN0GCHNHQh29IYvK+VPTMAs0osIQsg/un8RrI8pfQ=;
 b=kyImdcEQv5Gklwc1Wul2cNx0d1V2ZSGkUt77W+HKevJeI/VjIy1oWwTcJnoikajDL4
 CFZX+tS2SttdMKuuIGBVmva/9LZ4Qkc7Vxv6y5bfy1SndsJNfKKeOz0fhuVUBQ8wYn/c
 A46eOwNUixoSky3M5HqX6dxhebbKf0jS5TAm3/2eKMUE6/W0O+UmZRsxw4HkyHKqpBng
 8Wpyy3CmkNItYnPhD4wekO6kQzsgvSp6yRG17289BLnawcomS8UuqMvmGx6qQK7RNjri
 SRNkC8mNraWQgqTgPmY49nCRrA51qUtiAAB6InnSwMSQlBY8bgrXvYgRAl3K3u28KZmk
 PeTQ==
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKW1doeV0KSWYgdm9s
dGFnZSBsZXZlbCA+IDAsIERDRkNMSyBhbmQgU09DQ0xLIGNvdWxkIGJlIDAgZHVyaW5nIERNTApj
YWxjdWxhdGlvbnMsIHdoaWNoIGVuZGVkIHVwIGNhdXNpbmcgYW4gYXNzZXJ0LgoKW0hvd10KSW5p
dGlhbGl6ZSBkY2ZjbGtfbWh6IGFuZCBzb2NjbGtfbWh6IHZhbHVlcyBhY2NvcmRpbmcgdG8gdGhl
CnZvbHRhZ2UgbGV2ZWwuCgpTaWduZWQtb2ZmLWJ5OiBJbHlhIEJha291bGluIDxJbHlhLkJha291
bGluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0
eXVzaGtpbkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0
IExha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAv
ZGNuMjBfcmVzb3VyY2UuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMKaW5kZXggYWEwNGRmNjQ1MjJmLi5kYzNhYTdkZWJhZDUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5j
CkBAIC0yMTM2LDYgKzIxMzYsMTAgQEAgYm9vbCBkY24yMF92YWxpZGF0ZV9iYW5kd2lkdGgoc3Ry
dWN0IGRjICpkYywKIAlpZiAocGlwZV9jbnQgIT0gcGlwZV9pZHgpCiAJCXBpcGVfY250ID0gZGNu
MjBfcG9wdWxhdGVfZG1sX3BpcGVzX2Zyb21fY29udGV4dChkYywgJmNvbnRleHQtPnJlc19jdHgs
IHBpcGVzKTsKIAorCXBpcGVzWzBdLmNsa3NfY2ZnLnZvbHRhZ2UgPSB2bGV2ZWw7CisJcGlwZXNb
MF0uY2xrc19jZmcuZGNmY2xrX21oeiA9IGNvbnRleHQtPmJ3X2N0eC5kbWwuc29jLmNsb2NrX2xp
bWl0c1t2bGV2ZWxdLmRjZmNsa19taHo7CisJcGlwZXNbMF0uY2xrc19jZmcuc29jY2xrX21oeiA9
IGNvbnRleHQtPmJ3X2N0eC5kbWwuc29jLmNsb2NrX2xpbWl0c1t2bGV2ZWxdLnNvY2Nsa19taHo7
CisKIAkvKiBvbmx5IHBpcGUgMCBpcyByZWFkIGZvciB2b2x0YWdlIGFuZCBkY2Yvc29jIGNsb2Nr
cyAqLwogCWlmICh2bGV2ZWwgPCAxKSB7CiAJCXBpcGVzWzBdLmNsa3NfY2ZnLnZvbHRhZ2UgPSAx
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
