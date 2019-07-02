Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBE45D781
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD66E081;
	Tue,  2 Jul 2019 20:29:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420BB6E07F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:38 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i34so11580qta.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZP04Rf9N0mWWsVak4h4EzXbgnYIBGlNT2QIdZMbJ/U=;
 b=JbyUGS3q1hLi0jVH2Ed/z/wW4kNRZqiHB0My30DSl6tnX+/xxt886HPH4KJT11+6vZ
 JRFwyfcrDqMAN+wOMu+UbXA9XMOxUFj5U8tKjdahUILL6zEAO4wGZc64hUP2jUJ7djf3
 sjS2JVRcdtEyFrWSHRUcTTgZrO/3UKmlKMMKltEbky9ANzO0bjo/MAAf83MH0WjO0Hs9
 E6Qm7uKqMjg/fsMoDuOxv3Y7UKjCney9YvloepufoafSGnxw4xtvJiqCqGeXnbdw8ESL
 mW9MhrVsPuT3+0aVoTN+p7omwLlZlE8b5oNe118i6bIXtTjYBr1MW8n1MMwOMB515C8i
 L5zA==
X-Gm-Message-State: APjAAAXb6cbKxqRUObp5DfWbe/q7pA/mm88DmHe5Kl10uP27Fdw+/b9s
 yw+H44XlLIVh9JldEm9fj2xLUZlkdM0=
X-Google-Smtp-Source: APXvYqxQvOj7I/Xtct/YUHGa/3cD8KYtoDsShdnjWTuJEuaw/ucaLwBPCdjaIexST6oBMeRd+yz1jA==
X-Received: by 2002:ac8:6898:: with SMTP id m24mr26984587qtq.362.1562099377283; 
 Tue, 02 Jul 2019 13:29:37 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 47/53] drm/amd/display: disable display writeback for navi14
Date: Tue,  2 Jul 2019 15:28:38 -0500
Message-Id: <20190702202844.17001-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZP04Rf9N0mWWsVak4h4EzXbgnYIBGlNT2QIdZMbJ/U=;
 b=b2FerWd605AIa7VT/tBnLjKY7JcjpAiNEzIrgz3JZ0Zf/lL33Kpu6b9Lw7UAQGx4wx
 EQXlxCV/nedhNnCaf4EEObBbut1jM6LvC1ORvI+rkzrNwIizpa5I+Pw6sGuOhELfl+rI
 AUGGX7WGa7tAdjekrnQ7CWp5hGa9WYcTF+vezksh80X1gqrVb5WHmgR8cbAwOUk3tOXY
 ipY7tZVuziSsleDeKsEku9L9THRo43fTAlUeGOaKDbkJtDoKPL9zCYV9tmVniRnxYH2n
 X97SHrsCKmg8aX2KMkFia++0aQTbN/ABZByDJgsu6zvsYunagXyi6r2KvoVIfaRljzZh
 biaQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCm5vdCB1c2VkLgoKU2ln
bmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KQWNrZWQtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1
YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMKaW5kZXggYzM5MTE1MDFhMmMwLi4z
ODVhMzZmNTFmNDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5jCkBAIC03MDAsNyArNzAwLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCByZXNvdXJjZV9jYXBzIHJlc19jYXBfbnYxNCA9IHsKIAkJLm51bV9hdWRpbyA9IDYs
CiAJCS5udW1fc3RyZWFtX2VuY29kZXIgPSA1LAogCQkubnVtX3BsbCA9IDUsCi0JCS5udW1fZHdi
ID0gMSwKKwkJLm51bV9kd2IgPSAwLAogCQkubnVtX2RkYyA9IDUsCiB9OwogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
