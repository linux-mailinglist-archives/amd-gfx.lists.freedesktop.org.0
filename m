Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BACE6A03C
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 03:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72F6E044;
	Tue, 16 Jul 2019 01:27:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737A689F2A
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 01:27:54 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r4so13199604qkm.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 18:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pp+4oDIDhnGMTS4mECGQFAhih0BVFjr725AbyWgg7Uw=;
 b=QKyFP3LZ2P/koZ4q6OX22yajgG961mxgKBDUFytKWutVyszT+cYPr2rqbCwa81C1Pg
 pU61WsRhaib/Hq2UkMgjXajxlrnLC+jHvqigCcx1ib+IT9ilPRlJ+VHljaU8M9uGEpyW
 PlcFN8RScIFg4K9+V7sTFyGoE7uJdrqg/W7w8qL1ChWdrr0rg/zmk61VgTaNher5iRED
 Vhco5+fE3W17aKT6OWg+d+IVGKEB6kCqmPZnXrwf5UNT+4vpwsKEaQ0rQdutNXrRBKTi
 x+c6BbB9P8KrKYhWCxJxsrhL8Bpuj6ddjcL2mLI2705lybmqXVw5USH8em1vitHfjt6x
 aLCg==
X-Gm-Message-State: APjAAAXYgItSSU6SPnNVNBYYQGvgxYJY6V/EAbvqOspdlFjLLJyo0nxA
 k7H7M3pcHMTaTgvThLVzmX2wO8oJ
X-Google-Smtp-Source: APXvYqzOjzzcv7l2zQxDl8Dt5F0AK4uwEEEHxunEsKuTULlG3cWK2cUMUFv8Y4jXJGKRHF2ks6edPg==
X-Received: by 2002:a37:9dc8:: with SMTP id
 g191mr19391191qke.431.1563240473399; 
 Mon, 15 Jul 2019 18:27:53 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q17sm4285380qtl.13.2019.07.15.18.27.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 18:27:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 095/102] drm/amdkfd: Add device id for real asics
Date: Mon, 15 Jul 2019 20:27:34 -0500
Message-Id: <20190716012741.32036-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190716012741.32036-1-alexander.deucher@amd.com>
References: <20190716012741.32036-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pp+4oDIDhnGMTS4mECGQFAhih0BVFjr725AbyWgg7Uw=;
 b=MVPLxBxdFZVS+j8Y1D6VQc11q53zVk01tePQA+iIkYED/J0nphDuc444X8BMTZiTN1
 aNSiH9R2mxpIfpwqJaFXXN3QL9JJ/W74YwuOS+LCiOYQX7Inox4jgO9C7n/gPT0w/lXG
 5v8R0iLraJLxia7/y7Ws1V8iYkQSKoosqiUknWBnEVQ8myLqUlJ7vaj08Evju4wApwTt
 RUwQ2hXoWcgDmMojhGlt5w1eOc3PIUXD1oFXnHGLu0zvpnUWQwqoH87d0aOrsICoQtfp
 K3ZsHwxZRrcWMlu+dyqMWbEKPfsRuR//RUGlhh+cvZXNiX4e4rZoQnUwOYF2O4j3Q25j
 Posw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBPYWsgWmVu
ZyA8T2FrLlplbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggYzNjZDY4M2UxZTk3Li4zYjlm
ZTYyOWExMjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZp
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKQEAgLTQ2
OSw3ICs0NjksOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRf
ZGV2aWNlc1tdID0gewogCXsgMHg2NmE0LCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZlZ2Ey
MCAqLwogCXsgMHg2NmE3LCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZlZ2EyMCAqLwogCXsg
MHg2NmFmLCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZlZ2EyMCAqLwotCS8qIE5hdmkxMCAq
LworCXsgMHg3MzhDLCAmYXJjdHVydXNfZGV2aWNlX2luZm8gfSwJLyogQXJjdHVydXMgKi8KKwl7
IDB4NzM4OCwgJmFyY3R1cnVzX2RldmljZV9pbmZvIH0sCS8qIEFyY3R1cnVzICovCisJeyAweDcz
OEUsICZhcmN0dXJ1c19kZXZpY2VfaW5mbyB9LAkvKiBBcmN0dXJ1cyAqLwogCXsgMHg3MzEwLCAm
bmF2aTEwX2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLwogCXsgMHg3MzEyLCAmbmF2aTEwX2Rl
dmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLwogCXsgMHg3MzE4LCAmbmF2aTEwX2RldmljZV9pbmZv
IH0sCS8qIE5hdmkxMCAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
