Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7C469E56
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46BD6E02A;
	Mon, 15 Jul 2019 21:26:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFC46E027
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:26:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n11so17269702qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUPQqZE2w/Y4oYNR49+C55pl9246ICL1UxHaUzqMMl8=;
 b=fdNpDl2+S/Okg9yik3EclKcL0/4gWiXKaUEH6BWmklKKOSPWhibucwkeasCOGV3YgP
 YuZ42vxIApgcAxQ2PPKaRKDZ6H6w2S62yfIighh62eKKpbl0tJeiB3+o+zegfQmWqDS5
 vmybQj7GCTuIkwMUN3vPP58a0rKqymqdbDKJYonq5gU8HuMhjeHqyXG4IwJxA/8yU1u/
 oEi/A2tnjQbmUg0Tz3fAbR/VSDUu5BPA0/cb8KZKIbfHCvY2nPUGxJGW8z8RqyA/0UR3
 V6cNwo3kIrSVVtY7OMO9obCHMftN9xZvdfNTLp1McEyz89eXq+e0xcoLH2xTQ//FBidq
 rvQA==
X-Gm-Message-State: APjAAAV6baZ1KmfKk1UXbDK91XAeC3lLdU2R5vskJL7xFa8PKUMJ8Gt9
 WYF0hOtwVP0YRkGl5BaS+hKr32hn
X-Google-Smtp-Source: APXvYqwXDFFvUZEACzX8XdHhF0urrgUqsUWXe/2elTPMEswyqvcW8olRj5o7j2SfCBFTFwAqWB1uxA==
X-Received: by 2002:a0c:d981:: with SMTP id y1mr21265544qvj.104.1563225967702; 
 Mon, 15 Jul 2019 14:26:07 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.26.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:26:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 090/102] drm/amdgpu: clean up nonexistent firmware declaration
 for Arcturus
Date: Mon, 15 Jul 2019 16:24:25 -0500
Message-Id: <20190715212437.31793-88-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUPQqZE2w/Y4oYNR49+C55pl9246ICL1UxHaUzqMMl8=;
 b=uz2t9m+k8U4Ihvzz+FBf+5lN3lKsAY/p9kKFauuWhKfusSXIihYJ7gra1NwOeicdfH
 rY5Ra0Jj51QTy/dwZ8pUtbFs7ePDhA0XyYRxoSaEFr9ryprdNtbO5DI7aQ6TxdYy+/TB
 5yoxWVR84kQ75a2KEWqxoyzcrMqxNVH1QPPbuvw54vyKavRWMo3q8/PzswgEX+zO0ysL
 6SsBnngdOJRa4BsMyX5kIcFuaEopqIzrcpyDJArgKY8L53BxN6NMsTPe9QVrq6L9M2vI
 My3gY35s0Zh/z1HUNOjFBt6ur6ivNwfsXEB323NHyF9VPDT2FBgL1vvy0rRXYAqsuTsY
 824A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDJm
NTUzNTk1YTg5OC4uODFmODk2YjRhYTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
OV8wLmMKQEAgLTEwMCw5ICsxMDAsNiBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbjJf
bWVjMi5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3JhdmVuMl9ybGMuYmluIik7CiBN
T0RVTEVfRklSTVdBUkUoImFtZGdwdS9yYXZlbl9raWNrZXJfcmxjLmJpbiIpOwogCi1NT0RVTEVf
RklSTVdBUkUoImFtZGdwdS9hcmN0dXJ1c19jZS5iaW4iKTsKLU1PRFVMRV9GSVJNV0FSRSgiYW1k
Z3B1L2FyY3R1cnVzX3BmcC5iaW4iKTsKLU1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L2FyY3R1cnVz
X21lLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfbWVjLmJpbiIpOwog
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNfbWVjMi5iaW4iKTsKIE1PRFVMRV9GSVJN
V0FSRSgiYW1kZ3B1L2FyY3R1cnVzX3JsYy5iaW4iKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
