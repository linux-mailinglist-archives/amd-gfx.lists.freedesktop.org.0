Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBA4905A
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B176E051;
	Mon, 17 Jun 2019 19:50:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1146E04A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:18 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c11so6984547qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yj0U2kPsdi68VsFU0D+HlhoI9asrk2LFdK0dtaW++lg=;
 b=iCkMW0YVXBGG3VKC02CtDZa9B9vf3ptit0cbdkPvL2MAqri81XsRmU1az2JIJ96GD+
 NAYR6o/p8WgHxP1umAeDmzckdLxDCbzqM/c8KLaEZ0Pf+L5LdImdIPGSXekXNtYoprL9
 9ETkEEs1/MYpmBYltdZl5l+lyR85Cu7RhrTcUoEJlEGfeNOuReSj7cW+v9zx/15jr4tg
 fpmf5tNy2LgcqShzIfe7Iu6nPD8hpjolQeCM9AuCnRTJigOWUeCRpDROMVKezkrMbP6S
 21bQ4M+TY5WHEqf1lwnvdT0Ks6cxVs6EMCJzesC2fXCICGW1R7Mm/NifABfscQ/48PJV
 EiJQ==
X-Gm-Message-State: APjAAAX4YFWhH4X3puoOe7WCO+DUtuJbRGQ8MvLjxnZy0SUJrcwClVEG
 KRka5v59RNXfXljaCFmiQC+yi87GqWEa4g==
X-Google-Smtp-Source: APXvYqzXIObzSMPoZFNy+abymdkJS97WYEcf04yUaeNXdLhRmb9bNmxRAkzWAoNzd4FEBqI8MEaTfg==
X-Received: by 2002:a37:c45:: with SMTP id 66mr72916605qkm.31.1560801017108;
 Mon, 17 Jun 2019 12:50:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 420/459] drm/amd/display: Expose send immediate sdp message
 interface
Date: Mon, 17 Jun 2019 14:49:09 -0500
Message-Id: <20190617194948.18667-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yj0U2kPsdi68VsFU0D+HlhoI9asrk2LFdK0dtaW++lg=;
 b=N5lXCvAhwH2IAxtPieddfSRN3/Ag/fuhHF9Umd0W/c6OLz5DogdJfNQ5Dm0GUQHhiu
 AfK+ihXh6uVn+jb4J93Us2Td55/UXo4cW3zdPX9zj/Elgk/ZTREg+K33V6MVmx9hrDfq
 xjt+8XbbXO2tQ46iLxXiLIVkRs+XAZS/Ytxy7kjIPdYUclxMSzVt67RsS/1sL8wJBvi7
 kZ73bOApBJ82bE+aVbLnkWBd9aV0RaxPZp3Qk29bZb98B4R6dLTM/twuRId6bGrvnHLB
 rZbzk3EjVfG8EHf1JXseOKZDXHd/piHLBXvkrZnlbOdyFW8eZnsX+6R8eNeY10w242EF
 wlDw==
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
 Bhawanpreet Lakha <BhawanpreetLakha@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIkxlbyAoSGFuZ2hvbmcpIE1hIiA8aGFuZ2hvbmcubWFAYW1kLmNvbT4KCltXaHldClRv
IHNlbmQgc2RwIG1lc3NhZ2UgaW1tZWRpYXRlbHkgZnJvbSBhIHNpbmdsZSBzbG90LgoKW0hvd10K
TW9kaWZ5IHRoZSBnZW5lcmljIFNEUCBtZXNzYWdlIGludGVyZmFjZSwgYW5kIHVzZSBHU1A0IHRv
IHNlbmQgaW1tZWRpYXRlCnNkcCBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogTGVvIChIYW5naG9u
ZykgTWEgPGhhbmdob25nLm1hQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8
SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3
YW5wcmVldCBMYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjX3N0cmVhbS5oIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19zdHJlYW0uaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19zdHJlYW0uaAppbmRleCAwYTgzY2QzNmQ1MDYu
LmUyNTNhNWM1OTFmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjX3N0cmVhbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY19zdHJl
YW0uaApAQCAtMTI2LDcgKzEyNiw2IEBAIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgewogCXN0cnVj
dCBkY19pbmZvX3BhY2tldCB2cnJfaW5mb3BhY2tldDsKIAlzdHJ1Y3QgZGNfaW5mb19wYWNrZXQg
dnNjX2luZm9wYWNrZXQ7CiAJc3RydWN0IGRjX2luZm9fcGFja2V0IHZzcF9pbmZvcGFja2V0Owot
CXN0cnVjdCBkY19pbmZvX3BhY2tldCBkcHNkcF9pbmZvcGFja2V0OwogCiAJc3RydWN0IHJlY3Qg
c3JjOyAvKiBjb21wb3NpdGlvbiBhcmVhICovCiAJc3RydWN0IHJlY3QgZHN0OyAvKiBzdHJlYW0g
YWRkcmVzc2FibGUgYXJlYSAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
