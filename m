Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA66B49079
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AFE6E07D;
	Mon, 17 Jun 2019 19:50:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142FD6E062
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:43 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so12342831qtu.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8PFrIbksEO05VZC3Cp52Fqc9jRk7zIPE7Hc6L7jel4=;
 b=V7HrXKT6lZKF3LmeUu0vF9CWnLaIQ8bgYIVsLokKaHm+R1XjAYoMCqNTf+pEqBHnMq
 SWf/UbCHKtRKXtpp3G4M2zEMwfJB4YyYNmuFgHJ/5uyt61KxUiyxMM9NVrcJoPylG0nx
 OGXyyRGCVpV594AT99sntPh9amQ2As+4byjrLi5s5Z/VyjgwdTj/DnAOhTFtLJ12CQld
 m2jXZYsIbbBtZCTsA4YRj4cwxppXzuOK82GALmPVzuRpWxxktP3nyZN6/1rg3rKupaSa
 wXuUBjQ/TxDzBuLUhN2bPb1zOWpeICLh30bEXJDEIUIbS+BUfhaGVqyAupbGDmJuitIh
 i+zA==
X-Gm-Message-State: APjAAAUftzxS2IJIrrlfu5mvqM3OfOEkUhbxwbIdEQsF2ElU6v7tZE65
 f5KRIqT7Ec56rUuAr58u5R040Pn0R9h6ZA==
X-Google-Smtp-Source: APXvYqwZsFP94nJ9midzBJd6QdsUfZklOOPC1DP0PoZV69iQYAcWMQFpLZx5nEmmwGUuQjTNqeIx9Q==
X-Received: by 2002:a0c:b012:: with SMTP id k18mr23405492qvc.74.1560801042110; 
 Mon, 17 Jun 2019 12:50:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 446/459] drm/amd/display: Alpha plane type
Date: Mon, 17 Jun 2019 14:49:35 -0500
Message-Id: <20190617194948.18667-47-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8PFrIbksEO05VZC3Cp52Fqc9jRk7zIPE7Hc6L7jel4=;
 b=g7NWZGwQtriXkgyhhkyYwppgiDHEuJrWEs6Ak5BlIkuMbrvkGeUtQNQoY3XMBSg9d5
 NYwrxpByPGaowJiPWZNdB8rMc8UKkUzwUVab48YSEi7muz0oM2h5svEsUR0Am/X7YDPv
 LwU/SUAMLQViXer0AiFnnKxoqoNqC2aFgmjHXH5xGrDqmHlb3MvxeVELyDwDOLUljU35
 WcAQLMm10Mv+uXjE8LAuI4T4F0yy4KwAlWLTWksa09u9XxNtxRDP7XQSlAGagU9Zu1UC
 +v05IfmJFpZM9+LrwAAQ0tEQel016C1JyAtu0io052LfeOTkbAYQz25Ur+fmAALxPOXs
 YpaA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CgpBZGQgQWxwaGEg
c3VyZmFjZSB0eXBlIGZvciBmdXR1cmUgdXNlCgpTaWduZWQtb2ZmLWJ5OiBFcmljIEJlcm5zdGVp
biA8ZXJpYy5iZXJuc3RlaW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBMYWt0eXVzaGtp
biA8RG15dHJvLkxha3R5dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWto
YSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24xMC9kY24xMF9odWJwLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9odWJwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfaHVicC5oCmluZGV4IGI4YTRiZmNkYmViMi4uOTFkYzQyZTU4MGVjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHVicC5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9odWJwLmgKQEAgLTQ1OSw2
ICs0NTksNyBAQAogCXR5cGUgUk9UQVRJT05fQU5HTEU7XAogCXR5cGUgSF9NSVJST1JfRU47XAog
CXR5cGUgU1VSRkFDRV9QSVhFTF9GT1JNQVQ7XAorCXR5cGUgQUxQSEFfUExBTkVfRU47XAogCXR5
cGUgU1VSRkFDRV9GTElQX1RZUEU7XAogCXR5cGUgU1VSRkFDRV9GTElQX01PREVfRk9SX1NURVJF
T1NZTkM7XAogCXR5cGUgU1VSRkFDRV9GTElQX0lOX1NURVJFT1NZTkM7XAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
