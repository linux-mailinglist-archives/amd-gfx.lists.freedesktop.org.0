Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C330F5D779
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F786E072;
	Tue,  2 Jul 2019 20:29:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9194E6E06B
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:31 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id m14so15480165qka.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLvW7MemCDetUmJWQ1Hjt8KLQDmaELcVyMKwADJryMI=;
 b=kTH6GsOJNUALHAxyNvAabUoAxpPhivdswUdbgDjSWrEYdO200zk8lc/alSScpy4hHI
 5an7m8ka1cT6DzIdaDNAnl3RAwZqoa6VnHfzZkM4Ai28JMGO8UEgSM6OHZ2gRCX3St+c
 BIAch2ESOJDlk3MAgVG5MP6Zz7tBKKqTwmS+chwpNX9+fQg2MhRILEVSeg14EYgNJtJT
 7/ePvzxP5zIEH7dmIW7YYQNKvUle0Ii345jRx8WnsoON2sc6FAr4PK9+KXIDZo7rDYEW
 obQfyzEVm54END459W+ycMtiQO7DyhQ0n4S/x6VcjaKPLrJvENQCpLQESu82pPMfq5AU
 B3hg==
X-Gm-Message-State: APjAAAXiQmXS7zz15yg4SiPmw7N6EXw9rqZZzwANY9Dqt3lx557GDXCu
 H8MoYboYwVE2GrtJ0YQahHIL9jbBsmc=
X-Google-Smtp-Source: APXvYqwgkFuQMUZUVptE5Nd3X/JTMIXVMiLtU54W0fix2ejbHTKkSTtMfKC9F3x56kS0FjS4WYvQSQ==
X-Received: by 2002:a37:4ad7:: with SMTP id x206mr28118768qka.85.1562099370336; 
 Tue, 02 Jul 2019 13:29:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 39/53] drm/amdgpu: skip to load ta firmware for navi14
Date: Tue,  2 Jul 2019 15:28:30 -0500
Message-Id: <20190702202844.17001-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLvW7MemCDetUmJWQ1Hjt8KLQDmaELcVyMKwADJryMI=;
 b=Mm9e2q5hrTwSIpD/Et1r3yceXcsmdB36LgNlrwaBkd0ridUmhiV6u4tdeRYk1v8vNc
 0rwxiWJcZd5Y+Q942itmDI6KMpkk/rOZLZbXMh0RASyaRvb7OHS8HeSJTle4jYxC7RH1
 aew1c3byMqJ6JvKNW0byzH57hdlWRUjZ8DDcxsrVIDMCwpkHVFNMg0ltLgBwPnprCad+
 EQWNnVghSsguf3l5+YYn9qXmsmzAFwLIyRTNLTmYyMqOs8zwLkMevxmBzCaP8+TW8yJ1
 7hne3bzupyFE9r9RpqL6Ng10otXWEexxz5qn5yGkw5Qydnv8g4rfKuoiTt5fRD9U5YDH
 RehQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCk5vdCByZWxldmFudCBv
biBuYXZpMTQuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8w
LmMKaW5kZXggZjdmYmM4NDRhODk0Li43ZTcwNzBkNTUzMDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3BzcF92MTFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTFfMC5jCkBAIC0xNTcsNiArMTU3LDcgQEAgc3RhdGljIGludCBwc3BfdjEx
XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IHBzcF9jb250ZXh0ICpwc3ApCiAJCX0KIAkJYnJlYWs7
CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTE0OgogCQlicmVhazsKIAlkZWZh
dWx0OgogCQlCVUcoKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
